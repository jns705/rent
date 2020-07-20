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
		<form class="form-horizontal" name="insertForm" action="${path}/member/insertProc" method="get">
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
					<label style="text-align: left; color:red;" id="password" class="control-label col-sm-4"></label>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">비밀번호 확인</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" name="rePassword" size="10" placeholder="비밀번호를 입력하세요" oninput="repwCheck();"/>
					</div>
					<label style="text-align: left; color:red;" id="rePassword" class="control-label col-sm-4"></label>
				</div>
				
				<div class="form-group">
					<label class="control-label col-sm-2">이름</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" name="name" size="10" placeholder="이름을 입력하세요" oninput="nameCheck();"/>
					</div>
					<label style="text-align: left; color:red;" id="name" class="control-label col-sm-4"></label>
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
							<input type="text" class="form-control" name="tel2" size="10" placeholder="전화번호" oninput="telCheck();"/>
						</div>
						<div class="col-sm-2">
							<input type="text" class="form-control" name="tel3" size="10" placeholder="전화번호" oninput="telCheck();"/>
						</div>
					<label style="text-align: left; color:red;" id="tel" class="control-label col-sm-4"></label>
				</div>
				
				
					
		<div class="form-group">
			<label class="control-label col-sm-2">우편번호</label>
			<div class="col-sm-2">
				<input type="text" class="form-control" id="zipcode" name="zipcode" maxlength="100" 
				placeholder="zipcode"  readonly>
			</div>
			<div class="col-sm-2">
				<input type="button" onclick="daumZipCode()" value="우편번호 찾기" name="addressbtn">
			</div>
		</div>
		
	<div class="form-group">
		<label class="control-label col-sm-2">주소</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="address" name="address" maxlength="100"  readonly
				placeholder="Address">
			</div>
		</div>
		
		
	<div class="form-group">
		<label class="control-label col-sm-2">상세주소</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="addressDetail" name="addressDetail" maxlength="100" 
				placeholder="Enter Address"  oninput="addressCheck();">
			</div>
			<label style="text-align: left; color:red;" id="addressM" class="control-label col-sm-4"></label>
		</div>
		
		
				<div class="form-group">
					<label class="control-label col-sm-2">생년월일</label>
						<div class="col-sm-4">
							<input type="date" class="form-control" name="date_of_birth" oninput="birthCheck();">
						</div>
					<label style="text-align: left; color:red;" id="date_of_birth" class="control-label col-sm-4"></label>
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
							<input class="col-sm-1" type="checkbox" id="checkb">
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function daumZipCode(){
	new daum.Postcode({	
		oncomplete : function(data){
		//팝업에서 검색한 결과 항목을 클릭하였을 경우 실행할 코드를 작성하는 부분이다.

		//각주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var fullAddr = '';		//최종 주소
        var	extraAddr = '';		//조합형 주소 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if(data.userSelectedType == 'R'){	//도로명 주소를 선택할 경우
			fullAddr = data.roadAddress;
        } else {							//지번 주소를 선택한 경우
			fullAddr = data.jibunAddress;
        }

		//사용자가 선택한 주소가 도로명 타입일 때 조합한다.
		if(data.userSelectedType == 'R'){
			//법정동명이 있을 경우 추가한다.
			if(data.bname != ''){
				extraAddr += data.bname;
			}
			//건물명이 있을 경우 추가한다.
			if(data.buildingName != ''){
				extraAddr += (extraAddr != '' ? ', ' + data.buildingName : data.buildingName);
			}
			//조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
			fullAddr += (extraAddr != '' ? ' (' + extraAddr + ')' : '' );
		}

		//우편번호와 주소정보를 해당 필드에 넣는다.
		document.getElementById('zipcode').value 	= data.zonecode;	//5자리 새 우편 번호
		document.getElementById('address').value 	= fullAddr;		//주소

		//커서를 상세주소 입력 필드로 이동한다.
		document.getElementById('addressDetail').focus();

		}
  	}).open();
	
	
}
</script>
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

//메세지 출력
function printMsg(data, focus, content, bool){
	$('#'+data).html(content);
	$('[name='+ focus +']').focus();
	if(bool == true)    {$('#'+data).css("color","green");}
	else 				{$('#'+data).css("color","red");}
}

