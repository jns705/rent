	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담신청</title>
<link href="http://localhost:8082/static/css/ss.css" rel="stylesheet" type="text/css" >
</head>
<body>

<div id="content">
	<div id="container">
		<div class="breadcrumbs">
			<h2 class="tit">장기렌트카 다이렉트</h2>
			
			<div class="clearfix">
				<span>홈</span>
				<span class="">장기렌트카</span>
				<span class="cl-point2">솔장기렌터카 다이렉트</span>
			</div>
		</div>	
	<form action="${path}/counseling/insertProc" method="post" name="insertForm">
	
	<input type="hidden" name="id" value="${sessionScope.id}"> <!-- 회원이면 id값 비회원이면 null -->
	<input type="hidden" name="rent_id" value="${rent.rent_id}">	<!-- 렌트차량 고유아이디 -->
	<input type="hidden" name="color" value="${rent.color}">	<!-- 차량 색상 -->
	<input type="hidden" name="month" value="${month}">	<!-- 계약기간 -->
	
	<article>
		<div class="header-group header_top header_bd">
		<h3>상담신청</h3>
		</div>
		<div class="input-field v1">
			<p class="msg-info v1 bt">
			중고차장기 상담신청 시 등록하신 유선 또는 이메일로만 답변을 받으실 수 있으며, 홈페이지에서는 답변 확인 불가능합니다.
			</p>
			
			<div class="input-row clearfix">
				<div class="fl col-3">
					<span class="input essential">
						<strong class="check">필수</strong>
						<label><input type="text" placeholder="이름 입력" value="${member.name }" name="name" id="name" textname></label>
					</span>
				</div>
				<div><p id="nameput" style="color:red;"></p></div>
			</div>
			
			 <div class="input-row clearfix brt0 pat0">
                 <div class="fl col-10">
                   <span class="input essential">
                   <strong class="check">필수</strong>
                       <input type="text" placeholder="우편번호" value="${address[0]}" id="zipcode"name="address0"style="width:150px;" readonly="readonly" class="readonly">
                   </span>
               </div>
                 <div class="fl col-3">
                   <span class="input essential">
                       <input type="text" placeholder="주소" value="${address[1]}" id="address1" name="address1" style="width:310px;" readonly="readonly" class="readonly">
                   </span>
               </div>
                 <div class="fl col-3">
                   <span class="input essential">
                       <input type="text" placeholder="상세 주소" value="${address[2]}" id="address2" name="address2" style="width:310px;" oninput="checkAdd();">
                       <p id="addput" style="color:red;"></p>
                   </span>
               </div>
                	<div class="fl col-11">
                   <span class="input">
                       <input type="button" value="주소검색" id="add" class="btn" style="background-color:#E8C2C2;" onclick="daumZipCode()">
                   </span>
               	</div>
           </div>
			
			<div class="input-row clearfix brt0 pat0">
				<div class="fl col-3">
					<span class="input essential">
						<strong class="check">필수</strong>
						<label><input type="text" value="${member.tel}" placeholder="휴대폰 번호(-없이) 입력" maxlength="11" id="tel" name="tel" numberOnly></label>
                        
					</span>
				</div>
				<div><p id="telput" style="color:red;"></p></div>
			</div>
			<div class="input-row clearfix brt0 pat0">
				<!-- DB에 안들어가는데 있어서 해봄 -->
				<div class="fl">
					<div class="counsel-email-input input-box">
						<span class="input essential col-3">
							<strong class="check">필수</strong>
							<label><input type="text" placeholder="이메일 입력" maxlength="30" id="emailId" name="emailId"></label>
						</span>
						<span class="input hyphen col-3">
							<span class="text">@</span>
							<input type="text" placeholder="직접 입력" maxlength="30" id="emailDomain" name="emailDomain">
						</span>
						<span class="select2 select2-container select2-container--default" dir="ltr" style="width: 209px;">
							<span class="selection">
								<select id="mailDomain" class="form-control" style="width: 200px; height: 42px;" onchange="email(this.value);">
									<option value="direct">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
									<option value="chol.com">chol.com</option>
									<option value="dreamwiz.com">dreamwiz.com</option>
									<option value="empal.com">empal.com</option>
									<option value="freechal.com">freechal.com</option>
									<option value="hanafos.com">hanafos.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="hanmir.com">hanmir.com</option>
									<option value="hitel.net">hitel.net</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="korea.com">korea.com</option>
									<option value="nate.com">nate.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="yahoo.com">yahoo.com</option>
									<option value="orgio.net">orgio.net</option>
								</select>
							</span>
						</span>
					</div>
				</div>
			</div>
