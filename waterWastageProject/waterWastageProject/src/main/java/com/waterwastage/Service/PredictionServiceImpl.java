package com.waterwastage.Service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.waterwastage.DAO.PredictionDAO;
import com.waterwastage.Model.WastagePredictionVO;

@Service
@Transactional
public class PredictionServiceImpl implements PredictionService {

	@Autowired
	private PredictionDAO predictionDAO;
	
	public List searchPrediction()
	{
		List predictionList = this.predictionDAO.searchPrediction();
				
		return predictionList;
	}
	
	@Override
	public List plotGraph() {
		// TODO Auto-generated method stub
		return this.predictionDAO.plotGraph();
	}

	@Override
	public List plotUsageGraph() {
		// TODO Auto-generated method stub
		return this.predictionDAO.plotUsageGraph();
	}

	@Override
	public List usageGraph() {
		return this.predictionDAO.usageGraph();
	}

	@Override
	public List wastageGraph() {
		return this.predictionDAO.wastageGraph();
	}

	public List seachByWardZOne(WastagePredictionVO wastagePredictionVO){
		return this.predictionDAO.seachByWardZOne(wastagePredictionVO);
	}
	
	public List seachByWardZOneUsage(WastagePredictionVO wastagePredictionVO){
		return this.predictionDAO.seachByWardZOneUsage(wastagePredictionVO);
	}
}
