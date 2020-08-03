<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>솔렌트카 로그인 페이지</title>
</head>
<body>
	<c:if test="${sessionScope.id != null and check == 0}">
		<script type="text/javascript">
			location.href='${path}/main';
		</script>
	</c:if>
	<c:if test="${sessionScope.id != null and check == 1}">
		<script type="text/javascript">
			location.href='${path}/counseling/userList';
		</script>
	</c:if>
	<div id="content">
    <div id="container" class="col-half">
    
    
        <div class="breadcrumbs text-c">
            <h2 class="tit">로그인</h2>
        </div>
		<form class="form-horizontal" action="${path}/member/loginProc" method="get" name="form1">
	    <input type="hidden" id="check" name="check" value="${check}">
            <div class="tab-menu v3">
                <ul>
                    <li class="col-2 selected">
                        <a href="#login-personal" id="persn">개인회원/개인사업자</a>
                    </li>
                </ul>
            </div>
                <div class="input-field field-large">
                    <div class="input-row">
                        <span class="input input-large">
							<input type="text" class="form-control idinput" id="id" name="id" size="10" placeholder="아이디를 입력하세요"/>
                        </span>
                    </div>
                    <div class="input-row">
                        <span class="input input-large">
							<input type="password" class="form-control" name="password" size="10" placeholder="비밀번호를 입력하세요"/>
                        </span>
                    </div>
                    <div class="input-row">
                        <span id="login-span" class="checkbox">
                            <input type="checkbox" id="chkuser_id"  name="chkuser_id" class="idchk" >
                            <label for="id-presonal-remember">아이디 저장</label>
                        </span>
                        <span id="login_msg" class="msg-txt cl-point1 text-c"></span>
                    </div>
                </div>
                <div class="join-btn-box btn-box text-c">
                    <button class="btn btn-color2 btn-block btn-large" onClick="saveid(document.new_user_session);">로그인</button>
                </div>
                <div id="login-personal" class="tab-content" style="display: block;">
	                <div class="join-alert">
	                    <div class="btn-box text-c">
	                        <a onclick="location.href='${path}/member/insertForm'" class="btn">간편회원가입</a>
	                    </div>
	                </div>
                </div>
        </form>
    </div>
    
</div>
	
</body>
<script>
$(function(){
	var check = document.getElementById('check').value;
	getid();
	$("#chkuser_id").click(function(){
		saveid();
	}); //#chkuser_id.click
}); //function(){
  
 function saveid() {
   var expdate = new Date();
   // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
   if($("#chkuser_id").prop("checked")){
    expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
   } else {
    expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
   }
   setCookie("saveid", $("#id").val(), expdate);

	if(check == 1) {
		alert("zzdasd");
		document.form1.action="${path}/member/loginProc?check="+check;
		document.form1.submit();
	}
	
 } //saveid()
 
 function setCookie (name, value, expires) {
    document.cookie = name + "=" + escape (value) +"; path=/; expires=" + expires.toGMTString();
  } //setCookie(name,value,expires)

  function getCookie(Name) {
    var search = Name + "=";
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
      offset = document.cookie.indexOf(search);
      if (offset != -1) { // 쿠키가 존재하면
        offset += search.length;
        // set index of beginning of value
        end = document.cookie.indexOf(";", offset);
        // 쿠키 값의 마지막 위치 인덱스 번호 설정
        if (end == -1)
          end = document.cookie.length;
        return unescape(document.cookie.substring(offset, end));
      }
    }
    return "";
  } //getCookie(Name)

 function getid() {
  var saveId = getCookie("saveid");
  if(saveId != "") {
   $("#id").val(saveId);
   $("#chkuser_id").prop("checked",true);
  }
 } //getid()
</script> 

</html>
</layoutTag:layout>