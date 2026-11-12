---
title: qmd 메타데이터 필터링과 탐색
type: concept
sources: [raw/qmd-readme.md]
updated: 2026-11-12
---

# 메타데이터 필터링

[[qmd]]에서 문서가 frontmatter의 `qmd.metadata` 블록으로 타입이 있는 메타데이터를 선언하면 검색 전에 필터링할 수 있다. 블록이 없는 문서는 기존과 동일하게 동작한다.

```yaml
---
qmd:
  metadata:
    topics: [typescript, programming]
    status: published
    priority: 3
---
```

- 값: 문자열, 숫자, 불리언, 같은 타입의 평평한 배열만 허용. 중첩 객체, null, 빈 배열, 혼합 배열은 거부되며 문서는 색인되지만 필터 검색에서는 제외된다.
- 키 이름(`tags`, `topics` 등)에는 특별한 의미가 없다.
- 필터는 `operator`로 구분되는 재귀 JSON AST: `and`/`or`/`not`, 비교 `eq ne gt gte lt lte`, 포함 `in nin all`, 텍스트 `contains prefix suffix`, `type`, `exists`. 문자열 조건은 `caseInsensitive`(ASCII만) 가능. 암묵적 AND는 없다.
- 의미: 타입이 엄격(형 변환 없음), 배열은 집합으로 취급, 누락된 키는 `ne`/`nin`에 매치되지 않음.
- 보장: 반환 결과는 항상 필터를 만족(RRF·재랭킹 이전 적용). 선택도가 높으면 `limit`보다 적게 나올 수 있고, 벡터 검색은 필터 대상이 20,000 청크 이하일 때 정확 탐색한다.
- 메타데이터 추출 이후에만 검색 대상이 되므로 업그레이드 후 `qmd update` 필요(`qmd status`에 대기 수 표시).

## 탐색(Discovery)

무엇으로 필터할지 알기 위한 기능. `qmd collection metadata <컬렉션>`이 키, 타입, 값 개수를 보여 주며 `--match`(메타데이터 항목 자체를 좁힘)와 `--filter`(문서를 좁힘)를 구분한다. 숫자 키는 최소·중앙값·최대를 표시한다. 같은 키가 문서마다 타입이 다르면 타입별로 나눠 보고하되 해결하지는 않는다. SDK `listMetadata`, MCP `metadata` 도구, `POST /metadata`로도 같은 결과를 얻는다.

## 이 위키와의 관계

현재 위키 페이지의 frontmatter(`title`, `type`, `sources`, `updated`)는 최상위 키라 qmd 메타데이터로 인식되지 않고 일반 본문처럼 검색된다. qmd를 도입한다면 `qmd.metadata` 아래로 옮길지 결정이 필요하다(미결정).

출처: [[qmd-readme]]
