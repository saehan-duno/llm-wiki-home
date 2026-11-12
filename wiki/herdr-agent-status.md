---
title: herdr 에이전트 상태 감지
type: concept
sources: [raw/herdr-docs-full.md]
updated: 2026-11-12
---

# herdr 에이전트 상태 감지

(출처: [[herdr-docs]]의 Concepts·Agents 문서, 전체 읽음)

## 상태 값

`blocked`(입력/승인 필요), `working`, `done`(끝났지만 아직 안 봄), `idle`(끝났거나 대기, 확인됨), `unknown`. [[herdr-readme]]는 working/blocked/idle 셋만 언급했으나 문서에는 `done`, `unknown`도 있다. 클라이언트마다 Done 배지를 따로 추적하고, CLI/API는 서버 기준의 seen 상태를 쓴다. 상태는 pane → 탭 → 워크스페이스로 롤업된다(blocked가 가장 눈에 띔).

## 지원 방식 두 가지

1. **herdr가 지원**: 포그라운드 프로세스를 찾고 pane 하단 화면을 감지 매니페스트 규칙으로 읽는다. integration이 상태까지 보고하면 화면 대신 그것을 쓴다. Claude Code, Codex, Copilot CLI, Cursor, OpenCode, Pi, OMP, Droid, Devin, Kimi, Kilo, Hermes, Qoder, Qwen, Letta, MastraCode, Grok, Antigravity(이상 integration 있음)와 Amp, Kiro CLI, Maki, Gemini CLI, Cline(상태만, 마지막 둘은 덜 검증됨).
2. **에이전트가 herdr를 지원**: Command Code, Crush, Kiro CLI, Muse Code, Prime Agent 등이 스스로 상태를 보고. 설치할 것이 없다. 직접 만든 에이전트는 CLI/소켓 몇 번 호출로 합류할 수 있다고 한다(해당 문서는 미독).

## 한계 (문서가 직접 밝힘)

- blocked는 알려진 승인/질문 UI가 화면에 보일 때만 표시한다. 규칙이 없으면 `idle`로 폴백하므로, **idle은 승인이 아니다**. 낯선 프롬프트가 idle로 보인 채 자동화가 입력을 보내면 승인 대화상자에 타이핑될 수 있다.
- Antigravity와 Grok은 프롬프트로 돌아오면 백그라운드 작업이 남아 있어도 idle이다. `agent wait`는 에이전트 상태를 볼 뿐 그 작업의 완료는 보지 않는다.
- 샌드박스 래퍼가 프로세스를 가리면 `HERDR_AGENT=<agent>` 힌트가 필요하다.
- 셸이 pane 안에서 tmux를 자동 실행하면 herdr는 그 안의 에이전트를 보지 못한다(`HERDR_ENV` 검사로 회피).

## 운영

감지 매니페스트는 바이너리에 내장되고 herdr.dev에서 원격 갱신된다(`[update] manifest_check=false`로 끔). 로컬 오버라이드는 `~/.config/herdr/agent-detection/<agent>.toml`이 항상 우선. 상태가 틀리면 `herdr agent explain <target>`. 표시 이름은 `herdr agent rename`, 직접 붙기는 `herdr agent attach <name>`.
