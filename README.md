# JSPPrj, JSPPrj2

유튜브 뉴렉처님(https://www.youtube.com/c/%EB%89%B4%EB%A0%89%EC%B2%98) 의 무료 강의를 통해 JSP 및 서블릿을 학습하고 간단하게 게시판 구현까지 완료한 프로젝트들 입니다.
처음 MVC 구조를 적용하여 만들어본 프로젝트이며, Database는 MySQL을 이용했습니다.

JSP.txt, Servlet.txt는 강의를 수강하며 새로 배운것들을 정리한 텍스트 파일입니다.

# MovieReservation 프로젝트

+ ## 소개
간단한 영화예매프로그램입니다. JSP를 이용해 구현했으며 MVC Model2방식을 최대한 적용하기 위해 노력했습니다.
가장 기초적인 CRUD를 구현했으며
프로젝트는 고객이 사용하는 부분만을 완성했으며 관리자 기능 구현은 구현하지 않았습니다.(추후 추가해보겠습니다) 처음으로 JSP프로젝트를 진행해본만큼 부족한점이 많습니다. 다만  0 to 100까지 직접 만들었다는 것에 의의를 두고 있습니다.

+ ## E-R Diagram
![image](https://user-images.githubusercontent.com/66772624/146421684-9f2eef7f-e9e3-4298-b23c-1243f723f380.png)

+ ## MySQL Tables
![image](https://user-images.githubusercontent.com/66772624/146421541-b555adc2-e4df-47ff-a91b-cba9e9cc5fda.png)

+ ## 기능

  + ### 공통
    + 상영영화 조회

  + ### 고객
    + 회원가입 및 로그인 절차
    > 최초로 회원가입을 하면 고객전용 기능들을 이용가능하다.
    + 회원정보 수정(Update)
    > 회원 정보를 수정할 수 있음(비밀번호는 수정하지 않더라도 입력해줘야함)
    + 예매영화 조회(Select)
    > 현재 상영중인 영화를 조회가능 기존 상영영화 조회와 달리 남은 좌석 수 및 세부사항 확인가능
    + 영화예매(Select)
    > 예매영화조회에서 원하는 영화에서 예매하기 버튼을 누르면 좌석선택 페이지로 넘어간다.
    + 좌석 선택(Update)
    > 사용자가 실제 screen과 좌석을 비교하며 선택할 수 있다.
    + 결제(Insert)
    > 사용자가 선택한 영화, 스크린, 좌석, 가격을 보여주고 결제방식을 받는다 그리고 결제하기 버튼을 누르면 최종 결제가 된다.
    > (예매를 하고나면 실시간으로 좌석이 업데이트 된다.
    >다시 예매선택을하면 이미 예매된 좌석은 disabled로 선택할 수 없게된다.
    >예매를 취소하면 다시 활성화 된다.)
    + 예매목록 조회(Select)
    > 예매 및 결제까지 완료하면 실제 예매조회에서 고객이 예매한 기록들을 조회할 수 있다.
    + 예매취소(Delete)
    > 위의 예매조회 탭에서 예매한 영화를 취소할 수 있다.
