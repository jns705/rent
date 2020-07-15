<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="now" class="java.util.Date" />
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 홈페이지</title>
</head>
<body>
	
	<div class="container">
	<br>
	<label class="control-label"><font size="+3"><b>간편 회원가입</b></font></label><br><br>
		<form class="form-horizontal" action="${path}/member/insertProc" method="get">
			<div class="panel panel-default">
				<div class="container">
				<br><br><br>
				
				<div class="form-group">
					<label class="control-label col-sm-2">아이디</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="id" size="10" placeholder="아이디를 입력하세요" oninput="idCheck();"/>
					</div>
					<label style="text-align: left; color:red;" id="id" class="control-label col-sm-4"></label>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">비밀번호</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" name="password" size="10" placeholder="비밀번호를 입력하세요" oninput="pwCheck();"/>
					</div>
					<label style="text-align: left; color:red;" id="password" class="control-label col-sm-4">ss</label>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">비밀번호 확인</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" name="rePassword" size="10" placeholder="비밀번호를 입력하세요" oninput="repwCheck();"/>
					</div>
					<label style="text-align: left; color:red;" id="rePassword" class="control-label col-sm-4">ss</label>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">이름</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="name" size="10" placeholder="이름을 입력하세요"/>
					</div>
					<label style="text-align: left; color:red;" id="name" class="control-label col-sm-4">ss</label>
				</div>

				
				<div class="form-group">
					<label class="control-label col-sm-2">전화번호</label>
						<div class="col-sm-2">
							<select class="form-control" name="tel1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="019">019</option>
							</select>
						</div>
						
						<div class="col-sm-2">
							<input type="text" class="form-control" name="tel2" size="10" placeholder="전화번호"/>
						</div>
						<div class="col-sm-2">
							<input type="text" class="form-control" name="tel3" size="10" placeholder="전화번호"/>
						</div>
					<label style="text-align: left; color:red;" id="tel" class="control-label col-sm-4">ss</label>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">주소</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="address" size="10" placeholder="주소를 입력하세요"/>
					</div>
					<label style="text-align: left; color:red;" id="address" class="control-label col-sm-4">ss</label>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">생년월일</label>
						<div class="col-sm-4">
							<input type="date" class="form-control" name="date_of_birth">
						</div>
					<label style="text-align: left; color:red;" id="birth" class="control-label col-sm-4">ss</label>
				</div>		
						
				<div class="form-group">
					<label class="control-label col-sm-2">성별</label>
					<div class="col-sm-2">
						<select class="form-control" name="gender">
							<option>남자</option>
							<option>여자</option>
						</select>
					</div>
				</div>
				
				<br><br>
					<div class="form-group">
						<div class="col-sm-offset-1 col-sm-4">
							<input class="col-sm-1" type="checkbox">
							<div class=col-sm-8>
							<p><b>개인정보 수집 동의</b></p>
							</div>
						</div>
					
					<div class="panel panel-default col-sm-offset-1 col-sm-10" align="left">
						<p>(주)솔렌트카는 고객의 개인정보를 소중히 여기며, 개인정보보호법 및 정보통신망 이용촉진 및 정보보호에 관한 법률을 준수합니다</p>
						<p>1. 개인정보의 수집 및 이용목적</p>
						<p>  실시간 견적 및 월렌트 예약을 위한 이메일 계정등록</p>
						<p> * 상기 목적외의 용도로 사용하지 않으며, 이용자 개인정보를 외부에 제공하거나 활용하지 않습니다.</p>
						<p>2. 수집하는 개인정보 항목</p>
						<p>필수항목 : 이메일, 비밀번호</p>
					</div>				
					</div>			
				<div align="center">
					<button class="btn btn-lg" type="button" onclick="inserForm();">간편 회원가입</button>
				</div><br><br><br>
				
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
//이름 검사(정규식)
function isNameCheck(input) {
	var var_normalize 	= /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;  //정규식
	if(var_normalize.test(input))	return false;
	else						 	return true;
}//End - function isNameCheck(inputVal)

//숫자 검사(정규식)
function isNumberCheck(inputVal) {
	var var_normalize = /[^0-9]/gi;		//정규식
	if(var_normalize.test(inputVal))return false;
	else							return true;
}//End - function isNumberCheck(inputVal)

function refalse(data, content){
	data.html(content);
	data.focus();
	data.css("color","red");
}
function retrue(data, content){
	data.html(content);
	data.focus();
	data.css("color","green");
}

	function idCheck(){
		if(!$('[name=id]').val())
			refalse($('#id'),'이름을 입력해주세요');
		else if(!isNameCheck($('[name=id]').val()))
			refalse($('#id'),'특수문자는 사용할 수 없습니다.');
		else if($('[name=id]').val().length < 4 || $('[name=id]').val().length > 8 )
			refalse($('#id'),'아이디는 4~7글자 사이로 입력가능합니다.');
		else
		$.ajax({
			url 	: '/member/idCheck',
			type	: 'get',
			data	: {'id': $('[name=id]').val()},
			success : function(data){
				if(data == 1)
					refalse($('#id'),'중복된아이디가 있습니다.');
				else
					retrue($('#id'),'확인되었습니다.')
			}
		});
		
	}
</script>
</html>
</layoutTag:layout>