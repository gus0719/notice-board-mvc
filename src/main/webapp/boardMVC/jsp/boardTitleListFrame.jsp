<%@ page import="boardV01.BoardV01DTO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
String contextPath = request.getContextPath();
String prjPath = contextPath + "/boardMVC";
List<BoardV01DTO> dtoL = (List<BoardV01DTO>) request.getAttribute("dtoL");
%>
<head>
<meta charset='utf-8'>
<title>BoardTitleListFrame</title>
<link rel="stylesheet" href="<%=prjPath%>/css/boardTitleList.css">
<script src="<%=prjPath%>/js/board.js"></script>
</head>
<body onload="mInit()">
<%! // MV 선언
int bod_no;
String bod_subject;
String bod_writer;
String bod_logtime;
int bod_readCnt;
String bod_connIp;
%>
	<div id="wrapper">
		<h1>** Board Title List **</h1>
		<p id="navi">
			<a href="<%=contextPath%>/ControllerBoard.do?bodCtg=pageWrite">[게시판
				쓰기]</a> <a href="<%=contextPath%>/ControllerBoard.do?bodCtg=pageList">[게시판
				내용 List]</a>
		</p>
		<form method="post" action="<%=contextPath%>/ControllerBoard.do">
			<input type="hidden" name="bodCtg" value="bodSelect"> <input
				type="hidden" name="bod_no" id="bod_no">
			<div id="columns">
				<span class="column_short">번호</span> <span class="titles">제목</span>
				<span class="column_short">글쓴이</span> <span class="column_short">등록일</span>
				<span class="column_short">조회</span> <span class="ips">IP</span>
				<ul id="lists">
					<%
					for (int i = 0; i < dtoL.size(); i++) {
						bod_no = dtoL.get(i).getBod_no();
						bod_subject = dtoL.get(i).getBod_subject();
						bod_writer = dtoL.get(i).getBod_writer();
						bod_logtime = dtoL.get(i).getBod_logtime();
						bod_readCnt = dtoL.get(i).getBod_readCnt();
						bod_connIp = dtoL.get(i).getBod_connIp();
					%>
					<li onclick="valSend(<%=bod_no%>)"><span class="column_short"><%=bod_no%></span>
						<span class="titles"><%=bod_subject%></span> <span
						class="column_short"><%=bod_writer%></span> <span id="logtime"
						class="column_short"><%=bod_logtime%></span> <span
						class="column_short"><%=bod_readCnt%></span> <span class="ips"><%=bod_connIp%></span>
					</li>
					<%
					}
					%>
				</ul>
			</div>
		</form>
	</div>
</body>
</html>