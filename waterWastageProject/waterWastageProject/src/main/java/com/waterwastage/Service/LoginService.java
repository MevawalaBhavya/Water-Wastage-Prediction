package com.waterwastage.Service;

import java.util.List;

import com.waterwastage.Model.LoginVO;
import com.waterwastage.Model.RegisterVO;

public interface LoginService {

	public void insertRegister(RegisterVO registerVO);
	
	public void insertLogin(LoginVO loginVO);
	
	public List searchLoginID(String loginService);
	
	public List getUserCount();

	
}
