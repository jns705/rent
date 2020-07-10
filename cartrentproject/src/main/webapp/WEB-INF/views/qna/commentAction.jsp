<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
var qna_id = '${detail.qna_id}'; //qna 게시글 번호
//댓글 등록버튼을 눌렀을 경우 실행한다.
$('[name=commentInsertBtn]').click(function() {
	var insertData = $('[name=commentInsertForm]').serialize();	//commentInsertForm의 내용을 가져온다.
	commentInsert(insertData);	
});
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '/comment/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}

//댓글 목록 보기
function commentList() {
	$.ajax({
		url : '/comment/list/' + qna_id,
		type : 'get',
		data : {'qna_id': qna_id} ,
		success : function(data) {
			var str = '';
			//배열관리 메서드
			$.each(data, function(key, value){
				str += '<tr>';
				str += '<td>';
				str += '<strong>'+value.writer+'</strong>';
				str += '</td>';
				str += '<td class="text-right">';
				str += value.comment_date;
				str += '<a class="glyphicon glyphicon-pencil" href="#"></a>/';
				str += '<a class="glyphicon glyphicon-trash" href="#"></a>';
				str += '</td>';
				str += '</tr>';
				str += '<tr>';
				str += '<td colspan="2">';
				str += '<p class="txt">'+value.content+'</p></td></tr>';
			});
			 $("#commentList").html(str);
		}, error : function(data){alert("오류");}
	});
}








//페이지 로딩시 게시글에 연결된 댓글이 있으면 무조건 댓글을 보여준다.
$(document).ready(function() {
	commentList();
});
</script>