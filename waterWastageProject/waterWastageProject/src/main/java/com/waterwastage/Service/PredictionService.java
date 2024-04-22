package com.waterwastage.Service;

import java.util.List;

import com.waterwastage.Model.WastagePredictionVO;

public interface PredictionService {

	public List searchPrediction();
	
	public List plotGraph();
	
	public List plotUsageGraph();
	
	public List usageGraph();
	
	public List wastageGraph();

	public List seachByWardZOne(WastagePredictionVO wastagePredictionVO);
	
	public List seachByWardZOneUsage(WastagePredictionVO wastagePredictionVO);
	
}
