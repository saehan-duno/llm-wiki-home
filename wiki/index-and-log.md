---
title: index.md와 log.md
type: concept
sources: [raw/karpathy-llm-wiki.md]
updated: 2026-11-12
---

# index.md와 log.md

[[llm-wiki]]가 커져도 탐색할 수 있게 해 주는 특수 파일 두 개. 목적이 서로 다르다.

- **index.md** — 내용 중심 카탈로그. 모든 페이지를 링크, 한 줄 요약, 선택적 메타데이터(날짜, 소스 수)와 함께 카테고리(엔티티, 개념, 소스 등)별로 나열. 매 ingest마다 갱신. 질의 시 LLM이 index를 먼저 읽고 관련 페이지로 들어간다.
- **log.md** — 시간순 추가 전용 기록(ingest, query, lint). 항목 머리글을 일관된 접두사로 쓰면 유닉스 도구로 파싱된다. 예: `## [2026-04-02] ingest | Article Title`, 최근 5개는 `grep "^## \[" log.md | tail -5`.

관련: [[ingest-query-lint]], [[rag]]. 출처: [[karpathy-llm-wiki]]
