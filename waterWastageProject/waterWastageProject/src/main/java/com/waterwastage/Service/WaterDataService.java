package com.waterwastage.Service;

import java.util.List;

import com.waterwastage.Model.WaterDataVO;


public interface WaterDataService {
	
	public void waterDataInsert(WaterDataVO waterDataVO);
	
	public List waterDataSearch();
	
	

}
