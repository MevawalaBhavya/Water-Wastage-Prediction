package com.waterwastage.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.waterwastage.Model.RegisterVO;

@Repository
public class RegisterDAOImpl implements RegisterDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void insertRegister(RegisterVO registerVO) {
		// TODO Auto-generated method stub
		
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(registerVO);
	}

	@Override
	public List searchUsers() {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		Query q = session.createQuery("from RegisterVO where status=true");
		System.out.print("Size = "+q.list().size());
		return q.list();
	}

	@Override
	public List editUser(RegisterVO registerVO) {
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("from RegisterVO where status=true and id = "+registerVO.getRegisterId());
		System.out.print("Size = "+q.list().size());
		return q.list();
	}

	
}
