
package com.dao;

import com.entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class UserDao {
    private final Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
 public boolean register(User u){
     boolean f =false;
     
     try {
         String sql="insert into user_details1(full_name, email, password) values(?,?,?)";
         
         PreparedStatement ps=con.prepareStatement(sql);
         ps.setString(1, u.getFullName());
         ps.setString(2, u.getEmail());
         ps.setString(3, u.getPassword());
         
        int i= ps.executeUpdate();
        
        if(i==1){
            f=true;
        }
         
     } catch (Exception e) {
         e.printStackTrace();
     }
     return f;   
 }
 
 public User Login(String em,String psw)
 {
     User u = null;
     try {
         String sql="select * from user_details1 where email=? and password=?";
         PreparedStatement ps=con.prepareStatement(sql);
         ps.setString(1,em);
         ps.setString(2,psw);
         
         ResultSet rs=ps.executeQuery();
         
         while(rs.next())
         {
            u=new User();
            u.setId(rs.getInt(1));
            u.setFullName(rs.getString(2));
            u.setEmail(rs.getString(3));
            u.setPassword(rs.getString(4));
         }
         
     } catch (Exception e) {
         e.printStackTrace();
     }
    
     return u;
 }
 
 public boolean checkOldPassword(int userid,String oldPassword){
     boolean f=false;
     
     try {
         String sql="select * from user_details1 where id=? and password=?";
         PreparedStatement ps=con.prepareStatement(sql);
         ps.setInt(1, userid);
         ps.setString(2, oldPassword);
         
         ResultSet rs=ps.executeQuery();
         while(rs.next())
         {
             f=true;
         }
         
     } catch (Exception e) {
         e.printStackTrace();
     }
     
     
             return f;
 }
 
 public boolean changePassword(int userid,String newPassword){
     boolean f=false;
     
     try {
         String sql="update user_details1 set password=? where id=?";
         PreparedStatement ps=con.prepareStatement(sql);
         ps.setString(1, newPassword);
         ps.setInt(2, userid);
         
        int i=ps.executeUpdate();
        if(i==1){
            f=true;
        }
     } catch (Exception e) {
         e.printStackTrace();
     }
     
     
             return f;
 }
}
