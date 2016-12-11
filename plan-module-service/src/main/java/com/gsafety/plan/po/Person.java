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
  @Table(name="PRE_PERSON")
public class Person implements Serializable{
   
	  private static final long serialVersionUID = 706333807288987828L;
	  
	 private int id;
	 private String personJob; //被调动人员的职业
	 private int personNumber;
	 private String personSn;
	 
	 private Mission missionSn;
	 

	 
	 @Column(name="person_sn")
public String getPersonSn() {
		return personSn;
	}
	public void setPersonSn(String personSn) {
		this.personSn = personSn;
	}
	
	 @Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="person_job")
	public String getPersonJob() {
		return personJob;
	}
	public void setPersonJob(String personJob) {
		this.personJob = personJob;
	}
	@Column(name="person_number")
	public int getPersonNumber() {
		return personNumber;
	}
	public void setPersonNumber(int personNumber) {
		this.personNumber = personNumber;
	}
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="mission_sn",referencedColumnName="mission_sn")
	public Mission getMissionSn() {
		return missionSn;
	}
	public void setMissionSn(Mission missionSn) {
		this.missionSn = missionSn;
	}

	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
