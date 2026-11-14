# 위키 로그

추가 전용입니다. 기존 항목을 고치지 마세요.

## [2026-11-12] init | 저장소 생성 (근거: Karpathy "LLM Wiki" gist)

## [2026-11-12] ingest | Karpathy LLM Wiki gist (raw/karpathy-llm-wiki.md) - 페이지 9개 생성(소스 1, 엔티티 4, 개념 4), index 갱신

## [2026-11-12] lint | 페이지 11개 점검. 깨진 링크 0(index 예시 문구의 가짜 링크 1건 수정), 고아 0, frontmatter 누락 0, index 누락 0

## [2026-11-12] ingest | qmd README (raw/qmd-readme.md) - 신규 2(qmd-readme, hybrid-search), 갱신 1(qmd), index 갱신. README는 일부만 읽음(1-300, 569-630, 1411-1440줄 + 헤딩)

## [2026-11-12] lint | 페이지 13개 점검. 깨진 링크 0, 고아 0, frontmatter 누락 0, index 누락 0, raw 참조 누락 0, 미처리 raw 0

## [2026-11-12] ingest | qmd README 2차 (raw/qmd-readme.md 전체 1-1587줄 읽음) - 신규 2(smart-chunking, metadata-filtering), 갱신 3(qmd-readme, qmd, hybrid-search), index 갱신. README 내부 불일치 4건 표로 기록

## [2026-11-12] ingest | Marp README (raw/marp-readme.md, 전체 읽음) - 신규 2(marp-readme, marp), 갱신 1(obsidian), index 갱신. 입구 페이지라 사용법 정보 없음. Bush 'As We May Think'는 원문 접근 실패로 미처리

## [2026-11-12] ingest | herdr README (raw/herdr-readme.md, 전체 읽음) - 신규 2(herdr-readme, herdr), index 갱신. 문서 사이트(herdr.dev/docs)는 미독

## [2026-11-12] ingest | herdr 문서 사이트 (raw/herdr-docs-full.md, llms-full.txt 5613줄 중 홈·Concepts·Agents·Session state 전체, Connecting machines·Windows·Socket API 일부 읽음) - 신규 4(herdr-docs, herdr-session-state, herdr-agent-status, herdr-windows), 갱신 2(herdr, herdr-readme), index 갱신. README와 불일치 1건(Windows beta vs GA) 기록. CLI/Config/Keyboard/Plugins 등 미독

## [2026-11-13] lint | 페이지 23개 점검(index·log 포함). 깨진 링크 0, 발견 중간 3·낮음 6, 중간 3건 수정: (1) 이 lint 기록 추가, (2) herdr-agent-status·herdr-session-state·herdr-windows의 sources에 raw/herdr-readme.md 추가(본문이 README와 대조), updated 갱신, index 날짜·소스 수 2로 정정, (3) obsidian은 확인 결과 Marp 언급이 karpathy 소스의 플러그인 설명과 [[marp]] 링크뿐이고 raw/marp-readme.md 내용은 반영되지 않음 → sources 유지. 11-12 Marp ingest의 '갱신 1(obsidian)'은 소스 지식 반영이 아니라 상호참조 연결로 정정. 낮음 6건은 미수정

## [2026-11-14] lint | 다솜 lint 중간 2건 수정(lint-fix): (1) herdr-windows 읽은 범위 서술 정정 - raw 5438-5613줄과 대조해 내용 일치 확인, ingest 당시 실제 읽은 범위는 미확인으로 명시, herdr-docs 읽은 범위 표의 Windows 행도 정합화. (2) herdr 엔티티의 상태 표기 정정 - README는 working/blocked/idle 3가지, 문서(Concepts)는 blocked/working/done/idle/unknown 5가지로 출처 구분. herdr-agent-status는 원문과 일치해 수정 없음. index 날짜 갱신(herdr, herdr-docs, herdr-windows)
