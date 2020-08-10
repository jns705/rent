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
<style type="text/css"> header img{margin-top:0px !important;} </style>
<link href="http://localhost:8082/static/css/ss.css" rel="stylesheet" type="text/css" >
<meta charset="UTF-8">
<title>회원정보</title>
</head>
<body>
<br><br><br><br>
<div id="container">
	<form method="post" name="form1">
	<div class="breadcrumbs">
			<h2 class="tit" align="center">회원정보</h2>
			
			<div class="clearfix" align="left">
				<span>홈</span>
				<span class="cl-point2" style="width:300px;">회원정보</span>
			</div>
		</div>	
		
	<div class="article-content">
                <div class="input-field v1 mab0">
                
           <div class="input-row clearfix pat0 pal0 par0 brt0">
               <div class="fl col-10">
                   <span class="input essential">
                       <strong class="check">필수</strong>
                       <input type="text" value="아이디" style="width:150px;" readonly="readonly">
                   </span>
               </div>
               <div class="fl col-3">
                       <input type="text" value="${detail.id}" id="id" name="id" style="width:610px; background-color:#F4EEEE;" readonly="readonly">
               </div>
           </div>
           			
           <div class="input-row clearfix pat0 pal0 par0 brt0">
               <div class="fl col-10">
                   <span class="input essential">
                       <strong class="check">필수</strong>
                       <input type="text" value="이름" style="width:150px;" readonly="readonly">
                   </span>
                   <span class="msg-txt cl-point1">이름이 올바르지 않습니다. 다시 입력해주세요.</span>
               </div>
               <div class="fl col-3">
                       <input type="text" placeholder="직접 입력" value="${detail.name }" id="name" name="name" style="width:610px;" textname>
               </div>
           </div>
           
       	   <div class="input-row clearfix pat0 pal0 par0 brt0">
               <div class="fl col-10">
                   <span class="input essential">
                       <strong class="check">필수</strong>
                       <input type="text" value="전화번호" style="width:150px;" readonly="readonly">
                   </span>
                   <span class="msg-txt cl-point1">띄어쓰기 없이 10자 이상의 숫자만 입력 가능합니다.</span>
               </div>
               <div class="fl col-3">
                       <input type="text" placeholder="휴대폰번호(-없이 입력) 입력" value="${detail.tel}"  id="tel" name="tel" style="width:610px;" maxlength="11" numberOnly>
               </div>
           </div>
           
            <div class="input-row clearfix pat0 pal0 par0 brt0">
               <div class="fl col-11">
                   <span class="input essential">
                       <strong class="check">필수</strong>
                       <input type="text" value="주소" style="width:150px;" readonly="readonly">
                   </span>
               </div>
                 <div class="fl col-10">
                   <span class="input essential">
                       <input type="text" placeholder="우편번호" value="${address[0]}" id="zipcode"name="address0"style="width:150px;" readonly="readonly" class="readonly">
                   </span>
               </div>
                 <div class="fl col-5">
                   <span class="input essential">
                       <input type="text" placeholder="주소" value="${address[1]}" id="address" name="address1" style="width:310px;" readonly="readonly" class="readonly">
                   </span>
               </div>
                 <div class="fl col-5">
                   <span class="input essential">
                       <input type="text" placeholder="상세 주소" value="${address[2]}" id="address2" name="address2" style="width:310px;">
                   </span>
               </div>
                	<div class="fl col-11">
                   <span class="input">
                       <input type="button" value="주소검색" class="btn" style="background-color:#E8C2C2;" onclick="daumZipCode()">
                   </span>
               	</div>
           </div>
           
           <div class="input-row clearfix pat0 pal0 par0 brt0">
               <div class="fl col-10">
                   <span class="input essential">
                       <strong class="check">필수</strong>
                       <input type="text" value="생년월일" style="width:150px;" readonly="readonly">
                   </span>
               </div>
               <div class="fl col-3">
                       <input type="date" value="${detail.date_of_birth}" id="date_of_birth" name="date_of_birth" style="width:250px;">
               </div>
           </div>
           
          <div class="input-row clearfix pat0 pal0 par0 brt0">
               <div class="fl col-10">
                   <span class="input essential">
                       <strong class="check">필수</strong>
                       <input type="text" value="성별" style="width:150px;" readonly="readonly">
                   </span>
               </div>
               <div class="fl col-6">
                       <input type="text" value="${detail.gender}" id="gender" name="gender" style="width:150px; background-color:#F4EEEE;" readonly="readonly">
                       <button type="button" class="btn" style="width:50px;" id="gd" onclick="genderChange()"><span class=" glyphicon glyphicon-refresh"></span></button>
               </div>
           </div>
       </div>
       
	<div class="drop-content">
		<div class="drop-text">
			<ul class="list-info v1">
				<li><font color=red>회원탈퇴 할 경우 모든 데이터가 삭제되며 ??렌터카에서 책임질 수 없습니다.</font></li>
				<li>민원접수는 충분한 검토와 사실 관계 확인 후 빠른 시일내로 답변 드립니다.</li>
				<li>상담신청내역 및 답변은 MY렌터카 &gt; 상담내역 또는 이메일을 통해 확인이 가능합니다.</li>
				<li>상담이 집중되거나 주말의 경우 답변이 지연될 수 있으니 이점 양지하여 주시기 바랍니다.</li>
				</ul>
		</div>
	</div>
       
       <div class="counsel-btn-box btn-box text-c brt0">
           <button type="button" class="btn btn-color1 btn-large btn-fix3 login-check" onclick="updateCheck('${detail.password}');" formaction="${path}/member/update">수정완료</button>
           <button type="button" class="btn btn-color2 btn-large btn-fix3 login-check" onclick="deleteCheck('${detail.password}');" formaction="${path}/member/delete">탈퇴하기</button>
           <!-- btn-color4 : 비활성화 / btn-color1 : 활성화 -->
       </div>
       <!-- btn-box//end -->
       <div class="blank"></div>
   </div>
   </form>
