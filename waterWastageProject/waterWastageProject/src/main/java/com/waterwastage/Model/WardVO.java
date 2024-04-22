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
@Table(name="ward_tbl")
public class WardVO {

	@Id
	@Column(name="Id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="ward_name")
	private String wardName;
	
	@Column(name="ward_description")
	private String wardDescription;
	
	@Column(name="Status")
	private boolean status=false;
	
	@JoinColumn(name="zoneId")
	@ManyToOne
	private  ZoneVO zoneVO; 
	
	
	@JoinColumn(name="areaId")
	@ManyToOne
	private  AreaVO areaVO; 
	
	public AreaVO getAreaVO() {
		return areaVO;
	}

	public void setAreaVO(AreaVO areaVO) {
		this.areaVO = areaVO;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	public ZoneVO getZoneVO() {
		return zoneVO;
	}

	public void setZoneVO(ZoneVO zoneVO) {
		this.zoneVO = zoneVO;
	}

	public String getWardName() {
		return wardName;
	}

	public void setWardName(String wardName) {
		this.wardName = wardName;
	}

	public String getWardDescription() {
		return wardDescription;
	}

	public void setWardDescription(String wardDescription) {
		this.wardDescription = wardDescription;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
	
	
}
