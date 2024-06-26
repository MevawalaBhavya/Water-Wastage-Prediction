package com.waterwastage.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.waterwastage.Model.LoginVO;
import com.waterwastage.Model.RegisterVO;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void register(RegisterVO registerVO) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(registerVO);
	}

	@Override
	public void insertLogin(LoginVO loginVO) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(loginVO);
	}

	@Override
	public List searchLoginID(String loginService) {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("from LoginVO where username = '"+loginService+"' ");
		List ls = q.list();
		return ls;
	}


	@SuppressWarnings("rawtypes")
	@Override
	public List getuserCount() {
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("select count(loginId) from LoginVO where role = 'ROLE_USER' ");
		List ls = q.list();
		return ls;
	}


	
}
