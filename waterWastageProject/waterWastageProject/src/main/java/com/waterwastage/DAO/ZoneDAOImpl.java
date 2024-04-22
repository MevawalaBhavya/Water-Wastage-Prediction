package com.waterwastage.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.waterwastage.Model.ZoneVO;


@Repository
public class ZoneDAOImpl implements ZoneDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void insertZone(ZoneVO zoneVO) {
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(zoneVO);
	}

	@Override
	public List searchZone() {
		
		Session session = sessionFactory.getCurrentSession();
		Query q=session.createQuery("from ZoneVO where status=true");
		return q.list();
	}

	@Override
	public List editZone(ZoneVO zoneVO) {
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("from ZoneVO where status=true and id = "+zoneVO.getId());
		System.out.print("Size = "+q.list().size());
		return q.list();	
	}

}
