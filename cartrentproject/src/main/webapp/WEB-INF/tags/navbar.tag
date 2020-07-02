<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="">
<c:set var="URL" value="${pageContext.request.requestURL}" />

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#MyMenu">
				<span class="sr-only">Toggle Menu</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<img src="http://localhost:8082/static/img/logo2.png" width="100" height="60"/>
		</div>			 
		<!-- 실질적인 메뉴를 나열 -->
		<div class="collapse navbar-collapse" id="MyMenu">
			<ul class="nav navbar-nav navbar-right">
				 <li <c:if test="${fn : contains(URL, 'list')}">class="active"</c:if> ><a href="/board/list/1/subject/all">게시글 목록</a></li>
				 <li <c:if test="${fn : contains(URL,'insert')}">class="active"</c:if> ><a href="/board/insert">게시글 등록</a></li>
				 <li class="dropdown">
				 	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">DropDown <span class="caret"></span></a>
				 	<ul class="dropdown-menu" role="menu">
				 		<li><a href="#">Menu A</a></li>
				 		<li><a href="#">Menu B</a></li>
				 		<li><a href="#">Menu C</a></li>
				 		<li class="divider"></li>
				 		<li><a href="#">Exit</a></li>
				 	</ul>
				 </li>
			</ul>
		</div>
	</div>
</nav>