package com.waterwastage.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "wastagePrediction_tbl")
public class WastagePredictionVO {

	@Id
	@Column(name = "Id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "predectionType")
	private String predectionType;

	@Column(name = "dateOfWater")
	private String dateOfWater;
	
	@Column(name = "supply")
	private long supply;
	
	@Column(name = "population")
	private long population;

	@Column(name = "usagePrediction")
	private double usagePrediction;

	@Column(name = "wastagePrediction")
	private double wastagePrediction;

	@OneToOne
	@JoinColumn(name = "zoneId")
	private ZoneVO zoneVO;
	
	@OneToOne
	@JoinColumn(name = "wardId")
	private WardVO wardVO;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPredectionType() {
		return predectionType;
	}

	public void setPredectionType(String predectionType) {
		this.predectionType = predectionType;
	}

	public String getDate() {
		return dateOfWater;
	}

	public void setDate(String date) {
		this.dateOfWater = date;
	}

	public long getSupply() {
		return supply;
	}

	public void setSupply(long supply) {
		this.supply = supply;
	}

	public long getPopulation() {
		return population;
	}

	public void setPopulation(long population) {
		this.population = population;
	}

	public double getUsagePrediction() {
		return usagePrediction;
	}

	public void setUsagePrediction(double usagePrediction) {
		this.usagePrediction = usagePrediction;
	}

	public double getWastagePrediction() {
		return wastagePrediction;
	}

	public void setWastagePrediction(double wastagePrediction) {
		this.wastagePrediction = wastagePrediction;
	}

	public ZoneVO getZoneVO() {
		return zoneVO;
	}

	public void setZoneVO(ZoneVO zoneVO) {
		this.zoneVO = zoneVO;
	}

	public WardVO getWardVO() {
		return wardVO;
	}

	public void setWardVO(WardVO wardVO) {
		this.wardVO = wardVO;
	}


}
