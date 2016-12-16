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
    private String supplySn;
    
	
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
