# Project-Meeting
<img src="https://user-images.githubusercontent.com/77277946/124152008-17106280-dace-11eb-99fa-2fb8c6ed6132.png" width="width 300" height="height 150">

자바 스프링프레임워크를 이용한 미팅 웹서비스 개발<br/>
"공통된 관심사를 기반으로한 모임 서비스"


## 목차
  - [프로젝트 목표](#프로젝트-목표)


  - [프로젝트 핵심기능](#프로젝트-핵심기능)


  - [개발환경](#개발환경)


  - [DATABASE](#database)


  - [기능구현](#기능구현)



## 프로젝트 목표
  - 공통된 관심사를 기반으로 모임 서비스를 제공


  - 관심사별로 가고 싶은 곳 추천 제공



## 프로젝트 핵심기능
  - 이메일인증 : 회원가입시 입력했던 이메일을 통해 본인 메일인증


  - 팅 :  만남을 주선하고 싶은 사람이 팅을통해 만남에 대한 소개와 만남일시,장소,추천인원을 정하고 참여하고 싶은사람이 댓글을 통해 참여하는 방식


  - 추천장소 API : 전국의 도서관, 운동시설, 관광지를 보여줌


  - 검색필터 : 사용자가 검색하기 편하도록 필터를 사용, Geolcation을 이용한 내위치 기반 거리순 



## 개발환경
  - 언어
    * JAVA(jdk1.6)
    * HTML5/CSS3
    * JavaScript 'ES6'


  - 프레임워크
    * Spring4.3.0
    * Jquery
    * Bootstrap


  - 서버(WAS)
    * Apache Tomcat v8.5


  - 개발도구
    * STS 3.0


  - 커뮤니티
    * Github



## DATABASE
![ERD](https://user-images.githubusercontent.com/77277946/124152011-1972bc80-dace-11eb-84c0-b5ec6e570a96.png)




## 기능구현
  - 추천 장소 API
  <!-- 업데이트 -->
  <update id="insertData" parameterType="com.project.dto.RecoDTO">

    MERGE INTO Recommend
    USING DUAL ON (recoNum = #{recoNum})
    WHEN MATCHED THEN
    UPDATE SET
    subject = #{subject},keyword = #{keyword},
    title = #{title, jdbcType=VARCHAR}, introduce = #{introduce, jdbcType=VARCHAR},content = #{content, jdbcType=VARCHAR},
    location = #{location, jdbcType=VARCHAR},
    lat = #{lat, jdbcType=VARCHAR},lon = #{lon, jdbcType=VARCHAR}
    WHEN NOT MATCHED THEN
    INSERT
    (recoNum,subject,keyword,title,
    introduce,content,location,lat,lon)
    VALUES
    (#{recoNum},#{subject},#{keyword},
    #{title, jdbcType=VARCHAR}, #{introduce, jdbcType=VARCHAR},#{content, jdbcType=VARCHAR},
    #{location, jdbcType=VARCHAR},
    #{lat, jdbcType=VARCHAR},#{lon, jdbcType=VARCHAR})
  </update>

## Collaborator
@DYKIM9866<br>

@HyeonSOOAhn<br>
추천목록, (도서관,운동시설,관광지)파싱 후 view단에 뿌리기, 데이터 상세페이지, 데이터 상세페이지 리뷰&평점, 카카오맵API를 이용한 추천장소 지도 띄우기, Geolocation api를 이용한 내위치 기반 거리순 정렬, 검색필터, 인터셉터를 이용한 로그인 세션확인 
@kth0423<br>

@stbhg5<br>
방 생성, 목록, 수정, 삭제 구현,  내정보 구현, 방 내부 팅 생성, 목록 구현, 아작스를 이용한 팅 댓글 구현


