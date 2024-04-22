package com.waterwastage.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.waterwastage.Model.WastagePredictionVO;

@Repository
public class PredictionDAOImpl implements PredictionDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	public List searchPrediction()
	{
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("from WastagePredictionVO");
		return q.list();
	}
	
	@Override
	public List plotGraph() {
		List ls = new ArrayList();
		try {
			Session session = sessionFactory.openSession();
			Query q=session.createSQLQuery("SELECT YEAR(dateOfWater),wastagePrediction FROM wastageprediction_tbl GROUP BY YEAR(dateOfWater)");
			System.out.print("Size = "+q.list().size());
			ls = q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		
		return ls;
	}

	@Override
	public List usageGraph() {
		List ls = new ArrayList();
		try {
			Session session = sessionFactory.openSession();
			Query q=session.createSQLQuery("SELECT wastageprediction_tbl.usagePrediction,ward_tbl.`ward_name` FROM wastageprediction_tbl INNER JOIN ward_tbl ON wastageprediction_tbl.`wardId`=ward_tbl.`Id` GROUP BY ward_tbl.`Id`");
			System.out.print("Size = "+q.list().size());
			ls = q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		
		return ls;
	}

	@Override
	public List wastageGraph() {
		List ls = new ArrayList();
		try {
			Session session = sessionFactory.openSession();
			Query q=session.createSQLQuery("SELECT wastageprediction_tbl.`wastagePrediction`,ward_tbl.`ward_name` FROM wastageprediction_tbl INNER JOIN ward_tbl ON wastageprediction_tbl.`wardId`=ward_tbl.`Id` GROUP BY ward_tbl.`Id`");
			System.out.print("Size = "+q.list().size());
			ls = q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		
		return ls;
	}

	@Override
	public List plotUsageGraph() {
		List ls = new ArrayList();
		try {
			Session session = sessionFactory.openSession();
			Query q=session.createSQLQuery("SELECT YEAR(dateOfWater),usagePrediction FROM wastageprediction_tbl GROUP BY YEAR(dateOfWater)");
			System.out.print("Size = "+q.list().size());
			ls = q.list();
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		
		return ls;
	}
	
	public List seachByWardZOne(WastagePredictionVO wastagePredictionVO){
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("select dateOfWater,wastagePrediction from WastagePredictionVO where zoneVO='"+wastagePredictionVO.getZoneVO().getId()+"'"
				+ " and wardVO='"+wastagePredictionVO.getWardVO().getId()+"'");
		System.out.print("Size = "+q.list().size());
		return q.list();
	}
	
	public List seachByWardZOneUsage(WastagePredictionVO wastagePredictionVO){
		Session session = sessionFactory.openSession();
		Query q=session.createQuery("select dateOfWater,usagePrediction from WastagePredictionVO where zoneVO='"+wastagePredictionVO.getZoneVO().getId()+"'"
				+ " and wardVO='"+wastagePredictionVO.getWardVO().getId()+"'");
		System.out.print("Size = "+q.list().size());
		return q.list();
	}
}
