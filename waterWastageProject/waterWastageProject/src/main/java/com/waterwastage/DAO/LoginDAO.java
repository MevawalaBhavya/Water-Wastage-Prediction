package com.waterwastage.DAO;

import java.util.List;

import com.waterwastage.Model.LoginVO;
import com.waterwastage.Model.RegisterVO;

public interface LoginDAO {

	public void register(RegisterVO registerVO);

	public void insertLogin(LoginVO loginVO);

	public List searchLoginID(String loginService);
	
	public List getuserCount();
	
	
}
