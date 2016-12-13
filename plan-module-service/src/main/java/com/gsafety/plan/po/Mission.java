package com.gsafety.plan.po;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

    @Entity
    @Table(name="pre_mission")
public class Mission implements Serializable{
	private static final long serialVersionUID = 706333807288987828L;

	
	private int id;
	private String missionSn;           //任务编号
	private String missionMethod;       //对应方法
	private String responDept;          //负责部门，暂无对应表
	private String responPerson;        //负责人，暂无对应表
	private int personNumber;           //
	private int supplyNumber;             
	private String missionStatus;      //任务完成状态                     1代表完成，0代表否
	private String missionDefault;      //任务是否默认被加入预案  1代表是，0代表否   
	
	private Preplan preplanSn;
	private Set<PersonRecord> personRecord=new HashSet<PersonRecord>();    //
	private Set<SupplyRecord> supplyRecord=new HashSet<SupplyRecord>();    //
	
	
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="mission_sn",unique=true)
	public String getMissionSn() {
		return missionSn;
	}
	public void setMissionSn(String missionSn) {
		this.missionSn = missionSn;
	}
	@Column(name="mission_method")
	public String getMissionMethod() {
		return missionMethod;
	}
	public void setMissionMethod(String missionMethod) {
		this.missionMethod = missionMethod;
	}
	@Column(name="respon_dept")
	public String getResponDept() {
		return responDept;
	}
	public void setResponDept(String responDept) {
		this.responDept = responDept;
	}
	@Column(name="respon_person")
	public String getResponPerson() {
		return responPerson;
	}
	public void setResponPerson(String responPerson) {
		this.responPerson = responPerson;
	}
	@Column(name="mission_person_number")
	public int getPersonNumber() {
		return personNumber;
	}
	public void setPersonNumber(int personNumber) {
		this.personNumber = personNumber;
	}
	@Column(name="mission_supply_number")
	public int getSupplyNumber() {
		return supplyNumber;
	}
	public void setSupplyNumber(int supplyNumber) {
		this.supplyNumber = supplyNumber;
	}
	@OneToMany(targetEntity=PersonRecord.class,mappedBy="missionSn")
	public Set<PersonRecord> getPersonRecord() {
		return personRecord;
	}
	public void setPersonRecord(Set<PersonRecord> personRecord) {
		this.personRecord = personRecord;
	}
	@OneToMany(targetEntity=SupplyRecord.class,mappedBy="missionSn")
	public Set<SupplyRecord> getSupplyRecord() {
		return supplyRecord;
	}
	public void setSupplyRecord(Set<SupplyRecord> supplyRecord) {
		this.supplyRecord = supplyRecord;
	}
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="preplan_sn",referencedColumnName="preplan_sn")
	public Preplan getPreplanSn() {
		return preplanSn;
	}
	public void setPreplanSn(Preplan preplanSn) {
		this.preplanSn = preplanSn;
	}
	@Column(name="mission_status")
	public String getMissionStatus() {
		return missionStatus;
	}
	public void setMissionStatus(String missionStatus) {
		this.missionStatus = missionStatus;
	}
	@Column(name="mission_default")
	public String getMissionDefault() {
		return missionDefault;
	}
	public void setMissionDefault(String missionDefault) {
		this.missionDefault = missionDefault;
	}
	
	
	
	
	
	
	
	
	
	
	
}
