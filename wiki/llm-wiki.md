---
title: LLM 위키 패턴
type: concept
sources: [raw/karpathy-llm-wiki.md]
updated: 2026-11-12
---

# LLM 위키 패턴

LLM이 원본 소스를 읽고 상호 연결된 마크다운 위키를 **점진적으로 만들고 갱신**하는 개인 지식베이스 패턴. 위키는 "지속적으로 복리로 쌓이는 산출물"이다. 상호참조가 이미 있고, 모순이 이미 표시되어 있고, 종합이 지금까지 읽은 모든 것을 반영한다. ([[rag]]와의 차이)

## 3계층

1. **Raw sources** — 선별한 원본(글, 논문, 이미지, 데이터). 불변. LLM은 읽기만 한다. 진실의 원천.
2. **The wiki** — LLM이 전적으로 소유하는 마크다운 디렉터리(요약, 엔티티, 개념, 비교, 개요, 종합). 사람은 읽고 LLM이 쓴다.
3. **The schema** — 구조, 관례, 워크플로우를 LLM에게 알려 주는 문서(Claude Code는 `CLAUDE.md`, Codex는 `AGENTS.md`). LLM을 일반 챗봇이 아니라 규율 있는 위키 관리자로 만드는 핵심 설정이며, 사람과 LLM이 함께 발전시킨다.

## 역할 분담

- 사람: 소스 선별, 탐색, 좋은 질문, 의미 해석
- LLM: 요약, 상호참조, 정리, 장부 정리 전부
- 비유: [[obsidian]] = IDE, LLM = 프로그래머, 위키 = 코드베이스

연산은 [[ingest-query-lint]], 탐색 파일은 [[index-and-log]] 참고. 출처: [[karpathy-llm-wiki]].
