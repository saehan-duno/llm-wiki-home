---
title: herdr
type: entity
sources: [raw/herdr-readme.md, raw/herdr-docs-full.md]
updated: 2026-11-12
---

# herdr

코딩 에이전트(claude code, codex 등)를 여러 개 띄워 놓고 관리하기 위한 터미널 기반 런타임. tmux와 비슷하게 세션을 분리·재연결하고 pane을 나누지만, 에이전트 상태(working/blocked/idle) 표시와 에이전트가 직접 조작하는 CLI/소켓 API가 특징이다. (출처: [[herdr-readme]])

## 요약

| 항목 | 내용 |
|---|---|
| 저장소 | github.com/herdrdev/herdr |
| 구현 | Rust 단일 바이너리 |
| 라이선스 | Apache-2.0 |
| 설치 | 설치 스크립트, Homebrew, mise, Windows 스크립트, 릴리스 바이너리 |
| 문서 | herdr.dev/docs (일부 읽음, [[herdr-docs]]) |

## 핵심 개념

- 서버/클라이언트 분리: 서버가 터미널을 유지하므로 연결이 끊겨도 작업이 계속된다. 재부팅 후에는 레이아웃과 지원 에이전트 세션만 복원되고 프로세스 자체는 복원되지 않는다.
- 에이전트가 herdr를 도구로 쓴다(pane 생성, 에이전트 간 프롬프트, 대기).

## 상세 페이지

- 상태 보존: [[herdr-session-state]] — detach / 재시작 / 핸드오프별로 무엇이 살아남는지
- 에이전트 상태 감지: [[herdr-agent-status]] — 5가지 상태, 지원 에이전트, idle이 승인이 아니라는 한계
- Windows: [[herdr-windows]] — ConPTY 기반, 미지원 항목, 한국어 IME 관련 주의
- 문서 사이트 요약: [[herdr-docs]]

## 구조 요약 (문서 기준)

workspace(프로젝트) > tab > pane(실제 터미널). 서버가 pane을 소유하고 클라이언트는 UI. 이름 있는 session으로 서버를 완전히 분리할 수 있다. 원격은 저장한 SSH 머신(`herdr machine add`) 또는 `herdr --remote <host>`. 자동화는 에이전트 스킬, CLI, 소켓 API 3계층.

## 이 위키와의 관계

에이전트가 파일 시스템 위에서 위키를 유지하는 [[llm-wiki]] 패턴을 여러 에이전트로 돌릴 때 쓸 실행 환경 후보일 수 있으나, 이는 추측이며 어떤 소스에도 근거가 없다.

## 미확인

CLI reference, 설정 키 전체, 플러그인 구조, 키보드 바인딩 상세, 소켓 API 상세, 문제 해결 문서는 아직 읽지 않았다([[herdr-docs]]의 읽은 범위 표 참고). 보안 모델은 어느 소스에도 별도 설명이 없다.
