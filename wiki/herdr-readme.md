---
title: herdr README (소스 요약)
type: source
sources: [raw/herdr-readme.md]
updated: 2026-11-12
---

# herdr README

- 원문: https://cdn.jsdelivr.net/gh/herdrdev/herdr@master/README.md (jsDelivr가 제공하는 `herdrdev/herdr` master의 README 사본, 약 5KB, 전체 읽음)
- 대상: [[herdr]]
- 성격: 기능 소개와 설치 안내가 중심인 짧은 README. 세부 사용법은 herdr.dev/docs에 있으며 이 위키는 아직 읽지 않았다.

## 확인된 내용

- 한 줄 정의: "the runtime your coding agents live on" (코딩 에이전트가 사는 런타임).
- 주요 기능(README의 주장):
  - **분리(detach)**: 클라이언트를 닫거나 SSH가 끊겨도 백그라운드 서버가 터미널을 계속 실행한다. 서버/머신 재시작 후에는 저장된 레이아웃을 복원하고, 지원되는 에이전트 세션은 재개할 수 있다. 단 **원래 프로세스는 살아남지 않는다**.
  - **여러 머신, 한 창**: 로컬 작업과 저장된 ssh 머신을 합친 에이전트 목록으로 보여 주고 재연결은 각각 독립적이다.
  - **상태 표시**: 모든 pane이 working / blocked / idle로 표시되고, 에이전트가 답을 기다리며 멈추면 알려 준다.
  - **에이전트 네이티브**: 에이전트가 CLI와 소켓 API로 herdr를 조작한다(pane 생성, 서로에게 프롬프트, 다른 에이전트가 막힐 때까지 대기).
  - **기존 도구 그대로**: claude code, codex, cursor, opencode, grok 등. 래핑하거나 대체하지 않고 터미널을 소유한다.
  - 키보드(tmux 스타일 prefix 키)와 마우스(클릭, 드래그, 분할) 모두 지원, 플러그인(마켓플레이스), Rust 단일 바이너리(Electron 아님).
- 설치: `curl -fsSL https://herdr.dev/install.sh | sh`, `brew install herdr`, `mise use -g herdr`, Windows용 PowerShell 설치 스크립트(베타 문서 있음), GitHub releases 바이너리. 실행은 `herdr`, 분리는 `ctrl+b q`, 재연결은 다시 `herdr`.
- 소스 빌드: `cargo build --release`, 테스트는 `just test` / `just check`.
- 라이선스: Apache License 2.0. 문의: README에 기업/제휴용 이메일 기재.
- README는 AI 에이전트가 저장소를 고치기 전에 `AGENTS.md`, 이슈/PR 전에 `CONTRIBUTING.md`를 읽으라고 안내한다.

## 한계

- 성능, 보안 모델, 소켓 API 스키마, 지원 에이전트의 전체 목록은 README에 없다(문서 사이트로 링크만 있음).
- README 상단의 데모 영상은 텍스트로 확인할 수 없었다.
- 위 기능은 모두 프로젝트 자신의 설명이며 독립적으로 검증하지 않았다.
