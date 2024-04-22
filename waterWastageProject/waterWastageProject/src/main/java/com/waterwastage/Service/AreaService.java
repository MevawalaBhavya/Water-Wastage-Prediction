package com.waterwastage.Service;

import java.util.List;

import com.waterwastage.Model.AreaVO;

public interface AreaService {

	public void areaInsert(AreaVO areaVO);
	
	public List areaSearch();
	
	public List areaEdit(AreaVO areaVO);
	
}

