package boardV01;

import common.DbClose;
import common.DbSet;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

public class BoardV01DAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int bod_no; // 글 번호
	String bod_writer; // 작성자
	String bod_email; // 작성자 이메일주소
	String bod_subject; // 글 제목
	String bod_pwd; // 작성자 비밀번호
	String bod_logtime; // 작성된 날짜
	String bod_content; // 작성내용
	int bod_readCnt; // 조회수
	String bod_connIp; // 작성자 ip주소
	
	// 글 번호 최대값
	public int bodMaxNo() {
		int result = 0;
		String sql = "select max(bod_no) as num from boardV01";
		try {
			conn = DbSet.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next())
				result = rs.getInt("num");
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DbClose.close(rs, pstmt, conn);
		}
		return result;
	}
	
	// ==================================== 게시판 글쓰기
	public int bodWrite(BoardV01DTO bodDTO) {
		int su = 0;
		try {
			conn = DbSet.getConnection();
			String sql = "select max(bod_no) as num from boardV01"; // 글 레코드의 개수 확인
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int number = 1; // 아무것도 없으면 1로 설정
			while(rs.next()) // 글이 있으면 있는만큼 + 1을 해서 번호를 부여
				number = rs.getInt("num") + 1;
			
			sql = "insert into boardV01 "
					+ "values(?, ?, ?, ?, ?, sysdate, ?, 0, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, bodDTO.getBod_writer());
			pstmt.setString(3, bodDTO.getBod_email());
			pstmt.setString(4, bodDTO.getBod_subject());
			pstmt.setString(5, bodDTO.getBod_pwd());
			pstmt.setString(6, bodDTO.getBod_content());
			pstmt.setString(7, bodDTO.getBod_connIp());
			su = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DbClose.close(pstmt, conn);
		}
		return su;
	}
	
	// ==================================== 게시판 목록
	public ArrayList<BoardV01DTO> bodSelect() {
		ArrayList<BoardV01DTO> dtoL = new ArrayList<BoardV01DTO>();
		String sql = "select * from boardV01 order by bod_logtime desc";
		// 날짜를 기준으로 내림차순 정렬
		try {
			conn = DbSet.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bod_no = rs.getInt("bod_no");
				bod_writer = rs.getString("bod_writer");
				bod_email = rs.getString("bod_email");
				bod_subject = rs.getString("bod_subject");
				bod_pwd = rs.getString("bod_pwd");
				bod_logtime = rs.getString("bod_logtime");
				bod_content = rs.getString("bod_content");
				bod_readCnt = rs.getInt("bod_readCnt");
				bod_connIp = rs.getString("bod_connIp");
				BoardV01DTO dto = new BoardV01DTO(bod_no, bod_writer, bod_email, bod_subject, bod_pwd,
						bod_logtime, bod_content, bod_readCnt, bod_connIp);
				dtoL.add(dto);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DbClose.close(rs, pstmt, conn);
		}
		return dtoL;
	}
	
	// ==================================== 게시판 선택
	public BoardV01DTO bodSelect(int bod_no) {
		BoardV01DTO dto = null;
		try {
			String sql = "update boardV01 "
					+ "set bod_readCnt = bod_readCnt + 1 "
					+ "where bod_no = ?";
			conn = DbSet.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bod_no);
			int su = pstmt.executeUpdate();
			//if(su != 0)
				// System.out.println("조회수++");
			
			sql = "select * from boardV01 where bod_no = ?";
			conn = DbSet.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bod_no);
			rs = pstmt.executeQuery();
			if(rs != null)
				while(rs.next()) {
					bod_no = rs.getInt("bod_no");
					bod_writer = rs.getString("bod_writer");
					bod_email = rs.getString("bod_email");
					bod_subject = rs.getString("bod_subject");
					bod_pwd = rs.getString("bod_pwd");
					bod_logtime = rs.getString("bod_logtime");
					bod_content = rs.getString("bod_content");
					bod_readCnt = rs.getInt("bod_readCnt");
					bod_connIp = rs.getString("bod_connIp");
					dto = new BoardV01DTO(bod_no, bod_writer, bod_email, bod_subject, bod_pwd,
							bod_logtime, bod_content, bod_readCnt, bod_connIp);
				}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DbClose.close(rs, pstmt, conn);
		}
		return dto;
	}
	
	// ==================================== 게시판 글 삭제
	public int bodDelete(BoardV01DTO boardDTO) {
		int su = 0;
		String sql = "delete from boardV01 "
				+ "where bod_no = ? and bod_pwd = ?";
		try {
			conn = DbSet.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardDTO.getBod_no());
			pstmt.setString(2, boardDTO.getBod_pwd());
			su = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DbClose.close(pstmt, conn);
		}
		return su;
	}
	
	public int bodUpdate(BoardV01DTO dto) {
		int su = 0;
		String sql = "update boardV01 set "
				+ "bod_writer = ?, "
				+ "bod_pwd = ?, "
				+ "bod_subject = ?, "
				+ "bod_email = ?, "
				+ "bod_content = ? "
				+ "where bod_no = ?";
		try {
			conn = DbSet.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBod_writer());
			pstmt.setString(2, dto.getBod_pwd());
			pstmt.setString(3, dto.getBod_subject());
			pstmt.setString(4, dto.getBod_email());
			pstmt.setString(5, dto.getBod_content());
			pstmt.setInt(6, dto.getBod_no());
			su = pstmt.executeUpdate();			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			DbClose.close(pstmt, conn);
		}
		return su;
	}
}