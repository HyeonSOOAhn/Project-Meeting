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


  - [추천장소 API](#추천-장소-api) : 전국의 도서관, 운동시설, 관광지를 보여줌


  - [카카오맵 API](#카카오맵-api) : 카카오 맵 API를 이용하여 지도에 마커와 함께 위치를 보여줌


  - [검색필터](#검색필터) : 사용자가 검색하기 편하도록 필터를 사용, Geolcation을 이용한 내위치 기반 거리순 정렬


  - [로그인 세션 확인](#로그인-세션확인) : 인터셉터를 이용한 로그인 세션 확인

## 개발환경
  - 언어
    * JAVA(jdk1.6)
    * HTML5/CSS3
    * JavaScript 'ES6'


  - 프레임워크
    * Spring4.3.0
    * Jquery / Ajax
    * Bootstrap


  - 서버(WAS)
    * Apache Tomcat v8.5


  - 개발도구
    * STS 3.0


  - 형상관리도구
    * Git / Github



## DATABASE
![ERD](https://user-images.githubusercontent.com/77277946/124222816-6c378d00-db3d-11eb-83d1-0a19569ae231.png)




## 기능구현

  ### 추천 장소 api
  1. 공공데이터에서 약 **7500**여개의 장소 정보를 **JasonParser를 이용하여 파싱한 후 DB에 저장**.<br/>
![recommend count](https://user-images.githubusercontent.com/77277946/124158790-4e364200-dad5-11eb-98e4-cdc59f5cf3ec.png)
  2. DB에서 불러와 정렬함.
![image](https://user-images.githubusercontent.com/77277946/124162411-5c865d00-dad9-11eb-93e8-aafdfe4cca9d.png)

  ### 카카오맵 api
  1. DB에 저장되어 있는 위도와 경도를 DB에서 PK를 통해 불러와 위치를 띄움.
![image](https://user-images.githubusercontent.com/77277946/124162457-6b6d0f80-dad9-11eb-92e9-782ec1ace3ac.png)
  2. 카카오맵 아이콘을 눌러 카카오맵 길찾기 링크 구현
    ![kakaoMap](https://user-images.githubusercontent.com/77277946/124160227-01ec0180-dad7-11eb-8051-0e6e0cf1e92b.png)
![image](https://user-images.githubusercontent.com/77277946/124162491-7889fe80-dad9-11eb-9656-0a73a757bdf3.png)
    
  ### 검색필터
  1. 오라클DB에는 **RADIANS** 함수가 없어 함수 생성후 위도,경도 기반 거리계산 함수생성 
     
            CREATE OR REPLACE FUNCTION RADIANS(nDegrees IN NUMBER) 
            RETURN NUMBER DETERMINISTIC 
            IS
            BEGIN
            RETURN nDegrees / 57.29577951308232087679815481410517033235;
            END RADIANS;
            /

            create or replace function DISTNACE_WGS84( H_LAT in number, H_LNG in number, T_LAT in number, T_LNG in number)
            return number deterministic
            is
            begin
              return ( 6371.0 * acos(  
                      cos( radians( H_LAT ) )*cos( radians( T_LAT /* 위도 */ ) )
                      *cos( radians( T_LNG /* 경도 */ )-radians( H_LNG ) )
                      +
                      sin( radians( H_LAT ) )*sin( radians( T_LAT /* 위도 */ ) )        
                     ));
            end DISTNACE_WGS84;
            /
      
  2. geolocation을 통해 불러온 내위치 위도 경도와 DB에 저장되어 있는 위도와 경도를 **DISTNACE_WGS84**함수에 넣어 거리순으로 정렬(주소창의 내 위도,경도는 개인정보를 위해 임의의 값으로 다시 입력했음)
      ![image](https://user-images.githubusercontent.com/77277946/124162817-de768600-dad9-11eb-95a1-2eb9e5c6fa5d.png)


  ### 로그인 세션확인
  1. **인터셉터**를 통해 세션을 확인하여 로그인여부 확인과 DB에 저장된 메세지 확인

    public class AuthInterceptor extends WebContentInterceptor {
	
	@Autowired
	RoomDAO roomDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		{
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		UserInfo info = (UserInfo) session.getAttribute("userInfo");
		if(info==null||info.equals(null)) {
			try {
				
				PrintWriter out = response.getWriter();
				out.print("<script>alert('로그인을 다시 해주십시오');"
						+ "location.href='/meeting/login.action';</script>");
				out.flush();
				out.close();
				
				
			} catch (IOException e) {
				return false;
			}
			return false;
		}
		// 내메세지 가져오기
		List<msgDTO> msgList = roomDao.getMsgList(info.getUserId());
		session.setAttribute("msgList", msgList);
		return true;
	  }
    }
  
  ![image](https://user-images.githubusercontent.com/77277946/124163872-04505a80-dadb-11eb-9f15-0d8def116851.png)
## Collaborator
@DYKIM9866<br>
로그인 회원가입,myPage 구현, 프로필 관련 구현, 메세지 전달 구현, 알림 구현, 전체적인 front-end

@HyeonSOOAhn<br>
추천목록, (도서관,운동시설,관광지)파싱 후 view단에 뿌리기, 데이터 상세페이지, 데이터 상세페이지 리뷰&평점, 카카오맵API를 이용한 추천장소 지도 띄우기, Geolocation api를 이용한 내위치 기반 거리순 정렬, 검색필터, 인터셉터를 이용한 로그인 세션확인 

@kth0423<br>
각 방 별 게시물 생성, 수정, 삭제 / 게시물 분류별 검색 

@stbhg5<br>
방 생성, 목록, 수정, 삭제 구현,  내정보 구현, 방 내부 팅 생성, 목록 구현, Ajax를 이용한 팅 댓글 구현


