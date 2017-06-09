package com.iothome.main.controller;

import java.util.ArrayList;

import com.iothome.model.*;

public class EnvironmentController {
	private int result;
	private EnvironmentDAO dao;
	private int htkey;
	private int ltkey;
	private int hhkey;
	private int lhkey;

	public EnvironmentController() {
		// TODO Auto-generated constructor stub
		dao = new EnvironmentDAO();
	}

	public int insertEnvironment(int htkey, int ltkey, int hhkey, int lhkey){
		this.htkey = htkey;
		this.ltkey = ltkey;
		this.hhkey = hhkey;
		this.lhkey = lhkey;
		try{
			result = dao.update(htkey, ltkey, hhkey, lhkey);	
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}