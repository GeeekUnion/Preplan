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
/**
 * @author Administrator
 *
 */
@Entity
@Table(name="PRE_RESOURCERECORD")
public class ResourceRecord implements Serializable{
	private static final long serialVersionUID = 706333807288987828L;
	
	private int id;
	private String resourceSn;
	private String resourceName;
	private String resourceNumber;
	
	private Mission missionSn;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="resource_sn")
	public String getResourceSn() {
		return resourceSn;
	}
	public void setResourceSn(String resourceSn) {
		this.resourceSn = resourceSn;
	}
	@Column(name="resource_name")
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	@Column(name="resource_number")
	public String getResourceNumber() {
		return resourceNumber;
	}
	public void setResourceNumber(String resourceNumber) {
		this.resourceNumber = resourceNumber;
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
