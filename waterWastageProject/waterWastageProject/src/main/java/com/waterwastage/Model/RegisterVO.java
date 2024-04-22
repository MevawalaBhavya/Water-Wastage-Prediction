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
@Table(name="register_tbl")
public class RegisterVO {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="registerId")
	private int registerId;
	
	@Column(name="firstName")
	private String firstName;

	@Column(name="mobileNumber")
	private String mobileNumber;
	
	@Column(name="address")
	private String address;

	@Column(name="Status")
	private boolean status=false;
	
	@ManyToOne 
	@JoinColumn(name="loginId")
	LoginVO loginVO;
	
	public int getRegisterId() {
		return registerId;
	}

	public void setRegisterId(int registerId) {
		this.registerId = registerId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public LoginVO getLoginVO() {
		return loginVO;
	}

	public void setLoginVO(LoginVO loginVO) {
		this.loginVO = loginVO;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
