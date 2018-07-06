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
	
	public void memberUpdate(Member member) throws ClassNotFoundException, SQLException {
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.drivercon();
		
		statement = connection.prepareStatement("UPDATE member SET pw=?,name=?,level=?,email=?,phone=? WHERE id=?");
		
		statement.setString(1, member.getPw());
		statement.setString(2, member.getName());
		statement.setString(3, member.getLevel());
		statement.setString(4, member.getEmail());
		statement.setString(5, member.getPhone());
		statement.setString(6, member.getId());
		
		statement.executeUpdate();
		
	}
	
	public Member memberInformationSelect(String id) throws ClassNotFoundException, SQLException {
		
		Member member = new Member();
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.drivercon();
		
		statement = connection.prepareStatement("SELECT * FROM member WHERE id=?");
		
		statement.setString(1, id);
		
		resultSet = statement.executeQuery();

		if(resultSet.next()){	
			member.setId(resultSet.getString("id"));
			member.setPw(resultSet.getString("pw"));
			member.setName(resultSet.getString("name"));
			member.setLevel(resultSet.getString("level"));
			member.setEmail(resultSet.getString("email"));
			member.setPhone(resultSet.getString("phone"));
		}
		
		statement.close();
		connection.close();
		
		return member;
		
	}
	
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
				System.out.println("01로그인 성공");
				result = "01로그인 성공";
			}else {
				System.out.println("03비번 불일치");
				result = "03비번 불일치";
			}
		}else {
			System.out.println("02아이디 불일치");
			result = "02아이디 불일치";
		}
		
		statement.close();
		connection.close();
		
		return result;
	}
	
	public void memberJoin(Member member) throws SQLException, ClassNotFoundException {
		
		DriverDB driverDb = new DriverDB();
		
		connection = driverDb.drivercon();
		
		statement = connection.prepareStatement("INSERT INTO member(id,pw,name,phone,email,joindate) VALUES(?,?,?,?,?,now())");
		// joinForm 에서 받은 값들을 데이터베이스 테이블안에 넣기위해 Query 문을 작성하고 객체에 대입해서 준비합니다.
		// 값들을 대입해줍니다.
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
