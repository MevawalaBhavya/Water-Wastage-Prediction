package com.waterwastage.DAO;

import java.util.List;

import com.waterwastage.Model.WaterDataVO;

public interface WaterDataDAO {

	public void waterDataInsert(WaterDataVO waterDataVO);
	
	public List waterDataSearch();
	
	
}
