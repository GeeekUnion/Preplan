package com.gsafety.plan.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PRE_PROTECTIONOBJECT")
public class ProtectionObject implements Serializable {

	private static final long serialVersionUID = 706333807288987828L;
	private int id;
	private String protectionObjectName;
	private String protectionObjectSn;
	private Double longitude; // 经度
	private Double latitude; // 纬度

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "protectionObject_name")
	public String getProtectionObjectName() {
		return protectionObjectName;
	}

	public void setProtectionObjectName(String protectionObjectName) {
		this.protectionObjectName = protectionObjectName;
	}

	@Column(name = "protectionObject_sn",unique=true)
	public String getProtectionObjectSn() {
		return protectionObjectSn;
	}

	public void setProtectionObjectSn(String protectionObjectSn) {
		this.protectionObjectSn = protectionObjectSn;
	}
	@Column(name="protectionObject_longitude",precision = 12,scale = 7)
	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	@Column(name="protectionObject_latitude",precision = 12,scale = 7)
	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

}
