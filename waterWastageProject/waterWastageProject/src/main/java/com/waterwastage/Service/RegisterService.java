package com.waterwastage.Service;

import java.util.List;

import com.waterwastage.Model.RegisterVO;

public interface RegisterService {

	public void insertRegister(RegisterVO registerVO);
	
	public List searchUser();
	
	public List editUser(RegisterVO registerVO);	
}
