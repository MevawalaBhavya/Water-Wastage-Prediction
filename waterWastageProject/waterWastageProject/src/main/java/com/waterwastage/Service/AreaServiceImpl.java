package com.waterwastage.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.waterwastage.DAO.AreaDAO;
import com.waterwastage.Model.AreaVO;

@Service
@Transactional
public class AreaServiceImpl implements AreaService {

	@Autowired 
	AreaDAO areaDAO;

	@Override
	public void areaInsert(AreaVO areaVO) {
		// TODO Auto-generated method stub
		this.areaDAO.areaInsert(areaVO);
	}

	@Override
	public List areaSearch() {
		// TODO Auto-generated method stub
		return this.areaDAO.searchArea();
	}

	@Override
	public List areaEdit(AreaVO areaVO) {
		// TODO Auto-generated method stub
		return this.areaDAO.editArea(areaVO);
	}
	
}
