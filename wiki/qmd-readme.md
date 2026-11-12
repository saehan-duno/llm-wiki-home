---
title: qmd 저장소 README (소스 요약)
type: source
sources: [raw/qmd-readme.md]
updated: 2026-11-12
---

# qmd README

- 원문: https://raw.githubusercontent.com/tobi/qmd/main/README.md (약 1,590줄, MIT)
- 대상: [[qmd]]. [[karpathy-llm-wiki]]가 소개만 한 qmd를 직접 확인한 소스. 두 소스는 일치하며 모순은 없다.
- 읽은 범위: **전체**(1~1587줄). 1차 ingest에서는 일부만 읽었고, 2차에서 나머지를 읽고 보강했다. 단, 아래 "미확인"에 적은 대로 코드 실행으로 검증한 것은 없다.

## 구성 (README 절 순서)

Quick Start → AI 에이전트 사용법 → MCP 서버(stdio/HTTP, 파라미터 표) → SDK(`createStore`, `search`, `get`, 컬렉션/컨텍스트/인덱싱 API) → Architecture(파이프라인) → 점수 정규화와 융합 → 요구사항·모델 → 설치 → 사용법(컬렉션, 임베딩, 컨텍스트, `index.yml`, 검색 명령, 옵션, 필터) → 메타데이터 필터링·탐색 → 출력 형식 → 인덱스 유지보수 → 벤치마크 → 데이터 저장 → 환경 변수 → 동작 원리 → 모델 설정.

## 핵심 (이전 ingest 내용 포함)

- 온디바이스 마크다운 검색: BM25 + 벡터 + LLM 재랭킹, node-llama-cpp/GGUF. → [[hybrid-search]]
- 인터페이스: CLI, MCP(도구 `query`/`get`/`multi_get`/`status`/`metadata`), SDK, HTTP(`/mcp`, `/query`, `/metadata`, `/health`).
- 요구사항: Node.js >= 22 또는 Bun >= 1.0.0, macOS는 Homebrew SQLite.
- 모델 3종(약 300MB + 640MB + 1.1GB), `~/.cache/qmd/models/`에 캐시. 저장소 `~/.cache/qmd/index.sqlite`.
- 청크: 약 900토큰, 15% 겹침, 마크다운 경계 점수화. → [[smart-chunking]]
- 메타데이터: frontmatter의 `qmd.metadata`로 타입 지정 후 JSON AST 필터. → [[metadata-filtering]]

## 새로 확인한 내용 (2차 ingest)

- **컨텍스트 트리**: `qmd context add`로 컬렉션/경로에 설명을 달면 가장 긴 접두사가 우선 적용되어 결과와 함께 반환. README가 "핵심 기능"이라고 강조.
- **`index.yml`**: 기본 `~/.config/qmd/index.yml`(`XDG_CONFIG_HOME`, `QMD_CONFIG_DIR` 존중). 컬렉션별 `path`, `pattern`, `ignore`(YAML에서만 설정 가능), `update`, `includeByDefault`, `context`. 모델 URI 재정의 가능. `node_modules`, `.git`, `.cache`, `vendor`, `dist`, `build`는 항상 제외. 설정 변경만으로 재색인되지 않으므로 `qmd update`, 모델 변경 시 `qmd embed`가 필요.
- **프로젝트 로컬 인덱스**: `qmd init`이 `.qmd/index.yml`과 로컬 `index.sqlite`를 만든다.
- **update 훅**: 컬렉션의 `update` 명령(예: `git pull --ff-only`)이 `qmd update` 때 먼저 `bash -c`로 컬렉션 디렉터리에서 실행. 비정상 종료하면 **전체 실행이 중단**된다.
- **신뢰 게이트**: 저장소에 체크인된 `.qmd/index.yml`의 `update` 명령, 프로젝트 밖 경로, 기본이 아닌 모델은 승인 없이 쓰지 않는다. 터미널이 없으면(에이전트, CI, MCP) 해당 필드를 **건너뛴다**. `qmd trust`로 승인, `QMD_TRUST_LOCAL_CONFIG=1`로 CI 허용.
- **HTTP 보안**: 비루프백 `Origin`은 403, `Host` 검증, `QMD_ALLOWED_ORIGINS`/`QMD_ALLOWED_HOSTS`로 확장. `--host 0.0.0.0`은 Host 검사를 생략하고 경고. 엔드포인트는 인증이 없다.
- **검색 옵션**: `-n`(기본 5, `--files`/`--json`은 20), `-c`(여러 번 지정 시 OR), `--all`, `--min-score`, `--intent`, `--no-rerank`, `--explain`(점수 분해), `--filter`, `--index <이름>`(이름 있는 인덱스), `--format cli|json|csv|md|xml|files`. 다중 `-c`는 전역 top-K 풀에서 필터링하므로 작은 컬렉션이 안 나올 수 있다.
- **MCP 주의**: `query`의 `collections`는 **배열만** 인식하고 단수 `collection`은 조용히 무시된다. 알 수 없는 파라미터도 거부하지 않고 무시한다.
- **유지보수 명령**: `qmd status`, `qmd update`, `qmd doctor`(설치 진단), `qmd cleanup`(캐시·고아 정리, 벡터 테이블 재패킹), `qmd get <파일>[:시작줄[:줄수]]`, `qmd multi-get`.
- **벤치마크**: `qmd bench <fixture.json>`이 bm25/vector/hybrid/full 네 백엔드를 precision@k, recall, MRR, F1로 비교. README 예시 픽스처에서 bm25 약 0.50, vector 약 0.70, hybrid/full 약 1.00이라고 한다(저자 보고, 독립 검증 아님). 컬렉션이 인덱싱되지 않았으면 경고 없이 전부 0을 보고한다.
- **프롬프트 형식**: embeddinggemma는 질의 `task: search result | query: ...`, 문서 `title: ... | text: ...`. 모델을 바꾸면 형식이 자동 조정되고 벡터는 호환되지 않아 `qmd embed -f`가 필요.
- **환경 변수**: `XDG_CACHE_HOME`, `XDG_CONFIG_HOME`, `QMD_CONFIG_DIR`, `QMD_LLAMA_GPU`, `QMD_FORCE_CPU`, `QMD_EMBED_PARALLELISM`(Windows CUDA 기본 1), `QMD_EMBED_MODEL`, `QMD_EDITOR_URI` 등.

## README 내부의 불일치

README 안에서 서로 다르게 적힌 수치다. 어느 쪽이 현재 동작인지는 코드를 봐야 알 수 있다.

| 항목 | 한쪽 | 다른 쪽 |
|---|---|---|
| 쿼리 확장 | 아키텍처 그림: 원 질의(x2) + 변형 2개 | 융합 절 문장: 원 질의(x2) + LLM 변형 1개, 맨 앞 설명은 `lex`/`vec`/`hyde` 유형 라우팅 |
| 재랭크 후보 수 | 융합 설명: 상위 30개 | 옵션/MCP: `candidateLimit` 기본 40 |
| 재랭커 점수 | 점수 표: LLM 0-10 평점을 10으로 나눔 | 설명: yes/no와 logprob 신뢰도 |
| `multi-get` 크기 상한 기본값 | CLI/SDK: 64KB | MCP 파라미터 표: 10240 |

## 미확인

- 코드 실행, 설치, 벤치마크 재현은 하지 않았다. 위 내용은 README 서술을 옮긴 것이다.
- 설계 의도와 실제 Windows 동작은 확인하지 않았다. 특히 update 훅이 `bash -c`로 실행된다는 서술이 Windows에서 어떻게 처리되는지는 README에 없다.
