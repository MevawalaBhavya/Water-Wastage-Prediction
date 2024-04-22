package com.waterwastage.DAO;

import java.util.List;

import com.waterwastage.Model.ComplaintVO;


public interface ComplainDAO {

	public void complainInsert(ComplaintVO complaintVO);
	
	public List searchUserComplain(ComplaintVO complaintVO);
	
	public List searchAdminComplain();
	
	public List fetchComplain(ComplaintVO complaintVO);
	
	public List getTotalComplainCount();
	
	public List getPendingComplainCount();
}
