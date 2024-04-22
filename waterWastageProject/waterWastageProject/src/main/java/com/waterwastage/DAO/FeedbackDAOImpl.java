package com.waterwastage.DAO;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.waterwastage.Model.FeedbackVO;

@Repository
public class FeedbackDAOImpl implements FeedbackDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public void saveFeedback(FeedbackVO feedbackVO) {
	
		Session session = this.sessionFactory.getCurrentSession();
		session.saveOrUpdate(feedbackVO);	
	}

	@Override
	public List viewUserFeedback(FeedbackVO feedbackVO) {
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("from FeedbackVO where loginVO.loginId = "+feedbackVO.getLoginVO().getLoginId()+" and status=true");
		System.out.print("Size = "+q.list().size());
		return q.list();
	}

	@Override
	public List viewAdminFeedback() {
		// TODO Auto-generated method stub

		Session session = sessionFactory.openSession();
		Query q=session.createQuery("from FeedbackVO where status=true");
		System.out.print("Size = "+q.list().size());
		return q.list();
	}

	@Override
	public List getFeedbackCount() {
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("select count(id) from FeedbackVO");
		System.out.print("Size = "+q.list().size());
		return q.list();
	}

	
}
