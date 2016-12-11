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
	
	private Preplan preplanSn;
	private Set<Person> person=new HashSet<Person>();
	private Set<Supply> supply=new HashSet<Supply>();
	
	
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
	@OneToMany(targetEntity=Person.class,mappedBy="missionSn")
	public Set<Person> getPerson() {
		return person;
	}
	public void setPerson(Set<Person> person) {
		this.person = person;
	}
	@OneToMany(targetEntity=Supply.class,mappedBy="missionSn")
	public Set<Supply> getSupply() {
		return supply;
	}
	public void setSupply(Set<Supply> supply) {
		this.supply = supply;
	}
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="preplan_sn",referencedColumnName="preplan_sn")
	public Preplan getPreplanSn() {
		return preplanSn;
	}
	public void setPreplanSn(Preplan preplanSn) {
		this.preplanSn = preplanSn;
	}
	
	
	
	
	
	
	
	
	
}
