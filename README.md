<h1 align="center"> ⚡ 댓통령 💬 <br> - An SNS App for Sharing Photos and Funny Comments - </h1> 

<div align="center">
<img width="150" alt="s" src="https://github.com/user-attachments/assets/8df8acaa-2b0c-41f1-9811-4e93570270e9" />
<img width="150" alt="l" src="https://github.com/user-attachments/assets/5554dc09-d778-461f-9c34-db8b05be53d5" />
<img width="150" alt="l-s" src="https://github.com/user-attachments/assets/f1ecefd5-5b55-4785-8c9a-b28e02270a15" />
<img width="150" alt="h" src="https://github.com/user-attachments/assets/ea943964-08cf-4b30-86eb-c6264056834d" />
<img width="150" alt="w" src="https://github.com/user-attachments/assets/f4de1713-4ae5-408d-9490-f974f3d45c68" />
<img width="150" alt="w-i2" src="https://github.com/user-attachments/assets/937032ec-fb59-4b93-9d4a-73cd70b90bdf" />
<img width="150" alt="d" src="https://github.com/user-attachments/assets/d3425434-efe7-4fce-813d-06927c63d89c" />
<img width="150" alt="w-d" src="https://github.com/user-attachments/assets/31355972-f79d-4fed-a281-5335bb189c0b" />
<img width="150" alt="c" src="https://github.com/user-attachments/assets/470dc7f6-2cfa-4252-bcf5-9dab0b011bdd" />

</div>
<br>

<h3 align="center"> [Flutter 심화] 사진과 댓글로 즐기는 유머 중심 SNS App </h3>
<p align="center"> 프로젝트 일정 [ 25/08/28 ~ 25/09/05 ] </p>
<br>
<br>
<br>




## 🚀 Our Crew
| 이름   | 역할                                                      | 담당 페이지   |
|--------|-----------------------------------------------------------|--------------------|
| 이상록 | 팀장, 발표자료 제작, Firebase                             | Detail Page       |
| 김현수 | ReadMe 작성, Firebase                                   | Comment Page           |
| 노서연 | 발표, Firebase, 알림 기능                                 | Home Page, Splash Page          |
| 조민우 | 시연 영상 제작, Firebase                                  | Login Page          |
| 임우형 | SA 정리, Firebase                                      | Write Page          |
| 공통 | SA 작성, 담당 UI 디자인, 스크럼 일지 정리                  |                    |
<br>

