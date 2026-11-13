---
title: herdr 세션 상태 보존 경로
type: concept
sources: [raw/herdr-docs-full.md, raw/herdr-readme.md]
updated: 2026-11-13
---

# herdr 세션 상태 보존 경로

[[herdr]]는 상황별로 다른 상태 보존 경로를 쓴다. (출처: [[herdr-docs]]의 Session state 문서, 전체 읽음)

| 경우 | 프로세스 유지 | 레이아웃 | 최근 화면 | 에이전트 대화 |
|---|---|---|---|---|
| detach 후 재접속 | 예 | 예 | 예(라이브 터미널) | 예(프로세스가 안 멈춤) |
| 서버 재시작 | **아니오** | 예 | pane 화면 기록을 켠 경우만 | 네이티브 에이전트 세션 복원이 되는 경우만 |
| 업데이트(`--handoff` 없음) | 호환 서버는 유지, 재시작 필요 서버는 중단될 수 있음 | 재시작 후 예 | 화면 기록 있을 때만 | 네이티브 복원만 |
| 업데이트 `--handoff` | 지원 서버에서 최선 노력 | 예 | 예(성공 시) | 예(성공 시) |

## 경로별 요점

- **스냅샷 복원**: 워크스페이스, 탭, pane, cwd, 레이아웃, 포커스만 복원한다. 실행 중이던 셸/서버/테스트는 복원되지 않고 저장 디렉터리의 새 셸로 돌아온다. `session.json`이 깨지면 `session-backups/`에 원본을 보존(최근 3개). 레이아웃 스냅샷은 `session-snapshots/`에 최대 48개(15분 간격 이상), 자동 복원은 없고 수동 복구 절차가 문서에 있다.
- **pane 화면 기록 재생**: 기본 꺼짐(`[experimental] pane_history = true`). 비밀·토큰이 포함될 수 있어 기본이 꺼져 있다. 레이아웃이 정확히 일치할 때만 재생한다.
- **네이티브 에이전트 세션 복원**: 기본 켜짐(`[session] resume_agents_on_restore`). 공식 integration이 세션 참조를 보고한 pane만 재개한다(예: `claude --resume <id>`, `codex resume <id>`). 에이전트별 최소 integration 버전이 정해져 있고 `herdr integration status`로 확인한다. 참조가 없거나 낡으면 일반 셸로 돌아온다.
- **라이브 핸드오프**: 서버를 교체하는 업데이트 때 pane PTY를 새 서버로 넘기는 실험적 옵션(`herdr update --handoff`). 진행 중이던 요청/대기/구독은 끊길 수 있다. Homebrew/mise/Nix 설치는 `herdr update`가 비활성이라 쓸 수 없고 Windows도 미지원([[herdr-windows]]).

## 주의

[[herdr-readme]]의 "서버 재시작 후 레이아웃 복원, 원래 프로세스는 생존하지 않음"과 일치한다.