<script>
	function email(e) {
		if(e == "direct"){
			$('#emailDomain').removeAttr('readonly');
			$('#emailDomain').css("background", "");
			$('#emailDomain').val('');
		}else {
			$('#emailDomain').prop('readonly', true);
			$('#emailDomain').css("background", "skyblue");
			$('#emailDomain').val(e);
		}
	}
</script>
			
			<div class="input-row brt0 pat0">
				<div class="col-1">
					<span class="input textarea essential">
					<strong class="check">필수</strong>
					<textarea id="a" placeholder="문의 내용 입력" name="contents">
모델명 : ${car.car_name}
차량 번호 : ${rent.car_number}
계약기간 : ${month}개월
월 렌탈료 : ${totalPrice}
초기 납부 조건 : ${deposit}
					</textarea>
				</span>
				</div>
			</div>
		</div>
		</article>
		
		<article>
		<div class="header-group">
			<h3>개인정보 제공 활용 동의</h3>
		</div>
		
		<div class="article-content">
			<div class="terms-list">
				<p class="tit-deafult">솔렌터카㈜는 적법하고 공정한 방법으로 개인정보를 수집하며, 고객의 개인정보를 최우선으로 생각하여 안전하게 보유·관리하고 있습니다.</p>
				<div class="terms-header">
					<span class="checkbox v2">
						<input type="checkbox" id="select-terms1" name="agreeYn1">
						<label class="label" for="select-terms1">
						<h4>개인정보 수집 및 이용동의<span class="cl-point1">(필수)</span></h4>
						</label>
					</span>
				</div>
				
				<div class="terms-content scroll-no">
					<table class="tb-cnt tb-my cnt-center">
						<caption>개인정보 수집 및 이용동의에 대한 안내 표</caption>
						<colgroup>
							<col width="33%">
							<col width="33%">
							<col width="*">
						</colgroup>
