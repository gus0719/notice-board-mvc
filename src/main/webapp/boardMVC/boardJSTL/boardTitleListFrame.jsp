<%@ page import="boardV01.BoardV01DTO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
<!DOCTYPE html>
<html>
<%
String contextPath = request.getContextPath();
String prjPath = contextPath + "/boardMVC";
%>
<head>
<meta charset='utf-8'>
<title>BoardTitleListFrame</title>
<link rel="stylesheet" href="<%=prjPath%>/css/boardTitleList.css">
<script src="<%=prjPath%>/js/board.js"></script>
</head>
<body onload="mInit()">
<%-- // MV 선언
int bod_no;
String bod_subject;
String bod_writer;
String bod_logtime;
int bod_readCnt;
String bod_connIp;
--%>
	<div id="wrapper">
		<h1>** Board Title List **</h1>
		<p id="navi">
			<a href="<%=contextPath%>/MVCJSTLBoard.do?bodCtg=pageWrite">[게시판
				쓰기]</a> <a href="<%=contextPath%>/MVCJSTLBoard.do?bodCtg=pageList">[게시판
				내용 List]</a>
		</p>
		<form method="post" action="<%=contextPath%>/MVCJSTLBoard.do">
			<input type="hidden" name="bodCtg" value="bodSelect"> <input
				type="hidden" name="bod_no" id="bod_no">
			<div id="columns">
				<span class="column_short">번호</span> <span class="titles">제목</span>
				<span class="column_short">글쓴이</span> <span class="column_short">등록일</span>
				<span class="column_short">조회</span> <span class="ips">IP</span>
				<ul id="lists">
					<c:set var="list" value="${requestScope.dtoL}"/>
					<c:forEach var="subject" items="${list}">
						<li onclick="valSend(${subject.bod_no})"><span class="column_short">${subject.bod_no}</span>
							<span class="titles">${subject.bod_subject}</span>
							<span class="column_short">${subject.bod_writer}</span>
							<span id="logtime" class="column_short">${subject.bod_logtime}</span>
							<span class="column_short">${subject.bod_readCnt}</span>
							<span class="ips">${subject.bod_connIp}</span>
						</li>						
					</c:forEach>
				</ul>
			</div>
		</form>
	</div>
</body>
</html>