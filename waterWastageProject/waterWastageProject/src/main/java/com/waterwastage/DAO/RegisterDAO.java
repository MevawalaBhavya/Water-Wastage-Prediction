package com.waterwastage.DAO;

import java.util.List;

import com.waterwastage.Model.RegisterVO;

public interface RegisterDAO {

	public void insertRegister(RegisterVO registerVO);
	
	public List searchUsers();
	
	public List editUser(RegisterVO registerVO);	
	
	
}