</div>
</body>
<style>
.blank {
	height: 50;
}
</style>
<script>

$("input:text[textname]").on("keyup", function() {
    $(this).val($(this).val().replace(/[^a-zA-Zㄱ-힣]/gi,""));
});

$("input:text[numberOnly]").on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));
});
</script>
<script>
function updateCheck(value) {
	var password = value;
	var input = prompt("비밀번호를 입력해주세요. \n수정");
	if(password == input) {
		alert("수정하겠습니다.");
		document.form1.action="${path}/member/update";
		document.form1.submit();
		
	}else {
		alert("비밀번호가 틀렸습니다.");
	}
}
function deleteCheck(value) {
	var password = value;
	var input = prompt("비밀번호를 입력해주세요. \n삭제");
	if(password == input) {
		alert("삭제하겠습니다.");
	document.form1.action="${path}/member/delete";
	document.form1.submit();
		
	}else {
		alert("비밀번호가 틀렸습니다.");
	}
}

//성별 바꾸기
function genderChange() {
	var gender = document.getElementById('gender').value;
	if(gender == "남자") document.getElementById('gender').value = "여자";
	else if(gender == "여자") document.getElementById('gender').value = "남자";
}
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function daumZipCode() {
	new daum.Postcode({
		oncomplete: function(data) {
			//팝업에서 검색한 결과 항목을 클릭하였을 경우 실행할 코드를 작성하는 부분이다.
	
			//각 주소의 노출 규칙에 따라 주소를 조합한다.
			//내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기한다.
			var fullAddr  = '';	//최종 주소 변수
			var extraAddr = '';	//조합형 주소 변수
	
			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if(data.userSelectedType == 'R') {	//도로명 주소를 선택한 경우
				fullAddr = data.roadAddress;
			} else {	//지번 주소를 선택한 경우
				fullAddr = data.jibunAddress;
			}

			//사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if(data.userSelectedType == 'R') {
				//법정동명이 있을 경우 추가한다.
				if(data.bname != '') {
					extraAddr += data.bname;
				}
				//건물명이 있을 경우에 추가한다.
				if(data.buildingName != '') {
					extraAddr += (extraAddr != '' ? ', ' + data.buildingName : data.buildingName);
				}
				//조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr != '' ? ' (' + extraAddr + ')' : '' );
			}

			//우편번호와 주소정보를 해당 필드에 넣는다.
			document.getElementById('zipcode').value = data.zonecode; //5자리 새 우편 번호
			document.getElementById('address').value = fullAddr; //주소

			//커서를 상세주소 입력 필드로 이동한다.
			document.getElementById('address2').focus();
		}
	}).open();
}
</script>
</html>
</layoutTag:layout>