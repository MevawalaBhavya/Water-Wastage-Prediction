package com.waterwastage.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.waterwastage.DAO.ZoneDAO;
import com.waterwastage.Model.ZoneVO;

@Service
@Transactional
public class ZoneServiceImpl implements ZoneService {

	@Autowired
	private ZoneDAO zoneDAO;
	
	
	public void insertZone(ZoneVO zoneVO) {
		this.zoneDAO.insertZone(zoneVO);
	}


	public List searchZone() {
		
		return this.zoneDAO.searchZone();
	}

	
	public List editZone(ZoneVO zoneVO) {
		
		return this.zoneDAO.editZone(zoneVO);	
	}

}
