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
@Table(name="PRE_SUPPLY")
public class Supply implements Serializable{
	private static final long serialVersionUID = 706333807288987828L;
	private int id;
	private String supplyName; //物资名称
	private int supplyNumber;
	private String supplyUnit; //物资单位
    private String supplySn;
    private String supplyLongitude;
    private String supplyLatitude;
	private String supplyPrincipal;
	private String supplyPrincipalPhone;
    
	private Inventory inventorySnM;
	
    @Column(name="supply_sn")
	public String getSupplySn() {
		return supplySn;
	}
	public void setSupplySn(String supplySn) {
		this.supplySn = supplySn;
	}
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="supply_name")
	public String getSupplyName() {
		return supplyName;
	}
	public void setSupplyName(String supplyName) {
		this.supplyName = supplyName;
	}
	@Column(name="supply_number")
	public int getSupplyNumber() {
		return supplyNumber;
	}
	public void setSupplyNumber(int supplyNumber) {
		this.supplyNumber = supplyNumber;
	}
	@Column(name="supply_longitude")
	public String getSupplyLongitude() {
		return supplyLongitude;
	}
	public void setSupplyLongitude(String supplyLongitude) {
		this.supplyLongitude = supplyLongitude;
	}
	@Column(name="supply_latitude")
	public String getSupplyLatitude() {
		return supplyLatitude;
	}
	public void setSupplyLatitude(String supplyLatitude) {
		this.supplyLatitude = supplyLatitude;
	}
	@Column(name="supply_pri")
	public String getSupplyPrincipal() {
		return supplyPrincipal;
	}
	public void setSupplyPrincipal(String supplyPrincipal) {
		this.supplyPrincipal = supplyPrincipal;
	}
	@Column(name="supply_priphone")
	public String getSupplyPrincipalPhone() {
		return supplyPrincipalPhone;
	}
	public void setSupplyPrincipalPhone(String supplyPrincipalPhone) {
		this.supplyPrincipalPhone = supplyPrincipalPhone;
	}
	@Column(name="supply_unit")
	public String getSupplyUnit() {
		return supplyUnit;
	}
	public void setSupplyUnit(String supplyUnit) {
		this.supplyUnit = supplyUnit;
	}
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="inventory_sn",referencedColumnName="inventory_sn")
	public Inventory getInventorySnM() {
		return inventorySnM;
	}
	public void setInventorySnM(Inventory inventorySnM) {
		this.inventorySnM = inventorySnM;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
