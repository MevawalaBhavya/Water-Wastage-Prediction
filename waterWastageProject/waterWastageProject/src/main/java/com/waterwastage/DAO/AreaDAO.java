package com.waterwastage.DAO;

import java.util.List;

import com.waterwastage.Model.AreaVO;

public interface AreaDAO {

	public void areaInsert(AreaVO areaVO);
	
	public List searchArea();
	
	public List editArea(AreaVO areaVO);	
	
}
