package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import driverdb.DriverDB;
import dto.Member;

public class MemberDao {
	
	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	
	public Member memberGetForSession(String id) throws ClassNotFoundException, SQLException {
		
		Member member = new Member();
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.drivercon();
		
		statement = connection.prepareStatement("SELECT id,level,name FROM member WHERE id=?");
		
		statement.setString(1, id);
		resultSet = statement.executeQuery();

		if(resultSet.next()){	
			member.setId(resultSet.getString("id"));
			member.setLevel(resultSet.getString("level"));
			member.setName(resultSet.getString("name"));
		}

		statement.close();
		connection.close();
		
		return member;	
	}
	
	public String memberLogin(String id, String pw) throws ClassNotFoundException, SQLException {
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.drivercon();
		
		String result = null;
		
		statement = connection.prepareStatement("SELECT pw,level,name,id FROM member WHERE id=?");
		statement.setString(1, id);
		
		resultSet = statement.executeQuery();
		
		if(resultSet.next()) {
			if(pw.equals(resultSet.getString("pw"))){
				System.out.println("01�α��� ����");
				result = "01�α��� ����";
			}else {
				System.out.println("03��� ����ġ");
				result = "03��� ����ġ";
			}
		}else {
			System.out.println("02���̵� ����ġ");
			result = "02���̵� ����ġ";
		}
		
		statement.close();
		connection.close();
		
		return result;
	}
	
	public void memberJoin(Member member) throws SQLException, ClassNotFoundException {
		
		DriverDB driverDb = new DriverDB();
		
		connection = driverDb.drivercon();
		
		statement = connection.prepareStatement("INSERT INTO member(id,pw,name,phone,email,joindate) VALUES(?,?,?,?,?,now())");
		// joinForm ���� ���� ������ �����ͺ��̽� ���̺�ȿ� �ֱ����� Query ���� �ۼ��ϰ� ��ü�� �����ؼ� �غ��մϴ�.
		// ������ �������ݴϴ�.
		statement.setString(1, member.getId());
		statement.setString(2, member.getPw());
		statement.setString(3, member.getName());
		statement.setString(4, member.getPhone());
		statement.setString(5, member.getEmail());

		statement.executeUpdate();
		
		statement.close();
		connection.close();
	}
}
