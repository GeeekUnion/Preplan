package com.gsafety.plan.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name="PRE_SUPPLYRECORD")
public class SupplyRecord implements Serializable{
	private static final long serialVersionUID = 706333807288987828L;
	private int id;
	private String supplyNameR; //物资名称
	private int supplyNumberR;

	

	private Mission missionSn;
	
	
	

	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="supply_namer")
	public void setSupplyNameR(String supplyNameR) {
		this.supplyNameR = supplyNameR;
	}
	public int getSupplyNumberR() {
		return supplyNumberR;
	}
	@Column(name="supply_numberr")
	public void setSupplyNumberR(int supplyNumberR) {
		this.supplyNumberR = supplyNumberR;
	}
	public void setMissionSn(Mission missionSn) {
		this.missionSn = missionSn;
	}
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="mission_sn",referencedColumnName="mission_sn")
	public Mission getMissionSn() {
		return missionSn;
	}
	public String getSupplyNameR() {
		return supplyNameR;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
