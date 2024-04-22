package com.waterwastage.DAO;

import java.util.List;

import com.waterwastage.Model.WardVO;

public interface WardDAO {

	public void wardInsert(WardVO wardvo);
	
	public List wardSearch();	
	
	public List wardEdit(WardVO wardvo);	
	
}
