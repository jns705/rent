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
<title>QNA 상세 페이지</title>
<link href="http://localhost:8082/static/css/qna.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="container">
		<div class="col-sm-9 col-lg-9">
            <div>
                <h3>게시판명</h3>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    ${detail.subject}
                </div>
                <div class="panel-body">
                    <div class="post">
                        
                         <strong>${detail.writer}(${detail.qna_id})</strong>
                         &nbsp;<span class="text-muted"> <fmt:formatDate value="${detail.qna_date}" pattern="yyyy/MM/dd" /></span>
                        
                         &nbsp;<span class="text-muted">100회 읽음</span>
                            <span class="glyphicon glyphicon-comment" style="padding:10px"><label class="count"></label></span>
                            
                         <c:if test="${detail.qne_password != null && detail.qne_password !='' || sessionScope.id eq 'master'}">
                             <a href="${path}/qna/update"
                            class="glyphicon glyphicon-cog pull-right" style="padding:10px">수정</a>
                            
                         	<a href="${path}/qna/delete/${detail.qna_id}"
                            class="glyphicon glyphicon-trash pull-right" style="padding:10px">삭제</a>
                         </c:if>
                         
                    </div>
                    <br>
                    <p style="padding:20px">
                        ${detail.content}
                    </p>
                    
                   <!-- 저장된 댓글을 보여주는 영역 -->
	                <div class="commentList"></div>
                </div>
                
                <!-- 댓글을 입력하는 영역 -->
                <div class="panel-footer">
                	<form name="commentInsertForm">
                		<div class="comment-group">
		                	<div>
		                		<label>이름</label>
		                		<input type="text" id="writer" name="writer" placeholder="이름을 입력하세요">
		                	</div>
		                	<br>
		                    <div class="write_area">
			                    <div>
			                    	<input type="hidden" id="qna_id" name="qna_id" value="${detail.qna_id}">
			                        <textarea class="input_write_comment" id="content" name="content" placeholder="댓글을 입력하세요"></textarea>
			                        <button class="comment_submit" type="button" name="commentInsertBtn">등록</button>
			                    </div>
		                    </div>
	                    </div>
	            	</form>
                </div>
               
            </div>

            <div class="text-center">
                <a href="${path}/qna/list">
                    <button type="button" class="btn btn-default">목록</button>
                </a>
            </div>
            
        </div>
    </div>
</body>
<%@ include file="commentAction.jsp" %>
</html>
</layoutTag:layout>