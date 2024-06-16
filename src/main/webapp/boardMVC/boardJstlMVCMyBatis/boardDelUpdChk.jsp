<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
request.setCharacterEncoding("utf-8");
String contextPath = request.getContextPath();
String prjPath = contextPath + "/boardMVC";
HashMap<String, String> delUpd = (HashMap<String, String>)request.getAttribute("delUpd");
%>
<head>
    <meta charset='utf-8'>
    <title>BoardDelUpdChk</title>
    <link rel = "stylesheet" href = "<%=prjPath%>/css/boardDel.css">
    <script src = "<%=prjPath%>/js/board.js"></script>
	<%
	
	String category = delUpd.get("category");
	String pwd = delUpd.get("bod_pwd");
	String no = delUpd.get("bod_no");
	%>
</head>
<body onload = "chkInit()">
    <div id = "wrapper">
        <div id = "title">**글을 남기실때 입력하신 비밀번호를 입력하세요**</div>
        <form method = "get" action = "<%=contextPath%>/MVCJSTLBoard.do">
        	<input type = "hidden" name = "bodCtg" id = "bodCtg">
        	<input type = "hidden" name = "bod_no" id = "bod_no">
	        <input type = "password" name = "bod_pwd" id = "pwd">
	        <div id = "btns">
	            <p id = "btn">
	                <button class = "btn" onclick = "valSend2('<%= no %>', '<%= pwd %>', '<%= category %>')">확 인</button>
	                <a href = "<%=contextPath%>/MVCJSTLBoard.do?bodCtg=pageWrite">게시판쓰기</a>
	            </p>
	        </div>
        </form>
    </div>
</body>
</html>