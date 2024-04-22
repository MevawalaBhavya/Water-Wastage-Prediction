package com.waterwastage.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.waterwastage.Model.WaterDataVO;

@Repository
public class WaterDAOImpl implements WaterDataDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void waterDataInsert(WaterDataVO waterDataVO) {
		// TODO Auto-generated method stub
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(waterDataVO);	
	}

	@Override
	public List waterDataSearch() {
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("from WaterDataVO where status=true");
		System.out.print("Size = "+q.list().size());
		return q.list();
	
	}

	
	
	
}
