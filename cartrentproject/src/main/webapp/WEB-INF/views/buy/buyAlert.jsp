<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var check = '${check}';
	alert("일치하는 회원정보가 없습니다. \n 다시한번 확인해주세요");
	if(check == 1) location.href="/buy/memberCheckForm?check=1";
	else location.href="/buy/memberCheckForm";
</script>