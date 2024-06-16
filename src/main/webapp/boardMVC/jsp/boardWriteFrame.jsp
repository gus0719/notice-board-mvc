<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardWriteFrame</title>
<link rel = "stylesheet" href = "./../css/guestWrite.css">
<%
request.setCharacterEncoding("utf-8");
%>
</head>
<body>
<%
String contextPath = request.getContextPath();
String prjPath = contextPath + "/boardMVC/jsp";
%>
	<div id="wrapper">
		<form action = "<%=contextPath%>/ControllerBoard.do">
			<input type = "hidden" name = "bodCtg" value = "bodWrite">
			<h1>** 게시판 글쓰기 **</h1>
			<div id = "links">
				<a href = "<%=contextPath%>/ControllerBoard.do?bodCtg=pageList">[ 게시판 내용 List ]</a>
				<a href = "<%=contextPath%>/ControllerBoard.do?bodCtg=pageTitleList">[ 게시판 목록 List ]</a>
			</div>
			<div id="domain">
				<div class = "shortDiv">
					<div class = "titles">Writer</div>
					<input class = "shortText" type = "text" name = "bod_writer">
				</div>
				<div class = "shortDiv">
					<div class = "titles">Password</div>
					<input class = "shortText" type = "password" name = "bod_pwd">
				</div>
				<div class = "longDiv">
					<div class = "titles">Title</div>
					<input id = "longText" type = "text" name = "bod_subject">
				</div>
				<div class = "longDiv">
					<div class = "titles">Email</div>
					<input id = "longText" type = "text" name = "bod_email">
				</div>
				<div id = "multiText">
					<div class = "titles">Contents</div>
					<textarea rows=10 cols=40 name = "bod_content"></textarea>
				</div>
			</div>
			<footer>
				<div class="buttons">
					<button type="submit">Write</button>
					<button type="reset">Reset</button>
				</div>
			</footer>
		</form>
	</div>
</body>
</html>