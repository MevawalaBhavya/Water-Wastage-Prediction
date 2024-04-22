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
@Table(name="waterData_tbl")
public class WaterDataVO {

	@Id
	@Column(name="Id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	
	@ManyToOne
	@JoinColumn(name="zoneId")
	private ZoneVO zoneVO;
	
	@ManyToOne
	@JoinColumn(name="areaId")
	private AreaVO areaVO;
	
	@ManyToOne
	@JoinColumn(name="wardId")
	private WardVO wardVO;

	@Column(name="Status")
	private boolean status=false;

	@Column(name="fileName")
	private String fileName;
	
	@Column(name="filePath")
	private String filePath;

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

	public AreaVO getAreaVO() {
		return areaVO;
	}
	
	public void setAreaVO(AreaVO areaVO) {
		this.areaVO = areaVO;
	}

	public WardVO getWardVO() {
		return wardVO;
	}

	public void setWardVO(WardVO wardVO) {
		this.wardVO = wardVO;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	
	
}
