<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>noName</title>

    <!-- 부트스트랩 -->
    <link href="/origin/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="/origin/resources/css/custom.css" rel="stylesheet">
  </head>
  <body>
  <div class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">
			<span class="glyphicon glyphicon-remove-sign"></span>
				noNAME
			</a>
			<button class="navbar-toggle" data-toggle="collapse" data-target="#navMenu">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		
		<div class="collapse navbar-collapse" id="navMenu">
			<ul class="nav navbar-nav">
				<li class="dropdown">
					<a href="intro.do" class="dropdown-toggle" data-toggle="dropdown">noName? <span class="caret"></span></a>
				<ul class="dropdown-menu" role="menu">
					<li><a href="intro.do">noName?</a></li>
					<li><a href="location.do">오시는 길</a></li>
				</ul>
				</li>
				<li><a href="bbs.do?page=1">BBS</a></li>
				<li><a href="shopMain.do">Shopping</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				
				<li>
					<c:if test="${nickname==null && admin==null}">
						<button id="logoutBtn" class="btn btn-default img-button" onclick="location.href='naverLogin.do'"><img src="/origin/resources/images/login.PNG" alt="login" /></button>
					</c:if>
					<c:if test="${nickname!=null}">
						${nickname}님 
						<button id="logoutBtn" class="btn btn-default img-button" onclick="logoutFunc()"><img src="/origin/resources/images/logout.PNG" alt="logout" /></button>
					</c:if>
					<c:if test="${admin!=null}">
						${admin}님 
						<input type="button" value="Logout" onclick="managerLogout()" />
					</c:if>
				</li>
			</ul>
			
		</div>
	</div>
  </div>
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="/origin/resources/js/jquery-3.1.0.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="/origin/bootstrap/js/bootstrap.min.js"></script>
    <script>
    function logoutFunc(){
    	logoutWindow = window.open("http://nid.naver.com/nidlogin.logout", "logoutWindow", "width=10, height=10");
		setTimeout(function(){ logoutWindow.close(); }, 100);
		setTimeout(function(){ location.href="naverLogout.do"; }, 300);
    }
    function managerLogout(){
    	location.href="admin/managerLogout.do";
    }
    </script>