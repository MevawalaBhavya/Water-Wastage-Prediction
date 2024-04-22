package com.waterwastage.DAO;

import java.util.List;

import com.waterwastage.Model.ZoneVO;

public interface ZoneDAO {

	public void insertZone(ZoneVO zoneVO);
	
	public List searchZone();
	
	public List editZone(ZoneVO zoneVO);
	
}
