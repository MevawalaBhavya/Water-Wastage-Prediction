package com.waterwastage.Service;

import java.util.List;

import com.waterwastage.Model.ZoneVO;

public interface ZoneService {

	public void insertZone(ZoneVO zoneVO);
	
	public List searchZone();
	
	public List editZone(ZoneVO zoneVO);
}
