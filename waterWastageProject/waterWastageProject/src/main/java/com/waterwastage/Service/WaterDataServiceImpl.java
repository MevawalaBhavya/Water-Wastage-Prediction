package com.waterwastage.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.waterwastage.DAO.WaterDataDAO;
import com.waterwastage.Model.WaterDataVO;

@Service
@Transactional
public class WaterDataServiceImpl implements WaterDataService {

	@Autowired
	WaterDataDAO waterDataDAO;
	
	
	@Override
	public void waterDataInsert(WaterDataVO waterDataVO) {
		this.waterDataDAO.waterDataInsert(waterDataVO);
	}

	@Override
	public List waterDataSearch() {
		// TODO Auto-generated method stub
		return this.waterDataDAO.waterDataSearch();
	}

	
}
