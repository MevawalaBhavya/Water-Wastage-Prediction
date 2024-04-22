package com.waterwastage.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.waterwastage.DAO.RegisterDAO;
import com.waterwastage.Model.RegisterVO;

@Service
@Transactional
public class RegisterServiceImpl implements RegisterService {

	@Autowired RegisterDAO registerDAO;
	
	public void insertRegister(RegisterVO registerVO) {
		this.registerDAO.insertRegister(registerVO);
	}

	@Override
	public List searchUser() {
		// TODO Auto-generated method stub
		return this.registerDAO.searchUsers();
	}

	@Override
	public List editUser(RegisterVO registerVO) {
		// TODO Auto-generated method stub
		return this.registerDAO.editUser(registerVO);
	}
}
