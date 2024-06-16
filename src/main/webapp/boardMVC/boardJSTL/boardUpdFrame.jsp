<%@page import="java.net.URLEncoder"%>
<%@ page import = "boardV01.BoardV01DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String contextPath = request.getContextPath();
String prjPath = contextPath + "/boardMVC";
%>
<html>
<head>
<meta charset="UTF-8">
<title>BoardUpdFrame</title>
<link rel = "stylesheet" href = "<%=prjPath%>/css/guestWrite.css">
<%
BoardV01DTO dto = (BoardV01DTO)request.getAttribute("updDTO");
int bod_no = dto.getBod_no();
%>
</head>
<body>
	<div id="wrapper">
		<form method = "post" action = "<%=contextPath%>/MVCJSTLBoard.do">
			<input type = "hidden" name = "bodCtg" value = "bodUpdate">
			<input type = "hidden" name = "bod_no" value = "<%= bod_no %>">
			<h1>** 게시판 수정 **</h1>
			<div id = "links">
				<a href = "<%=contextPath%>/MVCJSTLBoard.do?bodCtg=pageList">[ 게시판 내용 List ]</a>
				<a href = "<%=contextPath%>/MVCJSTLBoard.do?bodCtg=pageTitleList">[ 게시판 목록 List ]</a>
			</div>
			<div id = "domain">
				<div class = "shortDiv">
					<div class = "titles">Writer</div>
					<input class = "shortText" type = "text" name = "bod_writer" value = "<%= dto.getBod_writer()%>" readonly>
				</div>
				<div class = "shortDiv">
					<div class = "titles">Password</div>
					<input class = "shortText" type = "text" name = "bod_pwd" value = "<%= dto.getBod_pwd() %>">
				</div>
				<div class = "longDiv">
					<div class = "titles">Title</div>
					<input id = "longText" type = "text" name = "bod_subject" value = "<%= dto.getBod_subject() %>">
				</div>
				<div class = "longDiv">
					<div class = "titles">Email</div>
					<input id = "longText" type = "text" name = "bod_email" value = "<%= dto.getBod_email() %>">
				</div>
				<div id = "multiText">
					<div class = "titles">Contents</div>
					<textarea rows=10 cols=40 name = "bod_content"><%= dto.getBod_content() %></textarea>
				</div>
			</div>
			<footer>
				<div class="buttons">
					<button type="submit">Update</button>
					<button type="reset">Reset</button>
				</div>
			</footer>
		</form>
	</div>
</body>
</html>