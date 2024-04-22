package com.waterwastage.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.waterwastage.Model.WardVO;

@Repository
public class WardDAOImpl implements WardDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void wardInsert(WardVO wardVO) {
		
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(wardVO);
		
	}
	
	@Override
	public List wardSearch() {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("from WardVO where status=true");
		return q.list();
	}

	@Override
	public List wardEdit(WardVO wardvo) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("from WardVO where status=true and id = "+wardvo.getId());
		System.out.print("Size = "+q.list().size());
		return q.list();
		
	}
}
