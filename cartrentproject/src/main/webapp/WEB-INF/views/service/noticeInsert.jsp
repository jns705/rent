<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags" %>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성 페이지</title>
<%@ include file="serviceHeader.jsp" %>
<link href="http://localhost:8082/static/css/ss.css" rel="stylesheet" type="text/css" >
<style type="text/css">
select {
	width: 200px; /* 원하는 너비설정 */ 
	padding: .8em .5em; /* 여백으로 높이 설정 */ 
	font-family: inherit; /* 폰트 상속 */ 
	background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
	border: 1px solid #999; 
	border-radius: 0px; /* iOS 둥근모서리 제거 */ 
	-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
	-moz-appearance: none; 
	appearance: none; 
 }
 
</style>
</head>
<body>
<br><br><br><br>

<div class="container">
        <div class="breadcrumbs">
            <h2 class="tit">관리자 공지사항</h2>
            <div class="clearfix">
                <span>홈</span>
                <span>고객센터</span>
                <span class="cl-point2">공지사항 등록</span>
            </div>
        </div>
            
            <div class="table-responsive">
                <div class="well">
                    <form class="bs-example form-horizontal" action="${path}/serviceCenter/noticeInsert" method="get">
                       		<div class="form-group">
								<label class="col-lg-2 control-label">구분</label>
								 <div class="col-lg-10">
									<select name="division" id="division">
										<option value="공통">공통</option>
										<option value="장기렌터카">장기렌터카</option>
										<option value="단기렌터카">단기렌터카</option>
									</select>
								 </div>
							</div>
                        
                            <div class="form-group">
                                <label class="col-lg-2 control-label">제목</label>

                                <div class="col-lg-10">
                                    <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하십시오.">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label">내용</label>

                                <div class="col-lg-10">
                                    <textarea class="form-control" rows="10" id="content" name="content" placeholder="내용을 입력하십시오."></textarea>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-2">
                                    <button type="submit" class="btn btn-primary">확인</button>
                                    <button type="reset" class="btn btn-default">취소</button>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
            
        </div>
        
        <script type="text/javascript">
$("#division").change(function() {
	//alert(document.getElementById('division').value);
});

</script>
</body>
</html>
</layoutTag:layout>