## 📂 프로젝트 바로가기 링크  
👊 Notion :  
[https://teamsparta.notion.site/P1J4-25d2dc3ef51480f185d7c24593cc3895](https://teamsparta.notion.site/P1J4-25d2dc3ef51480f185d7c24593cc3895)

👊 GitHub :  
[https://github.com/8xc0m4/team1_det_tonryong](https://github.com/8xc0m4/team1_det_tonryong)  

👊 YouTube :  
[https://www.youtube.com/watch?v=h_aDIZ1Qcy4](https://www.youtube.com/watch?v=aaIQROUmzg4)  
<br>

## 🔍 프로젝트 개요
- 댓통령은 사진에 댓글을 달아 가장 웃긴 제목을 뽑는 SNS 앱입니다.
- 사진 하나에 여러 사람이 참여해 댓글을 달고, 좋아요와 반응으로 웃긴 Best 댓글이 뽑히는 방식입니다.
- 단순히 사진만 공유하는 게 아니라, 함께 웃고 즐기는 소셜 놀이터를 지향합니다.
<br>

## 🎯 프로젝트 구조
<br>
<div>
  <img width="800" alt="image" src="https://github.com/user-attachments/assets/95cc1ee6-0c2b-4c96-b50f-4cabeeaa1032" />
</div>
<br>

<pre>
📁 lib/
├── main.dart
├── notification_helper.dart
├── firebase_options.dart
├── router.dart
├── 📁 provider/  
├── 📁 data/
│   ├── 📁 datasource/
│   ├── 📁 dto/
│   └── 📁 repository/
├── 📁 domain/
│   ├── 📁 entity/
│   ├── 📁 repository/
│   └── 📁 usecase/
└── 📁 presentation/
    ├── 📁 util/  
    └── 📁 page/
        ├── 📁 comment/
        ├── 📁 detail/
        ├── 📁 error/
        ├── 📁 home/
        ├── 📁 login/
        ├── 📁 welcome/
        └── 📁 write/
</pre><br>

## 📱 App Screens & Features
| Splash Page  | Login Page  | Home Page |
| ------------- | ---------- | --------- |
|<p align="center">앱 실행 시 로고 노출</p> | <p align="center">앱에서 사용자를 인식하고 앱을 들어가기 위한 사용자 체크</p> | <p align="center">댓통령에 등록된 feed들 표시</p> |
| 로고를 한 획씩 쓰는 듯한 애니메이션   | - 구글 로그인을 사용하여 사용자 구글 정보를 사용하고 닉네임을 따로 설정하여 앱을 이용할 수 있음 <br> - 또한, 이미 사용자 정보와 로그인 정보가 존재한다면 구글 로그인을 거치지 않고 바로 로그인이 가능 | - feed들을 서버에서 작성된 시간 순으로 불러오고 아래로 페이지를 더 내리면 추가 피드 표시 |
| <p align="center"><img width="150" alt="s" src="https://github.com/user-attachments/assets/8df8acaa-2b0c-41f1-9811-4e93570270e9" /></p> | <p align="center"><img width="150" alt="l" src="https://github.com/user-attachments/assets/5554dc09-d778-461f-9c34-db8b05be53d5" /></p> | <p align="center"><img width="150" alt="h" src="https://github.com/user-attachments/assets/ea943964-08cf-4b30-86eb-c6264056834d" /></p> |

| Write Page | Detail Page | Comment Page |
| ---------- | ----------- | ------------ |
| <p align="center">댓통령에 등록될 feed 생성</p> | <p align="center">선택한 feed에 들어가 선택된 피드 이미지와 best 댓글 확인</p> | <p align="center">해당 피드에 댓글을 입력하는 공간으로 피드에 달린 댓글이 표시</p> |
| - 사진 등록을 누르면 사용자의 갤러리에 접근하여 사진을 UI에 표시되고 게시를 누르게 되면 사진이 서버에 저장되고 작성자, 작성된 시간 등의 feed 정보도 서버에 저장 | - 선택된 feed에 들어가 피드의 이미지를 크게 볼 수 있고, 가장 좋아요가 많은 댓글을 이미지 바로 아래에 띄워주고 좋아요가 많은 2위부터 4위를 애니메이션으로 띄워줌. <br> - feed가 맘에 들어 좋아요를 누를 경우 feed 작성자에게 알림 | - 위로 스와이프하여 새로고침이 가능하고 댓글이 달린 시간에 따라 방금 전, 1시간 전, 2개월 전 등으로 표시 <br> - 댓글의 좋아요를 누르면 서버에 저장 |
| <p align="center"><img width="150" alt="w" src="https://github.com/user-attachments/assets/f4de1713-4ae5-408d-9490-f974f3d45c68" /></p> | <p align="center"><img width="150" alt="d" src="https://github.com/user-attachments/assets/d3425434-efe7-4fce-813d-06927c63d89c" /></p> | <p align="center"><img width="150" alt="c" src="https://github.com/user-attachments/assets/470dc7f6-2cfa-4252-bcf5-9dab0b011bdd" /></p> |

<br>

## 🚀 Core Features
- 📷 사진 업로드 및 피드 등록
- 💬 댓글(제목) 작성 및 실시간 반영
- 👍 좋아요 및 반응 기능
- 🏆 웃긴 댓글 랭킹 표시 (Best 댓글)
- 🔄 무한 스크롤 피드 & 새로고침
- 👤 프로필 관리 (닉네임, 프로필 이미지)
- 🔔 알림 기능 (좋아요, 반응 등)
<br>

## 🛠 Technologies & 💻 Development Tools
- Flutter 3.35.2
- Dart 3.9.0
- Riverpod - 상태 관리 라이브러리  
- Firebase - 백엔드 서비스 연동
- firebase_storage - 파이어베이스에 사진 저장
- image_picker - 사용자 갤러리에서 사진 가져오기
- go_router - 페이지 이동 방식
- google_sign_in – 구글 로그인 연동
- Visual Studio Code – 전체 프로젝트 개발 IDE  
- iOS Simulator / Android Emulator – 기능 테스트 및 UI 시뮬레이션  
- Figma – UI/UX 화면 설계 및 와이어프레임 제작  
- GitHub – 형상 관리 및 협업
<br>

## 🤝 커밋 컨벤션
- ✨ : 새로운 기능 추가
- 🐛 : 버그 수정
- 📝 : 문서 관련 변경 (예: README, 주석 등)
- 🎨 : UI/스타일 수정
- ♻️ : 기능 변경 없이 코드 구조만 개선
- 🎉 : 프로젝트 시작
- 🚧 : 작업 중 (WIP)
<br>
