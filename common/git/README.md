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

## git stash
- git stash = 하던거는 임시저장하고 마지막 커밋상태로 돌아가기
- 의미없는 것 커밋하지 않고 잠시 저장하고 싶을때
- 임시공간에 저장됨
- git stash list = 아이디 확인
- 커밋안하고 잠깐 다른 브랜치로 이동하고 싶을 때 임시저장
- git stash apply = 임시저장 불러오기
- git reset --hard = 마지막 커밋으로 돌아가기
- git stash pop = 임시 저장한거 사라짐
- git stash drop 아이디 = 삭제

## workflow
- master branch = 운영 중인 서비스와 같은 내용
- 배포툴(travis) = 깃헙의 마스터 브랜치 내용을 서버에 배포
- develop
- feature

## githubflow
- 브랜치에서 테스트 서버에서 배포 서비스까지 하고 마스터에 머지
- 마스터에서 안되면 다시 롤백
- 풀리퀘, 리뷰, 테스트 -> 머지


## 깃헙 코드리뷰
### 콜라보레이터
- 브랜치에서 커밋
- 마스터에 머지하기 전에
- pull req, 리뷰어 지정(풀리퀘 못날릴 때 내꺼에다가 마스터를 머지한 후 요청 날리면 된다)
- 답장 오기전까지 커밋하면 안된다
- addreview = comment(고쳐줘), approve(승인), req changes(거절)
- 거절당하면 브랜치에 다시 고쳐서 커밋하고 다시 머지해달라고 댓글 달기
- 승인된 후 머지

### 콜라보 아닐때
- 남의 것을 포크
- git clone
- 브랜치 따기
- 변경한 후 브랜치에 커밋
- pull req(남의 것에 내 브랜치 머지요청)

# f2에 데브를 머지 -> 풀리퀘 -> 데브에 머지
- 데브에 머지 또는 마스터에 머지할 때 풀리퀘, 코드리뷰 거쳐야한다
---

# 토이프로젝트 깃
- pod파일?, git ignore
- 중간에 다른 팀원이 들어오거나 내가 빠져도 진행상황을 잘 알 수 있게 작업이력을 정리해야함