<style>
.tb-cnt.tb-my thead th.font{font-size:15px; font-weight:700; letter-spacing:-0.7px;}
.tb-cnt.cnt-center tbody td.font{font-size:15px; font-weight:700; letter-spacing:-0.7px;}
</style>
						<thead>
							<tr>
								<th scope="col">수집항목(필수)</th>
								<th scope="col">이용목적</th>
								<th scope="col">보유 및 이용기간</th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td>이름, 휴대폰번호, 이메일, 지역</td>
								<td>차량 대여상품 상담 및 판매</td>
								<td class="font">최종 상담 진행일로부터 1년 또는 동의 철회시까지</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<span class="msg-txt cl-point1 text-c" style="display: none;">
				<span class="ico ico-noti"></span>개인정보 수집 및 이용에 동의하셔야 상담신청이 가능합니다.
				</span>
				<p class="msg-info v1">고객님께서는 동의를 거부할 권리가 있으나, 미 동의 시 상담이 불가능합니다.</p>
			</div>
			
			<div class="terms-list">
				<div class="terms-header">
					<span class="checkbox v2">
						<input type="checkbox" id="select-terms2" name="agreeYn2">
						<label class="label" for="select-terms2"><h4>개인정보 위탁안내<span class="cl-point1">(필수)</span></h4>
						</label>
					</span>
				</div>
				
				<div class="terms-content scroll-no">
					<table class="tb-cnt tb-my cnt-center">
						<caption>개인정보 위탁안내에 대한 안내 표</caption>
						<colgroup>
							<col width="50%">
							<col width="*">
						</colgroup>
						
						<thead>
							<tr>
								<th scope="col">수탁사</th>
								<th scope="col">처리 위탁업무 내용</th>
							</tr>
						</thead>
						
						<tbody>
							<tr>
								<td class="text-c">
									솔렌터카(주)와 자동차 대여 중개 계약을<br>
									체결한 Sales Partner<br>
								</td>
								
								<td>
									- 자동차 대여 계약 체결의 중개/유지 및 관련 부수 업무 (자동차 대여계약서, 약관, 대여차량에 대한 설명 및 안내)
									<br>
									- 신규 고객 발굴을 위한 각종 영업활동 등 자동차 대여 중개와 밀접한 관련이 있는 업무 일체
								</td>
							</tr>
							
							<tr>
								<td class="text-c">솔렌터카서비스(주)</td>
								<td>
								장기/중기/단기렌탈 계약 및 지점 운영업무 수행, 고객센터 운영, 당사 상품 및 서비스 안내 TM (단, TM은 사전동의를 얻은 경우에 한함)
								</td>
							</tr>
							
							<tr>
								<td class="text-c">
								잡플러스, 라온HR, 파인스태프 등 10여 업체<br>
								</td>
								<td>영업점/고객센터 업무처리 및 고객상담, 계약 등</td>
							</tr>
							
							<tr>
								<td>솔주식회사 C&C, (주)AJ네트웍스, (주)알엔비소프트</td>
								<td>정보시스템 개발 및 유지/관리, 인프라 및 DB운영</td>
							</tr>
							
							<tr>
								<td class="text-c">솔인포섹(주)</td>
								<td>정보시스템 보안관리</td>
							</tr>
							
							<tr>
								<td class="text-c">(주)더홍, 미디어포스원</td>
								<td>솔렌터카, 빌리카 홈페이지 관리/운영</td>
							</tr>
							
							<tr>
								<td class="text-c">(주)다우기술</td>
								<td>SMS/MMS 발송 서비스 제공</td>
							</tr>
							
							<tr>
								<td class="text-c">(주)비즈톡</td>
								<td>알림톡/SMS/MMS/이메일 발송 서비스 제공</td>
							</tr>
							
							<tr>
								<td class="text-c">(주)넷퍼시</td>
								<td>eDM 발송 시스템 유지보수</td>
							</tr>
							
							<tr>
								<td class="text-c">에이블컴(주)</td>
								<td>보이는 ARS 서비스</td>
							</tr>
							
							<tr>
								<td class="text-c">(주)큐브세븐틴, 주식회사 얼리슬로스</td>
								<td>해피콜 시스템 공급</td>
							</tr>
							
							<tr>
								<td class="text-c">(주)세종텔레콤, 나래인터넷주식회사, LG유플러스</td>
								<td>080 수신거부 서비스 제공</td>
							</tr>
							
							<tr>
								<td class="text-c">(주)휴머스온</td>
								<td>PUSH 메세지 발송 서비스 제공</td>
							</tr>
							
						</tbody>
					</table>
				</div>
				
				<span class="msg-txt cl-point1 text-c" style="display: none;">
				<span class="ico ico-noti"></span>개인정보 위탁안내에 동의하셔야 상담신청이 가능합니다.</span>
				<p class="msg-info v1">고객님께서는 동의를 거부할 권리가 있으나, 미 동의 시 상담이 불가능합니다.</p>
			</div>
			
			<div class="terms-list">
				<div class="terms-header">
					<span class="checkbox v2">
						<input type="checkbox" id="select-terms3" name="agreeYn3">
						<label class="label" for="select-terms3">
							<h4>마케팅 활용동의(선택)</h4>
						</label>
					</span>
				</div>
				
				<div class="terms-content scroll-no">
					<table class="tb-cnt tb-my cnt-center">
						<caption>마케팅 활용동의에 대한 안내 표</caption>
						<colgroup>
							<col width="33%">
							<col width="33%">
							<col width="*">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">활용항목</th>
								<th scope="col">이용목적</th>
								<th scope="col">보유 및 이용기간</th>
							</tr>
						</thead>
						
						<tbody>