//체크메서드
function checkTotal(data, name, startNum, endNum){
	//아이디 체크
	if(data == 'idCheck'){
		if(!$('[name=id]').val()){
			printMsg('id','id','이름을 입력해주세요');
			return false;
		}
		else if(!isNameCheck($('[name=id]').val())){
			printMsg('id','id','특수문자는 사용할 수 없습니다.');
			return false;
		}
		else if($('[name=id]').val().length < 4 || $('[name=id]').val().length > 8 ){
			printMsg('id','id','아이디는 4~7글자 사이로 입력가능합니다.');
			return false;
		}
		else
		$.ajax({
			url 	: '/member/idCheck',
			type	: 'get',
			data	: {'id': $('[name=id]').val()},
			success : function(data){
				if(data == 1){
					printMsg('id','id','중복된아이디가 있습니다.');
					return false;
				}
				else{
					printMsg('id','id','확인되었습니다.',true);
					return true;
				}
			}
		});
	//비밀번호 확인 일 시
	}else if(data == 'rePassword'){
		if(!$('[name=password]').val())
			printMsg('rePassword','password','비밀번호를 확인해주세요');
		else if($('[name=password]').val() != $('[name=rePassword]').val())
			printMsg('rePassword','rePassword', '비밀번호가 일치하지 않습니다.');
		else printMsg('rePassword','rePassword',' ');
		return true;
	//전화번호 입력 시
	}else if(data == 'tel'){
		if(!$('[name=tel2]').val())
			printMsg(data,'tel2','두번째 전화번호를 확인해주세요');
		else if($('[name=tel2]').val().length != 4)
			printMsg(data,'tel2', '전화번호는 4글자를 입력해주세요.');
		else if(!$('[name=tel3]').val())
			printMsg(data,'tel3','세번째 전화번호를 확인해주세요');
		else if($('[name=tel3]').val().length != 4)
			printMsg(data,'tel3', '전화번호는 4글자를 입력해주세요');
		else printMsg(data,' ',' ');
		return true;
	//주소 입력 시
	}else if(data == 'address'){
		if(!$('[name=zipcode]').val() || !$('[name=address]').val())
			printMsg('addressM','addressDetail','우편찾기를 해주세요');
		else if(!$('[name=addressDetail]').val())
			printMsg('addressM','addressDetail','상세주소를 확인 해주세요');
		else if($('[name=addressDetail]').val().length < startNum || $('[name=addressDetail]').val().length > endNum )
			printMsg('addressM','addressDetail','상세주소는 '+ startNum + '~' + endNum +'글자 사이로 입력가능합니다.');
		else $('#addressM').html(' ');
		return true;
	
	}if(!$('[name='+data+']').val())
		printMsg(data,data,name+'을(를) 입력해주세요');
	else if(!isNameCheck($('[name='+data+']').val()))
		printMsg(data,data,'특수문자는 사용할 수 없습니다.');
	else if($('[name='+data+']').val().length < startNum || $('[name='+data+']').val().length > endNum )
		printMsg(data,data,name+'는(은) '+ startNum + '~' + endNum +'글자 사이로 입력가능합니다.');
	else printMsg(data,data,' ', true);
	
}


	function idCheck(){checkTotal('idCheck');}

	function pwCheck(){checkTotal('password', '비밀번호', 4, 8); return true;}
	
	function repwCheck(){checkTotal('rePassword'); return true;}
	
	function nameCheck(){checkTotal('name','이름',2,7); return true;}
	
	function telCheck(){checkTotal('tel',''); return true;}

	function addressCheck(){checkTotal('address','',5,10); return true;}
	
	function birthCheck(){
			if(!$('[name=date_of_birth]').val()){
				printMsg('date_of_birth','date_of_birth','생년월일을 입력해주세요'); 
				return true;
			}
		}

	function inserForm(){
		
		if($('#id').html() != '확인되었습니다.'){
			idCheck(); return false; 
		}if($('#password').html() != ' '){
			pwCheck(); return false;
		}if($('#rePassword').html() != ' '){
			repwCheck();return false;
		}if($('#name').html() != ' '){
			nameCheck();return false;
		}if($('#tel').html() != ' '){
			telCheck();  return false;
		}if($('#addressM').html() != ' '){
			addressCheck();return false;
		}if($('#date_of_birth').html() != ' '){
			birthCheck(); return false;
		}if(!$("input:checkbox[id='checkb']").is(":checked")){
			alert("개인정보 수집에 동의하셔야 가입이 가능합니다.");
			return false;
		}
			
			insertForm.submit();
	}
</script>
</html>
</layoutTag:layout>