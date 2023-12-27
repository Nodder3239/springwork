package org.khit.myapp.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.khit.myapp.dto.BoardDTO;
import org.springframework.stereotype.Repository;

@Repository
public class BoardRepository {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//글쓰기 처리
	public void save(BoardDTO board) {
		conn = JDBCUtil.getConnection();
		String sql = "insert into boards(boardtitle, boardwriter, boardcontent) "
				+ "values(?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getBoardTitle());
			pstmt.setString(2, board.getBoardWriter());
			pstmt.setString(3, board.getBoardContent());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(conn, pstmt);
		}
	}
	
}
