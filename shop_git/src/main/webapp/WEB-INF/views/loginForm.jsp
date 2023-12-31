<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 실패시 반환받는 메세지를 디코딩 하기 위한 설정 -->    
<%@ page import="java.net.URLDecoder" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/link-rel.jsp" />
<title>로그인 페이지</title>
    <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>    
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
</head>
<body>
  <jsp:include page="/WEB-INF/views/header.jsp" />	
	<div class="login-form">
    <form method="post" action="<c:url value="/login/postLogin"/>">
        <h2 class="text-center">Log in</h2> 
        <!-- 로그인 실패시 메세지 출력 -->
		<c:if test="${not empty param.msg }">
			<span class="msg">${URLDecoder.decode(param.msg)}</span>
		</c:if>      
        <div class="form-group">
            <input type="text" name="id" class="form-control" value="${cookie.id.value ? '' : cookie.id.value }" placeholder="Id" required="required">
        </div>
        <div class="form-group">
            <input type="password" name="password" class="form-control" placeholder="Password" required="required">
        </div>        
        <div class="form-group">
        		<input type="hidden" name="toURL" value="${param.toURL}">
            <button type="submit" class="btn btn-primary btn-block">Log in</button>
        </div>
        <div class="clearfix">
            <label class="pull-left checkbox-inline">
            <input type="checkbox" id="rememberId" name="rememberId" value="on" ${empty cookie.id.value ? "" : "checked" }>
             Remember me
            </label>
            <a href="#" class="pull-right">Forgot Password?</a>
        </div>        
    </form>
    <p class="text-center"><a href="<c:url value="/register/getRegister"/>">Create an Account</a></p>
	<!-- 카카오 로그인 -->
	<button id="kakao_login_Btn" class="btn btn-block waves-effect waves-light btn-rounded btn-outline-info mb-3">
   	 <img class="kakao_login" alt="카카오로그인" src="<c:url value='/imgUpload/kakaoLogin.png'/>" onclick="loginWithKakao()">
    </button>
    
</div>
<!-- <div class="col-lg-12 text-center mt-3">
    
</div> -->
	    <jsp:include page="/WEB-INF/views/footer.jsp" />						
</body>
		<jsp:include page="/WEB-INF/views/script.jsp" />

<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script type="text/javascript">
    $(document).ready(function(){
        Kakao.init('3cad3b1574d49fa40603a7bd12224f0a');
        Kakao.isInitialized();
    });

    function loginWithKakao() {
        Kakao.Auth.authorize({ 
        redirectUri: 'http://localhost:8080/shop/kakao/kakao_callback' 
        }); // 등록한 리다이렉트uri 입력
    }
    
   
</script>		
		
</html>
