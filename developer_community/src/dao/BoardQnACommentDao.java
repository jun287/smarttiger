// 28�� �̿��� 2018. 7. 6(��) BoardQnACommentDao.java
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
	�޼ҵ� ����	
	1. �뵵 : �� ���� QnA�Խ��� �ۿ� ����� �Է�(DB BoardQnA_comment���̺� 1�� �� �Է�)
	2. �Ű����� : BoardQnAComment boardQnAComment(BoardQnACommentŬ������ ���� ������ boardQnAComment��ü�� ������)
	3. ���ϰ� : void
	4. BoardQnAComment Class ������Ƽ
		- ���������ڴ� ��� private��. 
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
	�޼ҵ� ����	
	1. �뵵 : �� ���� QnA�Խ��� �ۿ� ����� ����Ʈ�� ��ȸ(DB BoardQnA_comment���̺� boardqna_no�� Ư�������� �� ��ȸ)
	2. �Ű����� : BoardQnAComment boardQnAComment(BoardQnACommentŬ������ ���� ������ boardQnAComment��ü�� ������)
	3. ���ϰ� : ArrayList<BoardQnAComment>(BoardQnAComment�� ���� ������ ��ü�� �������� ���� ����Ʈ)
	4. BoardQnAComment Class ������Ƽ
		- ���������ڴ� ��� private��. 
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
	�޼ҵ� ����	
	1. �뵵 : 1���� QnA�Խ��� �ۿ� ����� ä�ý� ä�ÿ��� update(DB BoardQnA_comment���̺� choose�÷� ����)
	2. �Ű����� : String memberId(����ۼ��� ������� Id)
	3. ���ϰ� : void
	4. BoardQnAComment Class ������Ƽ
		- ���������ڴ� ��� private��. 
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
	�޼ҵ� ����	
	1. �뵵 : 1���� QnA�Խ��� �ۿ� ��� ��ȸ(DB BoardQnA_comment���̺� ��ȸ)
	2. �Ű����� : int boardQnANumber
	3. ���ϰ� : BoardQnACommentŬ������ ���� ������ ��ü�� ������
	4. BoardQnAComment Class ������Ƽ
		- ���������ڴ� ��� private��. 
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
	�޼ҵ� ����	
	1. �뵵 : 1���� QnA�Խ��� �ۿ� �Ѹ��� �ۼ��� ����� ���� ��ȸ(DB BoardQnA_comment���̺� ��ȸ)
	2. �Ű����� : BoardQnAComment boardQnAComment
	3. ���ϰ� : int countBoardQnAComment
	4. BoardQnAComment Class ������Ƽ
		- ���������ڴ� ��� private��. 
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
