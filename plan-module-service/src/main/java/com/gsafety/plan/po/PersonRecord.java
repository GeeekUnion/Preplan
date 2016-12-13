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
  @Table(name="PRE_PERSONRECORD")
public class PersonRecord implements Serializable{
   
	  private static final long serialVersionUID = 706333807288987828L;
	  
	 private int id;
	 private String personJobR; //被调动人员的职业
	 private int personNumberR;  

	 
	 private Mission missionSn;
	 

	 

	
	 @Id
	 @GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="person_jobr")
	public void setPersonJobR(String personJobR) {
		this.personJobR = personJobR;
	}
	public int getPersonNumberR() {
		return personNumberR;
	}
	@Column(name="person_numberr")
	public void setPersonNumberR(int personNumberR) {
		this.personNumberR = personNumberR;
	}
	public void setMissionSn(Mission missionSn) {
		this.missionSn = missionSn;
	}

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="mission_sn",referencedColumnName="mission_sn")
	public Mission getMissionSn() {
		return missionSn;
	}
	public String getPersonJobR() {
		return personJobR;
	}
	
	
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
