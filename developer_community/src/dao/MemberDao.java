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
	
	
	public void memberDelete(String id, String pw) throws ClassNotFoundException, SQLException {
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.drivercon();
			
		
	}
	// id 와 level을 매개변수로 받아서 데이터베이스 테이블에 level 컬럼을 수정하는 메서드 선언
	public void memberLevel(String id ,String level) throws ClassNotFoundException, SQLException {
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.drivercon();
		
		statement = connection.prepareStatement("UPDATE member SET level=? WHERE id=?");
		
		statement.setString(1, level);
		statement.setString(2, id);
		
		statement.executeUpdate();
		
		statement.close();
		connection.close();
		
	}
	// 수정된 회원정보를 담은 Member객체의 주소값을 매개변수로 하여 데이터베이스에 테이블 데이터를 수정하는 메서드 선언 
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
		
		statement.close();
		connection.close();
	}
	// 접속정보 ID를 매개변수로 받아서 데이터베이스 테이블을 조회하고 회원 정보를 member 클래스객체를 생성하여 대입받아 객체의 주소를 리턴하는 메서드 선언
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
	// 회원 id 를 매개변수로 받아서 세션처리 할 id,level,name 을 데이터베이스테이블에서 조회후 member 클래스객체에 대입하고 리턴하는 메서드 선언(세션 처리시 필요)
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
	// id 와 pw 를 받아서 id로 데이터베이스 조회후 조건문으로 경우의 수 대로 result 를 받아 리턴하는 메서드 선언(로그인시 필요)
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
	// 회원정보가 담긴 member 클래스객체의 주소값을 매개변수로 받아서 데이터베이스에 입력하는 메서드 선언
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
