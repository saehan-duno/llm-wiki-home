---
title: herdr 문서 사이트 (소스 요약)
type: source
sources: [raw/herdr-docs-full.md]
updated: 2026-11-12
---

# herdr 문서 사이트 (llms-full.txt)

- 원문: https://herdr.dev/llms-full.txt (문서 사이트의 전체 문서 묶음, 5,613줄, 안정 릴리스 0.9.5 기준)
- 대상: [[herdr]], 앞서 ingest한 [[herdr-readme]]의 상세판
- 수집 방식: curl로 받아 `raw/herdr-docs-full.md`에 저장 (원문 그대로).

## 읽은 범위

| 문서 | 상태 |
|---|---|
| 문서 홈, Concepts, Agents, Session state and restore | 전체 읽음 |
| Connecting machines, How to work, Windows support | 앞부분 위주로 읽음 |
| Socket API | 앞부분(계층, 스키마, 제어 가능 항목)만 읽음 |
| CLI reference, Config reference, Configuration, Integrations, Keyboard, Plugins, Marketplace, Persistence and remote, Quick start, Troubleshooting, Add support, Agent automation, Agent skill | 제목 목록만 확인, **미독** |

미독 부분은 아래 요약에 없다.

## 확인된 내용

- 모델: workspace(프로젝트) > tab(레이아웃) > pane(실제 터미널). 서버가 pane과 프로세스를 소유하고 클라이언트는 UI일 뿐이다. 이름 있는 session은 pane, 소켓, 상태를 완전히 분리한 별도 서버 네임스페이스다.
- 모드 3가지: terminal(키를 pane으로), prefix(기본 `ctrl+b` 다음 동작 키), navigate. 마우스 중심이며 `ui.mouse_capture=false`로 끌 수 있다.
- 에이전트 상태·감지는 [[herdr-agent-status]], 세션 보존 경로는 [[herdr-session-state]], Windows 지원은 [[herdr-windows]]에 정리했다.
- 원격: 저장한 SSH 머신을 로컬과 한 창에서 쓰고(`herdr machine add`), 머신마다 서버·세션이 독립이다. `herdr --remote <host>`는 로컬 UI로 원격 세션에 붙고(로컬 클립보드 이미지 붙여넣기 브리지 가능), 먼저 SSH로 들어가 `herdr`를 실행하면 전부 서버에서 돈다. 모바일 앱 없이 휴대폰 SSH 클라이언트로 같은 세션에 붙을 수 있다.
- 자동화 계층 3개: 에이전트 스킬, CLI 래퍼, 원시 소켓 API. `herdr api schema`로 JSON Schema를 얻을 수 있다.
- 에이전트용 온보딩: `https://herdr.dev/agent-guide.md`를 읽게 하는 프롬프트를 제공한다.

## README와의 차이

- [[herdr-readme]]는 Windows를 "beta installer"로 묘사하는 반면, 문서의 Windows 페이지는 "Native Windows support is generally available"이라고 한다. 문서 쪽이 더 구체적이고 최신으로 보이나 README가 갱신되지 않았을 가능성만 있을 뿐 확인된 것은 아니다.
- README는 지원 에이전트를 "claude code, codex, cursor, opencode, grok and the rest"로만 쓰지만 문서는 표로 20여 개를 열거한다.
- README의 `ctrl+b q` 분리와 "원래 프로세스는 서버 재시작 후 살아남지 않는다"는 문서와 일치한다.
