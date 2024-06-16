<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "./../css/boardMsgChk.css">
<%
request.setCharacterEncoding("utf-8");
String msg = request.getParameter("msg");
if(msg == null)
	msg = "메시지 없음";
%>
</head>
<body>
<%
String contextPath = request.getContextPath();
String prjPath = contextPath + "/boardMVC/jsp";
%>
	<div id = "wrapper">
		<nav>
			<a href = "<%=contextPath%>/ControllerBoard.do?bodCtg=pageWrite">[게시판 쓰기]</a>
            <a href = "<%=contextPath%>/ControllerBoard.do?bodCtg=pageList">[게시판 내용 List]</a>
			<a href = "<%=contextPath %>/ControllerBoard.do?bodCtg=pageTitleList">[ 게시판 목록 List ]</a>
		</nav>
		<div id = "msgBox">
			<div id = "title">Message Chk</div>
			<div id = "msgField"><%= msg %></div>
		</div>
	</div>
</body>
</html>