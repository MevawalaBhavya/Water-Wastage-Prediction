package com.waterwastage.Service;


import java.util.List;

import com.waterwastage.Model.WardVO;


public interface WardService {

	public void wardInsert(WardVO wardvo);
	
	public List wardSearch();
	
	public List wardEdit(WardVO wardvo);
	
}
