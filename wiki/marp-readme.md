---
title: Marp 저장소 README (소스 요약)
type: source
sources: [raw/marp-readme.md]
updated: 2026-11-12
---

# Marp README

- 원문: https://raw.githubusercontent.com/marp-team/marp/main/README.md (약 140줄, 전체 읽음)
- 대상: [[marp]]
- 성격: 사용법 문서가 아니라 **Marp 생태계의 입구(안내) 페이지**다. 마크다운 문법, 디렉티브, 테마 사용법 같은 구체적 사용 정보는 이 README에 없다. 그런 내용은 각 하위 저장소 문서에 있으며 이 위키는 아직 읽지 않았다.

## 확인된 내용

- 정의: "일반 마크다운으로 프레젠테이션을 쓰기 위한 생태계".
- 여러 저장소로 나뉜 구조(저장소마다 범위를 좁히기 위함). 이 저장소(`marp-team/marp`)는 입구이며 웹사이트(marp.app)가 `/website`에 있다.
- 구성 요소 표:
  - 프레임워크/코어: **Marpit**(마크다운에서 슬라이드를 만드는 가벼운 프레임워크), **Marp Core**(실용 기능과 내장 테마를 갖춘 변환기 코어)
  - 앱: **Marp CLI**(HTML, PDF, PPTX, 이미지로 변환)
  - 통합: **Marp for VS Code**(Marp 마크다운 슬라이드 미리보기 확장)
  - 비활성/구버전: Marp Web(PWA), Marp React, Marp Vue, 그리고 옛 Marp 앱(`yhatt/marp`)
- 관리: @marp-team, 대표 작성자 Yuki Hattori. 라이선스는 MIT License로 표기.
- 추가 자료는 awesome-marp 목록, 토론 포럼, 기여 가이드라인으로 안내.

## 이 위키와의 관련

[[karpathy-llm-wiki]]는 Marp를 "마크다운 기반 슬라이드 형식"이며 Obsidian 플러그인이 있다고만 언급한다. 이 README로 확인된 것은 Marp CLI가 HTML, PDF, PPTX, 이미지로 변환하고 VS Code 확장이 있다는 점까지다. Obsidian 플러그인에 대한 내용은 이 README에 없다.
