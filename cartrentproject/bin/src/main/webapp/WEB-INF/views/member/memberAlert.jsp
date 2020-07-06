<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<script type="text/javascript">
var msg = '${msg}';
if(msg!="") alert(msg);
location.href='${path}/member/loginForm';
</script>