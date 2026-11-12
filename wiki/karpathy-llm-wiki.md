---
title: Karpathy "LLM Wiki" gist (소스 요약)
type: source
sources: [raw/karpathy-llm-wiki.md]
updated: 2026-11-12
---

# Karpathy "LLM Wiki" gist

- 저자: [[andrej-karpathy]]
- 원문: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
- 성격: 에이전트(Codex, Claude Code, OpenCode 등)에 붙여넣어 구체화하게 하는 **아이디어 파일**. 의도적으로 추상적이며 디렉터리 구조, 스키마, 페이지 형식은 정하지 않는다.

## 요약

- 문서 + LLM의 일반적 사용 방식([[rag]])은 질문마다 조각을 다시 찾아 조립하므로 지식이 쌓이지 않는다.
- 대안은 LLM이 원본과 사용자 사이에 **영속적이고 누적되는 위키**를 만들고 유지하는 것이다. → [[llm-wiki]]
- 구조는 3계층(raw 소스, 위키, 스키마). → [[llm-wiki]]
- 운영은 ingest, query, lint 세 연산. → [[ingest-query-lint]]
- 탐색용 파일 두 개: `index.md`(내용 카탈로그), `log.md`(시간순 기록). → [[index-and-log]]
- 도구 팁: [[obsidian]] (Web Clipper, 그래프 뷰, Marp, Dataview), 검색 도구 [[qmd]], 위키 자체는 git 저장소.
- 철학: 지식베이스 유지의 어려움은 읽기·생각이 아니라 **장부 정리(bookkeeping)**이며, LLM이 이 비용을 거의 0으로 만든다. 사람은 소스 선별, 분석 방향, 질문을 맡는다. [[memex]]와 같은 정신.

## 적용 예시 (원문 나열)

개인(목표, 건강, 자기계발), 리서치, 책 읽기(인물·주제 페이지, Tolkien Gateway 같은 팬 위키), 팀/비즈니스 내부 위키, 경쟁 분석, 실사, 여행 계획, 강의 노트, 취미 탐구.

## 메모

- 원문 자체는 코드 블록이나 폴더 트리가 없다. 이 저장소의 `SCHEMA.md`, 페이지 frontmatter 형식은 원문이 아니라 저장소 작성 시 구체화한 것이다.
