package com.iothome.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class EnvironmentDAO {
	private DBConnect dbconnect = null;
	private String sql = "";
	private String sql1= "";
	private String sql2= "";
	private String sql3= "";
	public EnvironmentDAO() {
		dbconnect = new DBConnect();
	}
	private static EnvironmentDAO environmentdao = new EnvironmentDAO();
	
	public static EnvironmentDAO getInstance(){
		return environmentdao;
		
	}
		
	public ArrayList<EnvironmentDTO> getMemberList() {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<EnvironmentDTO> alist = new ArrayList<EnvironmentDTO>();

		try {
			sql = "select * from ENVIRONMENT_NOW_TB";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				EnvironmentDTO dto = new EnvironmentDTO();
				dto.setTemp(rs.getFloat(1));
				dto.setHumi(rs.getFloat(2));
				alist.add(dto);
			}
		} catch (Exception e) {
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return alist;
	}

	public ArrayList<EnvironmentDTO> getMemberList1() {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<EnvironmentDTO> alist = new ArrayList<EnvironmentDTO>();

		try {
			sql1 = "select * from ENVIRONMENT_USER_TB";
			pstmt = con.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				EnvironmentDTO dto = new EnvironmentDTO();
				dto.setHighTemp(rs.getString(1));
				dto.setLowTemp(rs.getString(2));
				dto.setHighHumi(rs.getString(3));
				dto.setLowHumi(rs.getString(4));
				alist.add(dto);
			}
		} catch (Exception e) {
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return alist;
	}
	
	public int update(int htkey, int ltkey, int hhkey, int lhkey) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try{
			sql3= "update ENVIRONMENT_USER_TB set hightemp="+htkey+" ,lowtemp ="+ltkey+" , highhumi ="+hhkey+" ,lowhumi="+lhkey;
			pstmt= con.prepareStatement(sql3);
			pstmt.executeUpdate();
		}catch (Exception e){	
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		return lhkey;
	}
}