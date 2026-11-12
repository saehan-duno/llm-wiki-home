---
title: Marp
type: entity
sources: [raw/karpathy-llm-wiki.md, raw/marp-readme.md]
updated: 2026-11-12
---

# Marp (Markdown Presentation Ecosystem)

일반 마크다운으로 프레젠테이션을 만드는 도구 생태계. 저장소: https://github.com/marp-team/marp (MIT). [[marp-readme]]를 읽고 확인했다.

## 위키에서의 용도

[[karpathy-llm-wiki]]는 [[ingest-query-lint]]의 query 결과 형식 중 하나로 슬라이드(Marp)를 든다. 위키 내용을 질의한 답을 마크다운 슬라이드로 만들어 위키에 다시 저장하거나 발표용으로 쓸 수 있다는 취지다. [[obsidian]]에 Marp 플러그인이 있다고도 한다(Karpathy gist 서술, README에는 없음).

## 구성 요소 (README 기준)

| 이름 | 역할 |
|---|---|
| Marpit | 마크다운에서 슬라이드를 만드는 가벼운 프레임워크 |
| Marp Core | 변환기 코어, 내장 테마 |
| Marp CLI | HTML, PDF, PPTX, 이미지로 변환 |
| Marp for VS Code | VS Code에서 미리보기 |

Marp Web, Marp React, Marp Vue는 구버전/비활성으로 분류되어 있다.

## 아직 모르는 것

슬라이드 작성 문법(구분자, 디렉티브), 테마 지정, CLI 옵션, Obsidian 플러그인 상태는 이 소스에 없어서 확인하지 못했다. 필요하면 Marpit 또는 Marp CLI 문서를 ingest한다.
