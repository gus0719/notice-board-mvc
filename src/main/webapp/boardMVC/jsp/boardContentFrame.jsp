<%@page import="java.net.URLEncoder"%>
<%@ page import = "boardV01.BoardV01DTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String contextPath = request.getContextPath();
String prjPath = contextPath + "/boardMVC";
BoardV01DTO dto = (BoardV01DTO)request.getAttribute("content");
%>
<html>
<head>
<meta charset="UTF-8">
<title>BoardContentFrame</title>
<link rel = "stylesheet" href = "<%=prjPath%>/css/guestWrite.css">
<script src = "<%=prjPath%>/js/board.js"></script>
<%--
request.setCharacterEncoding("UTF-8");
String bod_no = request.getParameter("bod_no");
BoardV01DTO dto = new BoardV01DTO();
if(bod_no == null) {
	String msg = "정상적인 실행 경로가 아닙니다.";
	response.sendRedirect("./boardMsgChk.jsp?msg="+URLEncoder.encode(msg, "utf-8"));
} else dto = bodDAO.bodSelect(Integer.parseInt(bod_no));
--%>
</head>
<body onload = "mInit()">

	<div id="wrapper">
		<form method = "post" action = "<%=contextPath%>/ControllerBoard.do">
		<input type = "hidden" name = "bodCtg" value = "pageDelUpd">
			<h1>** 게시판 콘텐츠 **</h1>
			<div id = "links">
				<%-- a를 클릭하면 카테고리값을 넘겨주고 action으로 이동 --%>
				<input type = "hidden" name = "category" id = "category" readonly>
				<span onclick = "category.value = 'upd', document.forms[0].submit()">[ 수정 ]</span>
				<span onclick = "category.value = 'del', document.forms[0].submit()">[ 삭제 ]</span>
				<a href = "<%=contextPath%>/ControllerBoard.do?bodCtg=pageTitleList">[ 글목록 ]</a>
				<a href = "<%=contextPath%>/ControllerBoard.do?bodCtg=pageWrite">[ 게시판 쓰기 ]</a>
			</div>
			<input type = "hidden" name = "bod_pwd" value = "<%= dto.getBod_pwd()%>">
			<div id="domain">
				<div class = "shortDiv">
					<div class = "titles">글번호</div>
					<input class = "shortText" type = "text" name = "bod_no" value = "<%= dto.getBod_no()%>" readonly>
				</div>
				<div class = "shortDiv">
					<div class = "titles">조회수</div>
					<input class = "shortText" type = "text" value = "<%= dto.getBod_readCnt()%>" readonly>
				</div>
				<div class = "shortDiv">
					<div class = "titles">Writer</div>
					<input class = "shortText" type = "text" value = "<%= dto.getBod_writer()%>" readonly>
				</div>
				<div class = "shortDiv">
					<div class = "titles">Date</div>
					<input class = "shortText" type = "text" value = "<%= dto.getBod_logtime()%>" readonly>
				</div>
				<div class = "longDiv">
					<div class = "titles">Title</div>
					<input id = "longText" type = "text" value = "<%= dto.getBod_subject()%>" readonly>
				</div>
				<div class = "longDiv">
					<div class = "titles">Email</div>
					<input id = "longText" type = "text" value = "<%= dto.getBod_email()%>" readonly>
				</div>
				<div id = "multiText">
					<div class = "titles">Contents</div>
					<textarea rows=10 cols=40 readonly><%= dto.getBod_content()%></textarea>
				</div>
			</div>
		</form>
	</div>
</body>
</html>