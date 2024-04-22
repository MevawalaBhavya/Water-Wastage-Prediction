package com.waterwastage.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.waterwastage.DAO.ComplainDAO;
import com.waterwastage.Model.ComplaintVO;

@Service
@Transactional
public class ComplainServiceImpl implements ComplainService {

	@Autowired
	ComplainDAO complainDAO;
	
	@Override
	public void complainInsert(ComplaintVO complaintVO) {
		// TODO Auto-generated method stub
		this.complainDAO.complainInsert(complaintVO);
	}

	@Override
	public List userComplainSearch(ComplaintVO complaintVO) {
		// TODO Auto-generated method stub
		return this.complainDAO.searchUserComplain(complaintVO);
	}

	@Override
	public List adminComplainSearch() {
		// TODO Auto-generated method stub
		return this.complainDAO.searchAdminComplain();
	}

	@Override
	public List fetchComplain(ComplaintVO complaintVO) {
		// TODO Auto-generated method stub
		return this.complainDAO.fetchComplain(complaintVO);
	}

	@Override
	public List getTotalComplainCount() {
		// TODO Auto-generated method stub
		return this.complainDAO.getTotalComplainCount();
	}

	@Override
	public List getPendingComplainCount() {
		// TODO Auto-generated method stub
		return this.complainDAO.getPendingComplainCount();
	}
	
	

}
