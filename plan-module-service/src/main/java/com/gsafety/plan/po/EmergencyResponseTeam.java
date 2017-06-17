package com.gsafety.plan.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PRE_EMERGENCYRESPONSETEAM")
public class EmergencyResponseTeam implements Serializable {
	private static final long serialVersionUID = 706333807288987828L;
	private int id;
	private String EmergencyResponseTeamName;
	private String EmergencyResponseTeamSn;
	private Double longitude; // 经度
	private Double latitude; // 纬度
    private String principal;   //负责人
	private String principalPhone;  //负责人电话
	private String iType;                     //用来在地图中区别于其他点的标记
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	@Column(name = "emergencyResponseTeam_name")
	public String getEmergencyResponseTeamName() {
		return EmergencyResponseTeamName;
	}

	public void setEmergencyResponseTeamName(String emergencyResponseTeamName) {
		EmergencyResponseTeamName = emergencyResponseTeamName;
	}
	@Column(name = "emergencyResponseTeam_sn",unique=true)
	public String getEmergencyResponseTeamSn() {
		return EmergencyResponseTeamSn;
	}

	public void setEmergencyResponseTeamSn(String emergencyResponseTeamSn) {
		EmergencyResponseTeamSn = emergencyResponseTeamSn;
	}
	@Column(name="emergencyResponseTeam_longitude",precision = 12,scale = 7)
	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}
	@Column(name="emergencyResponseTeam_latitude",precision = 12,scale = 7)
	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}
	@Column(name="emergencyResponseTeam_iType")
	public String getiType() {
		return iType;
	}

	public void setiType(String iType) {
		this.iType = iType;
	}
	@Column(name="emergencyResponseTeam_principal")
	public String getPrincipal() {
		return principal;
	}
	public void setPrincipal(String principal) {
		this.principal = principal;
	}
	@Column(name="emergencyResponseTeam_principalPhone")
	public String getPrincipalPhone() {
		return principalPhone;
	}
	public void setPrincipalPhone(String principalPhone) {
		this.principalPhone = principalPhone;
	}
}
