# git
- working dir - index stage - local rep(.git 폴더) - remote rep
- 단위 = 커밋
- 브랜치 = 하나의 커밋을 참조

## 원격 저장소 생성
- git init or git clone
- pull = fetch(원격->로컬) + merge(로컬->워킹)

## merge(base = 나)
- 워킹이랑 원격이랑 다를 때 합치기
- 여러 부모를 합치기
- 충돌 발생가능
- 마스터에 다른 커밋을 더하는 게 일반적

## git 명령어
- -f = force
- -i = interactive (사람이 알아서)
- touch = 빈파일 생성
- checkout(head 이동)
- branch(head에서 갈라지는 가지)
- head = 현재 작업중인 커밋
- git clone 주소 폴더명
- alias 명령어 단축키 사용자지정
- git branch 2nd C0
- git checkout -b 3rd C1(head도 같이 이동)
- ^1 첫번째 부모, ^2 두번째 부모
- ~1 부모, ~2 조부모
- git reset HEAD^
- git rebase master???(base= 상대), 부모는 한줄이 된다
- git cherry-pick = 아무거나 커밋 하나 붙이기
- commit --amend = C -> C'(약간만 고쳐서 커밋에 추가)
- cat = 파일 내용 확인
- git rm --cached 파일명 (index에서 다시 내릴 때)
- 올라가면 안되는 게 커밋되었다면 brew install bfg, bfg --delete-files 파일명
- rm -rf .git* (git 저장소 지우기)



## 되돌리기
- git revert (되돌아 가지만 원본것을 남겨놓는다)
- git reset --hard (해당 커밋으로 되돌리기, 원본 없어짐)
- git rebase -i

