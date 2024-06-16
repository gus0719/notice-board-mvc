<%@ page import="java.util.List"%>
<%@ page import="boardV01.BoardV01DTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String contextPath = request.getContextPath();
String prjPath = contextPath + "/boardMVC";
List<BoardV01DTO> dtoL = (List<BoardV01DTO>)request.getAttribute("dtoL");
%>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList</title>
<link rel = "stylesheet" href = "<%=prjPath%>/css/guestWrite.css">
<link rel = "stylesheet" href = "<%=prjPath%>/css/pagination.css">
<script src = "<%=prjPath%>/js/board.js"></script>
<%--
request.setCharacterEncoding("utf-8");
List<BoardV01DTO> dtoL = bodDAO.bodSelect();

String contextPath = request.getContextPath();
String prjPath = contextPath + "/boardMVC/jsp";
--%>
</head>
<body onload = "mInit()">
<%!
int bod_no;
String bod_pwd;
String bod_writer;
String bod_subject;
String bod_logtime;
String bod_content;
%>
	<div id="wrapper">
		<form method = "post" action = "<%=contextPath%>/ControllerBoard.do">
			<h1>** 게시판 콘텐츠 **</h1>
			<input type = "hidden" name = "bodCtg" value = "pageDelUpd">
			<input type = "hidden" id = "bod_no" name = "bod_no" value = "">
			<input type = "hidden" id = "bod_pwd" name = "bod_pwd" value = "">
			<input type = "hidden" name = "category" id = "category" readonly>
			<%
			if(dtoL != null){
				int totalRecord = dtoL.size();
				int recPerPage = 2;
				int pagePerBlock = 10;

				int totalPage = (int)Math.ceil((double)totalRecord / recPerPage);
				int totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);

				int nowPage = 0;
				int nowBlock = 0;

				if(request.getParameter("nowPage") != null)
					nowPage = Integer.parseInt(request.getParameter("nowPage"));
				if(request.getParameter("nowBlock") != null)
					nowBlock = Integer.parseInt(request.getParameter("nowBlock"));

				int recOfBeginPage = nowPage * recPerPage;
				int pageOfBeginBlock = nowBlock * pagePerBlock;
				
				for(int idx = recOfBeginPage; idx < recOfBeginPage + recPerPage; idx++){
					if(idx >= totalRecord) break;
					BoardV01DTO dto = dtoL.get(idx);
					bod_no = dto.getBod_no();
					bod_pwd = dto.getBod_pwd();
					bod_writer = dto.getBod_writer();
					bod_logtime = dto.getBod_logtime();
					bod_subject = dto.getBod_subject();
					bod_content = dto.getBod_content();
			%>
			<div id = "links">
				<%-- a를 클릭하면 카테고리값을 넘겨주고 action으로 이동 --%>
				<span onclick = "category.value = 'upd', bod_no.value = '<%=bod_no%>', bod_pwd.value = '<%=bod_pwd%>', document.forms[0].submit()">[ 수정 ]</span>
				<span onclick = "category.value = 'del', bod_no.value = '<%=bod_no%>', bod_pwd.value = '<%=bod_pwd%>', document.forms[0].submit()">[ 삭제 ]</span>
				<a href = "<%=contextPath %>/ControllerBoard.do?bodCtg=pageTitleList">[ 글목록 ]</a>
				<a href = "<%=contextPath %>/ControllerBoard.do?bodCtg=pageWrite">[ 게시판 쓰기 ]</a>
			</div>
			<div id="domain">
				<div class = "shortDiv">
					<div class = "titles">Writer</div>
					<input class = "shortText" type = "text" value = "<%=bod_writer%>" readonly>
				</div>
				<div class = "shortDiv">
					<div class = "titles">Date</div>
					<input class = "shortText" type = "text" value = "<%=bod_logtime%>" readonly>
				</div>
				<div class = "longDiv">
					<div class = "titles">Title</div>
					<input id = "longText" type = "text" value = "<%=bod_subject%>" readonly>
				</div>
				<div id = "multiText">
					<div class = "titles">Contents</div>
					<textarea rows=10 cols=40 readonly><%=bod_content%></textarea>
				</div>
			</div>
				<%
				}
				%>
			<div id = "bottomIdx">
				<%
				if(nowBlock != 0){
				%>
				<a class = "select" href = "<%=contextPath %>/ControllerBoard.do?bodCtg=pageList&nowPage=<%=(nowBlock-1)*pagePerBlock%>&nowBlock=<%=(nowBlock-1)%>">&laquo</a>
				<%							// 뒤로가기 : nowPage = (현재블럭-1)*블럭당 페이지   /  nowBlock = 현재블럭 - 1
				}							// if idx2블럭에서 1블럭으로 가기 -> 페이지 : (2-1)*10 = 10 / nowBlock = 2-1 = 1
				for(int idx1 = pageOfBeginBlock; idx1 < pageOfBeginBlock + pagePerBlock; idx1++){
				%>
				<a class = "select" href = "<%=contextPath %>/ControllerBoard.do?bodCtg=pageList&nowPage=<%=idx1%>&nowBlock=<%=nowBlock%>"><%=idx1 + 1%></a>
				<%																// 인덱스 선택은 현재 블럭에서만 가능
				if(idx1 + 1 == totalPage) break;
				}
				if(nowBlock+1 < totalBlock){
				%>
				<a class = "select" href = "<%=contextPath %>/ControllerBoard.do?bodCtg=pageList&nowPage=<%=(nowBlock+1)*pagePerBlock%>&nowBlock=<%=nowBlock+1%>">&raquo</a>
				<%				// 앞으로 가기 : nowPage = (현재블럭+1) * 블럭당 페이지		/ nowBlock = 현재블럭 + 1
				}				// if idx2블럭에서 3블럭으로 가기 -> 페이지 : (2+1) * 10 = 30	/ 블럭 : 2 + 1 = 3
				%>
			<%
			}
			%>
			</div>
		</form>
	</div>
</body>
</html>