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
                         &nbsp;<span class="text-muted">${detail.qna_date }</span>
                         &nbsp;<span class="text-muted">100회 읽음</span>
                            <span class="glyphicon glyphicon-comment" style="padding:10px">댓글수</span>
                         <a href="${path}/qna/update"
                            class="glyphicon glyphicon-cog pull-right" style="padding:10px">수정</a>
                         <a href="${path}/qna/delete/${qna.qna_id}"
                            class="glyphicon glyphicon-trash pull-right" style="padding:10px">삭제</a>
                    </div>
                    <br>
                    <p style="padding:20px">
                        ${detail.content}
                    </p>
                    
                   <!-- 저장된 댓글을 보여주는 영역 -->
                    <table class="table" style="font-size: 13px; padding :20px">
                        <tr>
                            <td>
                                <strong>댓글작성자</strong>
                            </td>
                            <td class="text-right">
                                댓글작성시간
                                <a class="glyphicon glyphicon-trash" href="#"></a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <p class="txt">댓글</p>
                            </td>
                        </tr>
                    </table>
                </div>
                
                <!-- 댓글을 입력하는 영역 -->
                <div class="panel-footer">
                    <div class="write_area">
                        <form>
                            <div>
                                <textarea class="input_write_comment" name="comment" placeholder="댓글 내용"></textarea>
                                <input type="submit" class="comment_submit" value="전송">
                            </div>
                        </form>
                    </div>
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
</html>
</layoutTag:layout>