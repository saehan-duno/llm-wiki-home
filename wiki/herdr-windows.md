---
title: herdr Windows 지원
type: concept
sources: [raw/herdr-docs-full.md, raw/herdr-readme.md]
updated: 2026-11-13
---

# herdr Windows 지원

(출처: [[herdr-docs]]의 Windows support 문서, 전체 읽음)

- 상태: 문서는 네이티브 Windows 지원이 "generally available"이라고 한다. [[herdr-readme]]의 "beta"와 표현이 다르다.
- 구현: Unix PTY 대신 ConPTY. 릴리스는 `%USERPROFILE%\.herdr\packages\standalone\releases`에 설치된다. 설치 명령은 PowerShell `irm | iex`이며, 엔드포인트 보안이 막으면 `install.cmd` 경로가 있다.
- **지원**: 로컬 영속 세션, ConPTY pane, `cmd.exe` pane, `herdr --remote`와 저장 SSH 머신, 원격 클립보드 이미지, 에이전트 프로세스 트리 감지, 지원 integration(Pi, OMP, Claude Code, Codex, Copilot CLI, Devin, OpenCode, Kilo, Droid, Kimi, Qoder, Antigravity), pane 화면 기록. 플러그인은 preview.
- **부분 지원**: PowerShell의 `cd` 후 live cwd(OSC7 셸 통합은 지원), CJK IME 조합 위치, 한국어 IME의 prefix 입력 소스 전환(`[experimental] switch_ascii_input_source_in_prefix = true`, 한국어 IME만 해당), Kitty graphics(터미널 의존), 호스트 커서.
- **미지원**: `herdr terminal attach`, 라이브 서버 핸드오프([[herdr-session-state]]), Unix 포그라운드 프로세스 그룹, 로컬 네이티브 pane의 herdr 클립보드 이미지 브리지, 서명된 바이너리.
- 알려진 주의: 기본 `host_cursor="auto"`는 Windows에서 커서를 셀 내용으로 그려 IME 후보창 위치가 어긋날 수 있다. `[ui] host_cursor="native"`로 되돌리면 IME 위치는 맞지만 깜빡임이 재발할 수 있다. 텍스트 붙여넣기는 Windows Terminal에서 `ctrl+shift+v`.
- 권한: 관리자 권한으로 띄운 서버는 기본적으로 관리자 클라이언트만 받는다(`[server] allow_unelevated_clients`).
