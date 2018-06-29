package driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
	public Connection  drivercon() throws SQLException, ClassNotFoundException {
		System.out.println("01드라이버로딩및DB연결");
		
		//ip주소,포트번호,db명,사용자id,사용자pw
		String dbname="jdbc:mysql://localhost:3306/developer_community?\" +\"useUnicode=true&characterEncoding=euckr";
		String dbid="java";
		String dbpw="java0000";
		
		//driver주소
		String dbdriver="com.mysql.jdbc.Driver";
		
		//driver로딩
		Class.forName(dbdriver);
		
		//db연결
		Connection conn=DriverManager.getConnection(dbname,dbid,dbpw);
		
		System.out.println(conn+"<--conn");
		return conn;
	}
}
