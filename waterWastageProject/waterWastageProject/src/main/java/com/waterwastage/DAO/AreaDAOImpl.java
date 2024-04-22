package com.waterwastage.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.waterwastage.Model.AreaVO;

@Repository
public class AreaDAOImpl implements AreaDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void areaInsert(AreaVO areaVO) {
		
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(areaVO);
		
	}

	@Override
	public List searchArea() {
		// TODO Auto-generated method stub
		
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("from AreaVO where status=true");
		System.out.print("Size = "+q.list().size());
		return q.list();
	}

	@Override
	public List editArea(AreaVO areaVO) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("from AreaVO where status=true and id = "+areaVO.getId());
		System.out.print("Size = "+q.list().size());
		return q.list();
		
	}

}
