package com.gsafety.plan.po;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="PRE_INVENTORY")
public class Inventory implements Serializable{
	private static final long serialVersionUID = 706333807288987828L;
	private int id;
	private String inventoryName;
	private String inventorySn;      
	private Double longitude;   //经度
    private Double latitude;    //纬度
    private String inventoryPrincipal;   //负责人
	private String inventoryPrincipalPhone;  //负责人电话
	
	private Set<Supply>supply=new HashSet<Supply>();
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	@Column(name="inventory_name")
    public String getInventoryName() {
		return inventoryName;
	}

	public void setInventoryName(String inventoryName) {
		this.inventoryName = inventoryName;
	}

	@Column(name="inventory_sn",unique=true)
	public String getInventorySn() {
		return inventorySn;
	}

	public void setInventorySn(String inventorySn) {
		this.inventorySn = inventorySn;
	}
	@Column(name="inventory_pri")
	public String getInventoryPrincipal() {
		return inventoryPrincipal;
	}

	public Double getLongitude() {
		return longitude;
	}
	@Column(name="inventory_longitude",precision = 12,scale = 7)
	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public Double getLatitude() {
		return latitude;
	}
	@Column(name="inventory_latitude",precision = 12,scale = 7)
	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public void setInventoryPrincipal(String inventoryPrincipal) {
		this.inventoryPrincipal = inventoryPrincipal;
	}
	@Column(name="inventory_priPhone")
	public String getInventoryPrincipalPhone() {
		return inventoryPrincipalPhone;
	}

	public void setInventoryPrincipalPhone(String inventoryPrincipalPhone) {
		this.inventoryPrincipalPhone = inventoryPrincipalPhone;
	}

	@OneToMany(targetEntity=Supply.class,mappedBy="inventorySnM",cascade=CascadeType.ALL)
	public Set<Supply> getSupply() {
		return supply;
	}

	public void setSupply(Set<Supply> supply) {
		this.supply = supply;
	}
	
	
 }
