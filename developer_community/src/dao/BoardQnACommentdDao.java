package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import driverdb.DriverDB;
import dto.BoardQnAComment;

public class BoardQnACommentdDao {
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	String sql = null;
	/*
	메소드 설명	
	1. 용도 : 한 개의 QnA게시판 글에 답글을 입력(DB BoardQnA_comment테이블 1개 행 입력)
	2. 매개변수 : BoardQnAComment boardQnAComment(BoardQnAComment클래스를 통해 생성된 boardQnAComment객체의 참조값)
	3. 리턴값 : void
	4. BoardQnAComment Class 프로퍼티
		- 접근지정자는 모두 private임. 
		int boardQnACommentNumber, int boardQnANumber, String memberId,	String boardqnaCommentContent, String boardqnaCommentDate
		String choose;
	*/
	public void insertBoardQnAComment(BoardQnAComment boardQnAComment) throws ClassNotFoundException, SQLException {
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "INSERT INTO boardqna_comment (boardqna_no, member_id, boardqna_comment_content, boardqna_comment_date) VALUES (?, ?, ?, now())";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, boardQnAComment.getBoardQnANumber());
		preparedStatement.setString(2, boardQnAComment.getMemberId());
		preparedStatement.setString(3, boardQnAComment.getBoardqnaCommentContent());
		preparedStatement.executeUpdate();
		preparedStatement.close();
		connection.close();
	}
	
	public ArrayList<BoardQnAComment> selectBoardQnAComment(BoardQnAComment boardQnAComment) throws ClassNotFoundException, SQLException{
		ArrayList<BoardQnAComment> boardQnACommentList = new ArrayList<>();
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "select boardqna_comment_no,boardqna_no,member_id,boardqna_comment_content,boardqna_comment_date,choose from boardqna_comment where boardqna_no=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, boardQnAComment.getBoardQnANumber());
		resultSet = preparedStatement.executeQuery();
		while(resultSet.next()) {
			boardQnAComment = new BoardQnAComment();
			boardQnAComment.setBoardQnACommentNumber(resultSet.getInt(1));
			boardQnAComment.setBoardQnANumber(resultSet.getInt(2));
			boardQnAComment.setMemberId(resultSet.getString(3));
			boardQnAComment.setBoardqnaCommentContent(resultSet.getString(4));
			boardQnAComment.setBoardqnaCommentDate(resultSet.getString(5));
			boardQnAComment.setChoose(resultSet.getString(6));
			boardQnACommentList.add(boardQnAComment);
		}
		resultSet.close();
		preparedStatement.close();
		connection.close();
		return boardQnACommentList;
		
	}
}
