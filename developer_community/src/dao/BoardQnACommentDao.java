// 28기 이원상 2018. 7. 6(금) BoardQnACommentDao.java
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import driverdb.DriverDB;
import dto.BoardQnAComment;

public class BoardQnACommentDao {
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
	
	/*
	메소드 설명	
	1. 용도 : 한 개의 QnA게시판 글에 답글을 리스트로 조회(DB BoardQnA_comment테이블 boardqna_no의 특정데이터 행 조회)
	2. 매개변수 : BoardQnAComment boardQnAComment(BoardQnAComment클래스를 통해 생성된 boardQnAComment객체의 참조값)
	3. 리턴값 : ArrayList<BoardQnAComment>(BoardQnAComment를 통해 생성된 객체의 참조값을 담은 리스트)
	4. BoardQnAComment Class 프로퍼티
		- 접근지정자는 모두 private임. 
		int boardQnACommentNumber, int boardQnANumber, String memberId,	String boardqnaCommentContent, String boardqnaCommentDate
		String choose;
	*/
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
	
	/*
	메소드 설명	
	1. 용도 : 1개의 QnA게시판 글에 답글이 채택시 채택여부 update(DB BoardQnA_comment테이블 choose컬럼 수정)
	2. 매개변수 : String memberId(답글작성한 사용자의 Id)
	3. 리턴값 : void
	4. BoardQnAComment Class 프로퍼티
		- 접근지정자는 모두 private임. 
		int boardQnACommentNumber, int boardQnANumber, String memberId,	String boardqnaCommentContent, String boardqnaCommentDate
		String choose;
	*/
	public void updateBoardQnAComment(String memberId) throws ClassNotFoundException, SQLException {
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "UPDATE boardqna_comment	SET choose='Y'	WHERE member_id=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, memberId);
		preparedStatement.executeUpdate();
		preparedStatement.close();
		connection.close();
	}
	
	/*
	메소드 설명	
	1. 용도 : 1개의 QnA게시판 글에 답글 조회(DB BoardQnA_comment테이블 조회)
	2. 매개변수 : int boardQnANumber
	3. 리턴값 : BoardQnAComment클래스를 통해 생성된 객체의 참조갑
	4. BoardQnAComment Class 프로퍼티
		- 접근지정자는 모두 private임. 
		int boardQnACommentNumber, int boardQnANumber, String memberId,	String boardqnaCommentContent, String boardqnaCommentDate
		String choose;
	*/
	public BoardQnAComment selectBoardQnAComment(int boardQnANumber) throws ClassNotFoundException, SQLException {
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		BoardQnAComment boardQnAComment = new BoardQnAComment();
		sql = "select boardqna_comment_no,boardqna_no,member_id,boardqna_comment_content,boardqna_comment_date,choose from boardqna_comment where boardqna_no=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, boardQnANumber);
		resultSet = preparedStatement.executeQuery();
		if(resultSet.next()){
		boardQnAComment.setBoardQnACommentNumber(resultSet.getInt(1));
		boardQnAComment.setBoardQnANumber(resultSet.getInt(2));
		boardQnAComment.setMemberId(resultSet.getString(3));
		boardQnAComment.setBoardqnaCommentContent(resultSet.getString(4));
		boardQnAComment.setBoardqnaCommentDate(resultSet.getString(5));
		boardQnAComment.setChoose(resultSet.getString(6));
		}
		return boardQnAComment;
	}
	
	/*
	메소드 설명	
	1. 용도 : 1개의 QnA게시판 글에 한명이 작성한 답글의 수를 조회(DB BoardQnA_comment테이블 조회)
	2. 매개변수 : BoardQnAComment boardQnAComment
	3. 리턴값 : int countBoardQnAComment
	4. BoardQnAComment Class 프로퍼티
		- 접근지정자는 모두 private임. 
		int boardQnACommentNumber, int boardQnANumber, String memberId,	String boardqnaCommentContent, String boardqnaCommentDate
		String choose;
	*/
	public int countBoardQnAComment(BoardQnAComment boardQnAComment) throws ClassNotFoundException, SQLException{
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "select count(boardqna_comment_no) as count from boardqna_comment where boardqna_no=? and member_id=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, boardQnAComment.getBoardQnANumber());
		preparedStatement.setString(2, boardQnAComment.getMemberId());
		resultSet = preparedStatement.executeQuery();
		int countBoardQnAComment = 0;
		if(resultSet.next()){
			countBoardQnAComment =  resultSet.getInt(1);
		}
		return countBoardQnAComment;
	}
}
