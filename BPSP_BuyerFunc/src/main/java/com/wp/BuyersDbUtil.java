package com.wp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BuyersDbUtil {
	public static List<Buyers_Info> getBuyerList() throws ClassNotFoundException, SQLException
	{
		ArrayList<Buyers_Info> buyers = new ArrayList<>();
		
		Connection con = DatabaseUtil.getConnection();
        
        //Create a statement
        PreparedStatement ps = con.prepareStatement("select * from buyerList");
        
        //Execute the statement
        ResultSet rs = ps.executeQuery();
        
        while(rs.next())
        {
        	int buyer_id = rs.getInt(1);
        	String buyer_name = rs.getString(2);
        	double buyer_request_amount = rs.getDouble(3);
        	
        	Buyers_Info buyer_info = new Buyers_Info(buyer_id,buyer_name,buyer_request_amount);
        	
        	buyers.add(buyer_info);
        }
		
		return buyers;
	}
}