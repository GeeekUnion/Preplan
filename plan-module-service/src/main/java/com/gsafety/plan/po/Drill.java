package com.gsafety.plan.po;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="PRE_DRILL")
public class Drill implements Serializable{
	private static final long serialVersionUID = 706333807288987828L;
	
	private int id;
	private String drillSn;
	private Timestamp  drillTime;
	private int drillNumOfParticipants;
	private String areaOrgCode;               //预案的地图编号，方便对应地区查询
	//单位怎么弄
	private String drillContent;
	private Preplan preplan;
	private String drillDepartment;                     //查询部门
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="drill_sn",unique=true,nullable=false)
	public String getDrillSn() {
		return drillSn;
	}
	public void setDrillSn(String drillSn) {
		this.drillSn = drillSn;
	}
	
	
	@Column(name="drill_numOfParticipants")
	public int getDrillNumOfParticipants() {
		return drillNumOfParticipants;
	}
	public void setDrillNumOfParticipants(int drillNumOfParticipants) {
		this.drillNumOfParticipants = drillNumOfParticipants;
	}
	@Column(name="drill_content")
	public String getDrillContent() {
		return drillContent;
	}
	public void setDrillContent(String drillContent) {
		this.drillContent = drillContent;
	}
	@OneToOne(cascade = {CascadeType.ALL})    
	@JoinColumn(name = "preplan_sn", referencedColumnName="preplan_sn")    
	public Preplan getPreplan() {
		return preplan;
	}
	public void setPreplan(Preplan preplan) {
		this.preplan = preplan;
	}
	@Column(name="drill_areaOrgCode")
	public String getAreaOrgCode() {
		return areaOrgCode;
	}
	public void setAreaOrgCode(String areaOrgCode) {
		this.areaOrgCode = areaOrgCode;
	}
	@Column(name="drill_orgName")
	public String getDrillDepartment() {
		return drillDepartment;
	}
	public void setDrillDepartment(String drillDepartment) {
		this.drillDepartment = drillDepartment;
	}
	@Column(name="drill_time")
	public Timestamp getDrillTime() {
		return drillTime;
	}
	public void setDrillTime(Timestamp drillTime) {
		this.drillTime = drillTime;
	}
	
	
	
	
	
	
	
	
}
