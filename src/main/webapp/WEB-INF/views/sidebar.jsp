<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/room.css" rel="stylesheet">
<link href="css/requestMsgModal.css" rel="stylesheet">


<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body>
	<!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="main.action">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">방 TING <sup></sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0"><br/>
            <!-- Heading -->
            <div class="sidebar-heading">
                MyPage
            </div>
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="<%=cp%>/myPage.action">
                    <i class="fas fa-address-card"></i>
                    <span>마이 페이지</span>
                </a>
            </li>

            <!-- Heading -->
            <div class="sidebar-heading">
                meeting
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-users"></i>
                    <span>모임</span>
                </a>
                <div id="collapseTwo" class="collapse show" aria-expanded="true" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded" >
                        <h6 class="collapse-header"><a class="small" href="<%=cp%>/index.action">모임 카테고리</a></h6>
                        <a class="collapse-item" href="<%=cp%>/list.action">전체</a>
                        <a class="collapse-item" href="<%=cp%>/list.action?subject=여행">여행</a>
                        <a class="collapse-item" href="<%=cp%>/list.action?subject=맛집">맛집</a>
                        <a class="collapse-item" href="<%=cp%>/list.action?subject=운동">운동</a>
                        <a class="collapse-item" href="<%=cp%>/list.action?subject=공부">공부</a>
                    </div>
                </div>
            </li>
             <!-- Heading -->
            <div class="sidebar-heading">
                Recommend
            </div>
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo2"
                    aria-expanded="true" aria-controls="collapseTwo2">
                    <i class="far fa-thumbs-up"></i>
                    <span>추천장소</span>
                </a>
                <div id="collapseTwo2" class="collapse show" aria-expanded="true" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded" >
                        <h6 class="collapse-header"><a class="small" href="<%=cp%>/reco?subject=">추천장소</a></h6>
                        <a class="collapse-item" href="reco?subject=travel">여행</a>
                        <a class="collapse-item" href="reco?subject=sports">운동</a>
                        <a class="collapse-item" href="reco?subject=study">공부</a> 
                    </div>
                </div>
            </li>

            <!-- Divider -->
         

            <!-- 사이드바 공간1 -->

            <!-- Divider -->
            
            
            <!-- 사이드바 공간2 -->

        </ul>
        <!-- End of Sidebar -->
</body>
</html>