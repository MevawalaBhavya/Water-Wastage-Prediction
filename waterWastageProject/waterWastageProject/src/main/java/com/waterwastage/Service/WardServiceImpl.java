package com.waterwastage.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.waterwastage.DAO.WardDAO;
import com.waterwastage.Model.WardVO;

@Service
@Transactional
public class WardServiceImpl implements WardService {

	@Autowired 
	WardDAO wardDAO;

	@Override
	public void wardInsert(WardVO wardVO) {
		// TODO Auto-generated method stub
		this.wardDAO.wardInsert(wardVO);
	}

	@Override
	public List wardSearch() {
		// TODO Auto-generated method stub
		return this.wardDAO.wardSearch();
	}

	@Override
	public List wardEdit(WardVO wardvo) {
		return this.wardDAO.wardEdit(wardvo);
	}
	
}
