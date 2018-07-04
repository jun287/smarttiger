package dao;
import driverdb.DriverDB;
import dto.Goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class GoodsDao {

	public void insertGoods(Goods goods) throws ClassNotFoundException, SQLException{
		System.out.println("insertGoods");
		
		DriverDB driverdb=new DriverDB();
		Connection connection=null;
		PreparedStatement statement=null;
		String sql="insert into good(id,goods_title,goods_info,goods_price,goods_date,goods_img) values(?,?,?,?,CURDATE(),?)";
		
		
		connection=driverdb.drivercon();
		statement =connection.prepareStatement(sql);
		
		statement.setString(1, "1");
		statement.setString(2, goods.getTitle());
		statement.setString(3, goods.getComment());
		statement.setString(4, goods.getPrice());
		statement.setString(5, goods.getAttachment());
	
		statement.executeUpdate();
		
	}
}
