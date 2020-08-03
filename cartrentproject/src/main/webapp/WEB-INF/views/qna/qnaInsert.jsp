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
<%@ include file="../service/serviceHeader.jsp" %>
<link href="http://localhost:8082/static/css/ss.css" rel="stylesheet" type="text/css" >
<meta charset="UTF-8">
<title>QNA 작성 페이지</title>
</head>
<body>
<div class="col-sm-9 col-lg-9">
            <div>
                <h3>QNA 등록</h3>
            </div>
            
            <div class="table-responsive">
                <div class="well">
                    <form class="bs-example form-horizontal" action="${path}/qna/insertProc" method="post">
                        <fieldset>
                       		<div class="form-group">
								<label class="col-lg-2 control-label">작성자</label>
								 <div class="col-lg-10">
									<input type="text" class="form-control" id="writer" name="writer" placeholder="이름을 입력하십시오.">
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
                                    <textarea class="form-control" rows="3" id="content" name="content" placeholder="내용을 입력하십시오."></textarea>
                                </div>
                            </div>
                            
                            <div class="form-group">
                            
							<div class="form-group pwd" id="pwd">
								<div id="pwevt">
								
								</div>
							</div>
							
                                <label class="col-lg-2 control-label">비밀글</label>

                                <div class="col-lg-10">

                                    <div class="checkbox">
                                        <input type="checkbox" id="select-terms3" class="check_yn">
                                        <label class="label" for="select-terms3"></label>
                                    </div>

                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-2">
                                    <button type="submit" class="btn btn-primary">확인</button>
                                    <button type="reset" class="btn btn-default">취소</button>
                                </div>
                            </div>
                        </fieldset>
                    </form>
                    <a href="${path}/qna/list" class="btn btn-danger">목록가기</a>
                </div>
            </div>
            
        </div>
</body>
<script>
var str ='';
	str += '<div id="pwevt">';
    str += '<label class="col-lg-2 control-label">비밀번호</label>';
    str += '<div class="col-lg-10">';
    str += '<input type="password" class="form-control" id="qne_password" name="qne_password" placeholder="비밀번호를 입력하세요">';
    str += '</div>';
    str += '</div>';

	$(document).ready(function(){
	    $(".check_yn").change(function(){
	        if($(".check_yn").is(":checked")){
	            $(".pwd").html(str);       
	        }else{
	            $('#pwevt').remove();
	        }
	    });
	});

</script>
</html>
</layoutTag:layout>