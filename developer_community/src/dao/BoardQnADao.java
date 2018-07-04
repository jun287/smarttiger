package dao;
import driverdb.DriverDB;
import dto.BoardQnA;
import java.sql.*;
import java.util.ArrayList;

public class BoardQnADao {
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	String sql = null;
	/*
	�޼ҵ� ����	
	1. �뵵 : �� ���� QnA�Խ��� �� �Է�(DB BoardQnA���̺� 1�� �� �Է�)
	2. �Ű����� : BoardQnA boardQnA(BoardQnAŬ������ ���� ������ boardQnA��ü�� ������)
	3. ���ϰ� : void
	4. BoardQnA Class ������Ƽ
		- ���������ڴ� ��� private��. 
		int boardQnANumber, String memberId, String boardQnAtitle, String boardQnAContent, String boardQnADate
		int boardQnAhits, String boardQnAChoose, String boardQnACategory
	*/
	public void insertBoardQnA(BoardQnA boardQnA) throws ClassNotFoundException, SQLException {
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "INSERT INTO boardqna(member_id, boardqna_title, boardqna_content, boardqna_date, boardqna_category) VALUES (?, ?, ?, now(), ?)";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, boardQnA.getMemberId());
		preparedStatement.setString(2, boardQnA.getBoardQnAtitle());
		preparedStatement.setString(3, boardQnA.getBoardQnAContent());
		preparedStatement.setString(4, boardQnA.getBoardQnACategory());
		preparedStatement.executeUpdate();
		preparedStatement.close();
		connection.close();
	}
	/*
	�޼ҵ� ����	
	1. �뵵 : ��ü QnA�Խ��Ǳ��� ��ȸ(DB BoardQnA���̺� ��ü �� ��ȸ)
	2. �Ű����� : ArrayList<BoardQnA>(ArrayListŬ������ ���� ������ boardQnAList��ü�� ���������� BoardQnAŬ������ ���� ������ ��ü�� �������� ��� ����.)
	3. ���ϰ� : ArrayList<BoardQnA>
	4. BoardQnA Class ������Ƽ
		- ���������ڴ� ��� private��. 
		int boardQnANumber, String memberId, String boardQnAtitle, String boardQnAContent, String boardQnADate
		int boardQnAhits, String boardQnAChoose, String boardQnACategory
	*/
	public ArrayList<BoardQnA> allSelectBoardQnA(BoardQnA boardQnA) throws ClassNotFoundException, SQLException{
		ArrayList<BoardQnA> boardQnAList = new ArrayList<>();
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "select category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna";
		preparedStatement = connection.prepareStatement(sql);
		resultSet = preparedStatement.executeQuery();
		while(resultSet.next()) {
			boardQnA = new BoardQnA();
			boardQnA.setBoardQnACategory(resultSet.getNString(1));
			boardQnA.setBoardQnANumber(resultSet.getInt(2));
			boardQnA.setBoardQnAtitle(resultSet.getString(3));
			boardQnA.setMemberId(resultSet.getString(4));
			boardQnA.setBoardQnADate(resultSet.getString(5));
			boardQnA.setBoardQnAhits(resultSet.getInt(6));
			boardQnAList.add(boardQnA);
		}
		return boardQnAList;
	}
	

	
}
