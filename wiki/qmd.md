---
title: qmd
type: entity
sources: [raw/karpathy-llm-wiki.md, raw/qmd-readme.md]
updated: 2026-11-12
---

# qmd (Query Markup Documents)

마크다운용 **로컬 검색 엔진**. 저장소: https://github.com/tobi/qmd (MIT). [[karpathy-llm-wiki]]가 [[llm-wiki]]의 선택적 검색 도구로 추천했고, [[qmd-readme]]로 README 전체를 읽고 확인했다(코드 실행 검증은 없음).

## 무엇인가

- BM25 + 벡터 + LLM 재랭킹을 전부 온디바이스(node-llama-cpp, GGUF)로 수행. → [[hybrid-search]]
- 청킹은 마크다운 경계를 점수화. → [[smart-chunking]]
- frontmatter `qmd.metadata`로 타입 필터링. → [[metadata-filtering]]
- 인덱스는 `~/.cache/qmd/index.sqlite`(SQLite, FTS5, sqlite-vec), 설정은 `~/.config/qmd/index.yml`.

## 인터페이스

- **CLI**: `qmd collection add|list|remove|rename|show|include|exclude|update-cmd`, `qmd context add|list|rm`, `qmd embed`, `qmd update`, `qmd search|vsearch|query`, `qmd get|multi-get`, `qmd ls`, `qmd status|doctor|cleanup|init|trust|bench`.
- **MCP**: `query`, `get`, `multi_get`, `status`, `metadata`. 기본 stdio, `qmd mcp --http`(기본 localhost:8181, `--daemon`으로 백그라운드)도 가능. Claude Code는 `claude plugin marketplace add tobi/qmd` 후 `claude plugin install qmd@qmd`, 또는 `~/.claude/settings.json`에 MCP 수동 설정.
- **SDK**: `@tobilu/qmd`의 `createStore({dbPath, config})`. `dbPath`를 반드시 지정해야 한다.
- 에이전트용 출력: `--json`, `--files`, `--md`, `--all --min-score`.

## 핵심 기능: 컨텍스트 트리

컬렉션과 경로에 설명을 붙이면(`qmd context add qmd://notes "..."`) 하위 문서가 반환될 때 함께 전달되어 LLM이 문서를 더 잘 고른다. 가장 긴 접두사가 우선. README가 "놓치지 말라"고 강조.

## 요구사항

Node.js >= 22 또는 Bun >= 1.0.0, 모델 3종 약 2GB(embeddinggemma 300MB, qwen3-reranker 640MB, 쿼리 확장 1.7B 1.1GB; 첫 사용 시 자동 다운로드).

## 이 위키에 적용할 때 주의

- **한국어**: 기본 임베딩은 CJK 지원이 제한적. `QMD_EMBED_MODEL`로 Qwen3-Embedding을 지정하고 `qmd embed -f`로 재임베딩(벡터는 모델 간 호환 안 됨).
- **Windows(CUDA)**: 병렬 컨텍스트 크래시 가능성 때문에 기본 병렬도 1. 문제 시 `--no-gpu` 또는 `QMD_FORCE_CPU=1`.
- **보안**: HTTP 모드는 인증이 없다. 외부 노출 금지. 프로젝트 로컬 `.qmd` 설정의 update 명령·외부 경로·사용자 모델은 터미널 승인 없이는 건너뛴다(에이전트, CI, MCP 포함).
- **MCP 사용 시**: `collections`는 배열로 넘겨야 하고 알 수 없는 파라미터는 조용히 무시된다.
- **update 훅**: `bash -c`로 실행된다고 서술되어 있다. Windows 동작은 README에 없어 확인되지 않았다.
- **도입 여부**: 아직 도입하지 않았다. 현재 규모에서는 `index.md`로 충분하다. 도입 시 위키 frontmatter를 `qmd.metadata`로 옮길지도 결정 필요. 미결정.
