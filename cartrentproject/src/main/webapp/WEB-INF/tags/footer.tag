<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<style>
@font-face				{
	font-family			:	"myfont";
	src					:   local("impact"),
							local("Britannic-Bold"),
							url(MgOpenModernaBold.ttf);
	font-weight			:	bold;
}

footer					{
	margin				:	50px 0 0 0;
	height				:	30px;
	background-image	:	url(../images/under_logo.gif);	
	background-repeat	:	no-repeat;
	background-position	:	40px center;
}

footer hr				{
	width				:	900px;
	margin				:	0 0 0 15px !importent;
	margin				:	0 0 0 35px;
}

footer #copy 			{
	font-family			:	"myfont";
	width				:	450px;
	margin				:	20px 0 0 260px;
	float				:	left;
}

footer #social			{
	width				:	130px;
	margin				:	20px 20px 0 0;
	float				:	right;
}

footer #social img		{
	margin				:	0 7px;
}
</style>
	<footer>
		<hr>
		<div id="copy">
		<a href="../images/logo.png"><img src="../images/logo.png"/></a>
		All contents Copyright 2007 MyPage Inc. all rights reserved<br>
		Contact mail : admin@mypage.com Tel: +82 02 1234 5678 Fax: +82 02 1234-5679
		</div>
		<div id="social">
			<a href = "#"><img src="../images/facebook.gif" width="33" height="33"></a>
			<a href = "#"><img src="../images/twitter.gif" width="33" height="34"></a>
		</div>
	</footer>