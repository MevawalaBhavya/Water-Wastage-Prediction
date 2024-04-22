package com.waterwastage.Service;

import java.util.List;

import com.waterwastage.Model.ComplaintVO;

public interface ComplainService {

	public void complainInsert(ComplaintVO complaintVO);
	
	public List userComplainSearch(ComplaintVO complaintVO);
	
	public List adminComplainSearch();
	
	public List fetchComplain(ComplaintVO complaintVO);
	
	public List getTotalComplainCount();
	
	public List getPendingComplainCount();
	
}
