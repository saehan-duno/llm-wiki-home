#!/usr/bin/env bash
# 나루 세션 시작 시 하단 팀원 3명을 맞춘다: 마루=Claude, 가람=Codex, 다솜=agy
# herdr 밖이면 아무것도 하지 않는다. 이미 3명이 있거나 최근 실행했으면 건너뛴다.
command -v herdr >/dev/null 2>&1 || exit 0
[ -n "$HERDR_PANE_ID" ] || exit 0

lock="${TMPDIR:-/tmp}/team-up.lock"
if [ -f "$lock" ] && [ $(( $(date +%s) - $(stat -c %Y "$lock" 2>/dev/null || echo 0) )) -lt 180 ]; then exit 0; fi
touch "$lock"

list=$(herdr agent list 2>/dev/null)
# herdr가 세션을 복원하면 이전 팀원 pane이 에이전트 없는 빈 쉘로 되살아난다.
# 라벨이 마루·가람·다솜인데 agent가 없는 pane은 중복이므로 닫는다.
stale=$(herdr pane list 2>/dev/null | sed 's/{"agent/\n{"agent/g' \
  | grep -E '"label":"(마루|가람|다솜)"' | grep -v '"agent":"' \
  | grep -o '"pane_id":"[^"]*"' | cut -d'"' -f4)
for p in $stale; do herdr pane close "$p" >/dev/null 2>&1; done

missing=0
for n in maru garam dasom; do
  echo "$list" | grep -q "\"name\":\"$n\"" || missing=1
done
[ "$missing" = 0 ] && { echo "팀원 3명(마루·가람·다솜) 이미 구성됨"; exit 0; }
# 일부만 있으면 레이아웃을 건드리지 않고 알린다
echo "$list" | grep -Eq '"name":"(maru|garam|dasom)"' && { echo "팀원 일부만 실행 중: 수동 확인 필요"; exit 0; }

pid() { grep -o '"pane_id":"[^"]*"' | head -1 | cut -d'"' -f4; }
p1=$(herdr pane split --current --direction down --cwd 'C:\AI' --no-focus | pid)
p2=$(herdr pane split "$p1" --direction right --cwd 'C:\AI' --no-focus | pid)
p3=$(herdr pane split "$p2" --direction right --cwd 'C:\AI' --no-focus | pid)
herdr pane rename "$p1" 마루 >/dev/null; herdr pane rename "$p2" 가람 >/dev/null; herdr pane rename "$p3" 다솜 >/dev/null
fail=""
# 시작 실패 시 빈 pane이 남지 않도록 해당 pane을 닫는다
start() { herdr agent start "$1" --kind "$2" --pane "$3" --timeout 60000 >/dev/null 2>&1 || { herdr pane close "$3" >/dev/null 2>&1; fail="$fail $1"; }; }
start maru  claude "$p1"
start garam codex  "$p2"
start dasom agy    "$p3"
if [ -n "$fail" ]; then echo "팀원 시작 실패:$fail (빈 pane은 정리함)"; else echo "팀원 구성 완료: 마루(Claude) 가람(Codex) 다솜(agy)"; fi
