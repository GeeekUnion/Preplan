package com.gsafety.plan.po;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="PRE_HAZARD")
public class Hazard implements Serializable{
	private static final long serialVersionUID = 706333807288987828L;
	private int id;
	private String hazardSn;
	private String hazardName;
	private Double longitude;   //经度
    private Double latitude;    //纬度
    private String principal;   //负责人
   	private String principalPhone;  //负责人电话
    private String iType;                     //用来在地图中区别于其他点的标记
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="hazard_sn",unique=true,nullable=false)
	public String getHazardSn() {
		return hazardSn;
	}
	public void setHazardSn(String hazardSn) {
		this.hazardSn = hazardSn;
	}
	@Column(name="hazard_name",nullable=false)
	public String getHazardName() {
		return hazardName;
	}
	public void setHazardName(String hazardName) {
		this.hazardName = hazardName;
	}
	
	@Column(name="hazard_longitude",nullable=false)
	public Double getLongitude() {
		return longitude;
	}
	public void setLongitude(Double longitude) {
		longitude = longitude;
	}
	@Column(name="hazard_latitude",nullable=false)
	public Double getLatitude() {
		return latitude;
	}
	public void setLatitude(Double latitude) {
		latitude = latitude;
	}
	@Column(name="hazard_iType")
	public String getiType() {
		return iType;
	}
	public void setiType(String iType) {
		this.iType = iType;
	}
	@Column(name="hazard_principal")
	public String getPrincipal() {
		return principal;
	}
	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	@Column(name="hazard_principalPhone")
	public String getPrincipalPhone() {
		return principalPhone;
	}
	public void setPrincipalPhone(String principalPhone) {
		this.principalPhone = principalPhone;
	}

    
    
}
