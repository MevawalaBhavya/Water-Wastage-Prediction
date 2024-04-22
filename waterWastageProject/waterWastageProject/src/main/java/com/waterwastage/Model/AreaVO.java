package com.waterwastage.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="area_tbl")
public class AreaVO {

	@Id
	@Column(name="Id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
		
	@Column(name="area_name")
	private String areaName;
	
	@Column(name="area_description")
	private String areaDescription;
	
	@Column(name="Status")
	private boolean status=false;

	@ManyToOne
	@JoinColumn(name="zoneId")
	private ZoneVO zoneVO;
	
	public ZoneVO getZoneVO() {
		return zoneVO;
	}

	public void setZoneVO(ZoneVO zoneVO) {
		this.zoneVO = zoneVO;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public String getAreaDescription() {
		return areaDescription;
	}

	public void setAreaDescription(String areaDescription) {
		this.areaDescription = areaDescription;
	}
	
	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
	
}
