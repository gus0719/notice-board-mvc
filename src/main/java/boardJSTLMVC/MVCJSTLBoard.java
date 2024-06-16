package boardJSTLMVC;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import boardV01.BoardV01DAO;
import boardV01.BoardV01DTO;

/**
 * Servlet implementation class MVCJSTLBoard
 */
@WebServlet("/MVCJSTLBoard.do")
public class MVCJSTLBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	int bod_no; // 글 번호
	String bod_writer; // 작성자
	String bod_email; // 작성자 이메일주소
	String bod_subject; // 글 제목
	String bod_pwd; // 작성자 비밀번호
	// String bod_logtime; <- sysdate
	String bod_content; // 작성내용
	int bod_readCnt; // 조회수
	String bod_connIp; // 작성자 ip주소

	String msg;

	public MVCJSTLBoard() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		String contextPath = request.getContextPath();
		String prjPath = contextPath + "/boardMVC";
		PrintWriter out = response.getWriter();

		int su; // SQL 실행 결과
		// 카테고리값 널 필터링
		String bodCtg = request.getParameter("bodCtg");
		if (bodCtg == null) {
			prjPath += "/index.jsp";
		}

		// UPDATE, DELETE 값 할당
		String category = request.getParameter("category");

		// 파라미터 할당
		bod_no = (request.getParameter("bod_no") != null)
				? Integer.parseInt(request.getParameter("bod_no"))
				: 0;
		bod_writer = request.getParameter("bod_writer");
		bod_email = request.getParameter("bod_email");
		bod_subject = request.getParameter("bod_subject");
		bod_pwd = request.getParameter("bod_pwd");
		bod_content = request.getParameter("bod_content");
		bod_readCnt = (request.getParameter("bod_readCnt") != null)
				? Integer.parseInt(request.getParameter("bod_readCnt"))
				: 0;
		bod_connIp = request.getRemoteAddr();

		BoardV01DAO bodDAO = new BoardV01DAO();
		
		// 페이지
		String recPerPage = request.getParameter("recPerPage");
		String nowPage = request.getParameter("nowPage");
		String nowBlock = request.getParameter("nowBlock");

		String resource = "boardJstlMvcMybatis/mybatis-config.xml";
		Reader reader = Resources.getResourceAsReader(resource);
		
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(reader);
		SqlSession sqlSession = factory.openSession(); // SQL 세션 오픈
		
		if (bodCtg != null) {
			/* page ================\
			 * ======================\
			 */
			/*
			if (bodCtg.equals("pageTitleList")) { // boardTitleListFrame.jsp
				prjPath = "/boardMVC/boardJstlMVCMyBatis/boardTitleListFrame.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(prjPath);
				//List<BoardV01DTO> dtoL = bodDAO.bodSelect();
				List<BoardV01DTO> dtoL = sqlSession.selectList("bodSel");
				request.setAttribute("dtoL", dtoL);
				sqlSession.close();
				rd.forward(request, response);
			}*/
			if(bodCtg.equals("pageTitleList")) { // boardTitleListPaging.jsp
				prjPath = "/boardMVC/boardJstlMVCMyBatis/boardTitleListPaging.jsp";
				
				HashMap<String, Integer> paging = new HashMap<String, Integer>();
				paging.put("recPerPage", (recPerPage != null) ? Integer.parseInt(recPerPage) : 10);
				paging.put("nowPage", (nowPage != null) ? Integer.parseInt(nowPage) : 0);
				paging.put("nowBlock", (nowBlock != null) ? Integer.parseInt(nowBlock) : 0);
				RequestDispatcher rd = request.getRequestDispatcher(prjPath);
				//List<BoardV01DTO> dtoL = bodDAO.bodSelect();
				List<BoardV01DTO> dtoL = sqlSession.selectList("bodSel");
				request.setAttribute("dtoL", dtoL);
				request.setAttribute("paging", paging);
				sqlSession.close();
				rd.forward(request, response);
			}
			
			if (bodCtg.equals("pageList")) { // boardList.jsp
				prjPath = "/boardMVC/boardJstlMVCMyBatis/boardList.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(prjPath);
				//List<BoardV01DTO> dtoL = bodDAO.bodSelect();
				List<BoardV01DTO> dtoL = sqlSession.selectList("bodSel");
				request.setAttribute("dtoL", dtoL);
				sqlSession.close();
				rd.forward(request, response);
			}
			if (bodCtg.equals("pageWrite")) { // boardWriteFrame.jsp
				prjPath += "/boardJstlMVCMyBatis/boardWriteFrame.jsp";
				response.sendRedirect(prjPath);
			}
			if (bodCtg.equals("pageUpdate")) { // boardUpdFrame.jsp
				prjPath = "/boardMVC/boardJstlMVCMyBatis/boardUpdFrame.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(prjPath);
				BoardV01DTO updDTO = bodDAO.bodSelect(bod_no);
				request.setAttribute("updDTO", updDTO);
				rd.forward(request, response);
			}
			if (bodCtg.equals("pageDelUpd")) { // boardDelUpdChk.jsp
				prjPath = "/boardMVC/boardJstlMVCMyBatis/boardDelUpdChk.jsp";
				HashMap<String, String> delUpdChk = new HashMap<String, String>();
				delUpdChk.put("bod_no", Integer.toString(bod_no));
				delUpdChk.put("bod_pwd", bod_pwd);
				delUpdChk.put("category", category);
				RequestDispatcher rd = request.getRequestDispatcher(prjPath);
				request.setAttribute("delUpd", delUpdChk);
				rd.forward(request, response);
			}

			/* form ================\
			 * ======================\
			 */
			if (bodCtg.equals("bodSelect")) { // 글 선택
				prjPath = "/boardMVC/boardJstlMVCMyBatis/boardContentFrame.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(prjPath);
				//BoardV01DTO content = bodDAO.bodSelect(bod_no);
				BoardV01DTO dto = new BoardV01DTO();
				dto.setBod_no(bod_no);
				BoardV01DTO content = sqlSession.selectOne("selSubject", dto);
				request.setAttribute("content", content);
				rd.forward(request, response);
			}
			if (bodCtg.equals("bodWrite")) { // 작성 결과
				int number = bodDAO.bodMaxNo();
				BoardV01DTO writeDTO = new BoardV01DTO(bod_writer, bod_email, bod_subject, bod_pwd, bod_content,
						bod_connIp);
				writeDTO.setBod_no(number + 1);
				//su = bodDAO.bodWrite(writeDTO);
				su = sqlSession.insert("bodIns", writeDTO);
				sqlSession.commit();
				if (su != 0)
					prjPath += "/boardJstlMVCMyBatis/boardMsgChk.jsp?msg=" + URLEncoder.encode(bod_writer + "님 글 작성 완료", "UTF-8");
				else
					prjPath += "/boardJstlMVCMyBatis/boardMsgChk.jsp?msg=" + URLEncoder.encode("글 작성 실패", "UTF-8");
				sqlSession.close();
				response.sendRedirect(prjPath);
			}
			if (bodCtg.equals("bodUpdate")) { // 수정 결과
				BoardV01DTO updateDTO = new BoardV01DTO(bod_no, bod_writer, bod_email, bod_subject, bod_pwd,
						bod_content);
				//su = bodDAO.bodUpdate(updateDTO);
				su = sqlSession.update("bodUpd", updateDTO);
				sqlSession.commit();
				if (su != 0)
					prjPath = "boardMVC/boardJstlMVCMyBatis/boardMsgChk.jsp?msg=" + URLEncoder.encode(bod_no + "번 글 수정 성공", "UTF-8");
				else
					prjPath = "boardMVC/boardJstlMVCMyBatis/boardMsgChk.jsp?msg=" + URLEncoder.encode("글 수정 실패", "UTF-8");
				sqlSession.close();
				response.sendRedirect(prjPath);
			}
			if (bodCtg.equals("bodDelete")) { // 삭제 결과
				BoardV01DTO delDTO = new BoardV01DTO();
				delDTO.setBod_no(bod_no);
				delDTO.setBod_pwd(bod_pwd);
				//su = bodDAO.bodDelete(delDTO);
				su = sqlSession.delete("bodDel", delDTO);
				sqlSession.commit();
				if (su != 0)
					prjPath = "boardMVC/boardJstlMVCMyBatis/boardMsgChk.jsp?msg=" + URLEncoder.encode(bod_no + "번 글 삭제 성공", "UTF-8");
				else
					prjPath = "boardMVC/boardJstlMVCMyBatis/boardMsgChk.jsp?msg=" + URLEncoder.encode("글 삭제 실패", "UTF-8");
				sqlSession.close();
				response.sendRedirect(prjPath);
			}
		}
	}
}