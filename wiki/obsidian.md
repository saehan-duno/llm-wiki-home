---
title: Obsidian
type: entity
sources: [raw/karpathy-llm-wiki.md]
updated: 2026-11-12
---

# Obsidian

마크다운 노트 앱. [[llm-wiki]]에서 사람이 위키를 탐색하는 "IDE" 역할이다. 저자는 한쪽에 LLM 에이전트, 다른 쪽에 Obsidian을 열고 LLM의 수정 결과를 실시간으로 본다.

원문이 언급한 기능과 팁:
- **Web Clipper**: 웹 글을 마크다운으로 변환해 raw에 빠르게 넣는다.
- **이미지 로컬 저장**: Attachment folder path를 `raw/assets/` 같은 고정 경로로 지정하고 "Download attachments for current file"을 단축키(예: Ctrl+Shift+D)에 연결. LLM은 인라인 이미지가 있는 마크다운을 한 번에 읽지 못하므로 텍스트를 먼저 읽고 이미지를 따로 보는 방식을 쓴다.
- **그래프 뷰**: 허브와 고아 페이지 등 위키 형태 파악.
- **Marp 플러그인**: 위키 내용으로 슬라이드 생성.
- **Dataview**: frontmatter(태그, 날짜, 소스 수)를 질의해 동적 표·목록 생성.

출처: [[karpathy-llm-wiki]]
