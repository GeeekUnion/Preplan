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
	private String inventoryLongitude;   //经度
    private String inventoryLatitude;    //纬度
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

	@Column(name="inventory_sn")
	public String getInventorySn() {
		return inventorySn;
	}

	public void setInventorySn(String inventorySn) {
		this.inventorySn = inventorySn;
	}
    
	@Column(name="inventory_longitude")
	public String getInventoryLongitude() {
		return inventoryLongitude;
	}

	public void setInventoryLongitude(String inventoryLongitude) {
		this.inventoryLongitude = inventoryLongitude;
	}
	@Column(name="inventory_latitude")
	public String getInventoryLatitude() {
		return inventoryLatitude;
	}

	public void setInventoryLatitude(String inventoryLatitude) {
		this.inventoryLatitude = inventoryLatitude;
	}
	@Column(name="inventory_pri")
	public String getInventoryPrincipal() {
		return inventoryPrincipal;
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