<style>
.tb-cnt.cnt-center tbody tr.fontW td, .tb-cnt.cnt-center tbody tr.fontW td ul li{font-size:15px; font-weight:700; letter-spacing:-0.7px;}
</style>
							<tr class="fontW">
								<td>휴대폰번호, 이메일</td>
								<td><ul class="text-l">
								<li>- 프로모션 안내</li>
								<li>- 신제품 및 신규서비스 안내</li>
								<li>- 광고성 정보 전송</li>
								</ul></td>
								<td>최종 상담 진행일로부터 1년 또는 동의 철회시까지</td>
							</tr>
						</tbody>
					</table>
				</div>
				<p class="msg-info v1">고객님께서는 동의를 거부할 권리가 있으나, 미 동의 시 상품/서비스 안내에 제한을 받을 수 있습니다.</p>
			</div>
		</div>
	</article>
	<div class="counsel-btn-box btn-box text-c">
		<button type="button" class="btn btn-color1 btn-large btn-fix3" id="insertBtn" onclick="checkInsert();">신청완료</button>
	</div>
	</form>
</div>


</div>
</body>
<script>
//한글, 영어만 가능
$("input:text[textname]").on("keyup", function() {
    $(this).val($(this).val().replace(/[^a-zA-Zㄱ-힣]/gi,""));
	
	var hechar = /[^a-zA-Zㄱ-힣]/gi;
	
	if(!document.getElementById("name").value) {
    	document.getElementById("nameput").innerHTML = "이름을 입력하세요";
	}else{
		document.getElementById("nameput").innerHTML = "";
	}
    
});
//숫자만 가능
$("input:text[numberOnly]").on("keyup", function() {
    $(this).val($(this).val().replace(/[^0-9]/g,""));

    var nchar = /[^0-9]/g;
    var number = document.getElementById("tel").value;
	if(!document.getElementById("tel").value) {
    	document.getElementById("telput").innerHTML = "전화번호를 입력해주세요";
	}else if(number.length < 11) {
		document.getElementById("telput").innerHTML = "11자리를 입력해주세요";
	}else {
		document.getElementById("telput").innerHTML = "";
	}
});
$(function() {
	/* 체크여부 확인
	$('[name=agreeYn1]').click(function() {
		alert("클릭함");
		if($("[name=agreeYn1]").is(":checked")) {
		  alert("체크박스 체크됨");
		}else {
			alert("체크박스 해제");
		}
	});
	*/
});

//주소
function checkAdd() {
    if(!document.getElementById("zipcode").value) {
    	document.getElementById("addput").innerHTML = "우편번호/주소/상세주소를 입력하세요";
    	document.getElementById('add').focus();
    	return;
    }else if(!document.getElementById("address2").value) {
    	document.getElementById("addput").innerHTML = "상세주소를 입력하세요";
    	document.getElementById('address2').focus();
    	return;
    }else {
		document.getElementById("addput").innerHTML = "";
	}
}

//등록
function checkInsert() {
    //이름
    if(!document.getElementById("name").value) {
    	alert("이름을 입력하세요");
    	document.getElementById('name').focus();
    	return;
    }
    //주소
    if(!document.getElementById("zipcode").value) {
    	alert("주소 입력하세요");
    	document.getElementById('add').focus();
    	return;
    }else if(!document.getElementById("address1").value) {
    	alert("주소 입력하세요");
    	document.getElementById('add').focus();
    	return;
    }else if(!document.getElementById("address2").value) {
    	alert("주소 입력하세요");
    	document.getElementById('address2').focus();
    	return;
    }
    //전화번호
    if(!document.getElementById("tel").value) {
    	alert("전화번호 입력하세요");
    	document.getElementById('tel').focus();
    	return;
    }else if(document.getElementById("tel").value.length != 11) {
    	alert("전화번호 11자리 입력해주세요.");
    	document.getElementById('tel').focus();
    }

    
	//체크박스 상태
	if(!$("[name=agreeYn1]").is(":checked")) {
		  alert("동의를 거부할 권리가 있으나, 미 동의 시 상담이 불가능합니다.");
		  document.getElementById('select-terms1').focus();
		  return;
	}else if(!$("[name=agreeYn2]").is(":checked")) {
		  alert("동의를 거부할 권리가 있으나, 미 동의 시 상담이 불가능합니다.");
		  document.getElementById('select-terms2').focus();
		  return;
	}
    
    document.insertForm.submit();
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
			document.getElementById('address1').value = fullAddr;

			//커서를 상세주소 입력 필드로 이동한다.
			document.getElementById('address2').focus();
		}
	}).open();
}
</script>
</html>
</layoutTag:layout>