package com.waterwastage.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.waterwastage.DAO.LoginDAO;
import com.waterwastage.Model.LoginVO;
import com.waterwastage.Model.RegisterVO;

@Service
@Transactional
public class LoginServiceImpl implements LoginService {

	@Autowired
	LoginDAO loginDAO;
	
	@Override
	public void insertRegister(RegisterVO registerVO) {
		// TODO Auto-generated method stub
		loginDAO.register(registerVO);
	}

	@Override
	public void insertLogin(LoginVO loginVO) {
		// TODO Auto-generated method stub
		loginDAO.insertLogin(loginVO);
	}

	@Override
	public List searchLoginID(String loginService) {
		// TODO Auto-generated method stub
		List ls = loginDAO.searchLoginID(loginService);
		return ls;
	}

	@Override
	public List getUserCount() {
		// TODO Auto-generated method stub
		List ls = loginDAO.getuserCount();
		return ls;
	}


}
