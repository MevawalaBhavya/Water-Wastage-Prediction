package com.waterwastage.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.waterwastage.Model.ComplaintVO;

@Repository
public class ComplainDAOImpl implements ComplainDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void complainInsert(ComplaintVO complaintVO) {
		// TODO Auto-generated method stub
		
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(complaintVO);
		
	}

	@Override
	public List searchUserComplain(ComplaintVO complaintVO) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("from ComplaintVO where loginVO.loginId = "+complaintVO.getLoginVO().getLoginId()+" and status=true");
		System.out.print("Size = "+q.list().size());
		return q.list();
	}

	@Override
	public List searchAdminComplain() {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("from ComplaintVO where status=true");
		System.out.print("Size = "+q.list().size());
		return q.list();
	}

	@Override
	public List fetchComplain(ComplaintVO complaintVO) {
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("from ComplaintVO where id = "+complaintVO.getId()+" and  status=true");
		System.out.print("Size = "+q.list().size());
		return q.list();
	}

	@Override
	public List getTotalComplainCount() {
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("SELECT COUNT(id) FROM ComplaintVO where status=true");
		System.out.print("Size = "+q.list().size());
		return q.list();
	}

	@Override
	public List getPendingComplainCount() {
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("SELECT COUNT(id) FROM ComplaintVO where status=true and complain_status='PENDING'");
		System.out.print("Size = "+q.list().size());
		return q.list();
	}

}
