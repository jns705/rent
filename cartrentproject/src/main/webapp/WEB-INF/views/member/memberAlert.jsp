<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<script type="text/javascript">
var msg = '${msg}';
if(msg!="") alert(msg);
if(${check==0}) location.href='${path}/member/loginForm';

if(${check==1}) location.href='${path}/member/loginForm?check='+${check};

</script>