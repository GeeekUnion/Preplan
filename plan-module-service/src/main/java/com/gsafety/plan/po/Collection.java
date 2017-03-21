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
@Table(name="PRE_COLLECTION")
public class Collection implements Serializable{
	private static final long serialVersionUID = 706333807288987828L;
	
	private int id;
	private String collectionSn;
	//private Preplan coPreplan;   //收藏
	private User username;
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="collection_sn",unique=true,nullable=true)
	public String getCollectionSn() {
		return collectionSn;
	}
	public void setCollectionSn(String collectionSn) {
		this.collectionSn = collectionSn;
	}
//	public Preplan getCoPreplan() {
//		return coPreplan;
//	}
//	public void setCoPreplan(Preplan coPreplan) {
//		this.coPreplan = coPreplan;
//	}
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="username",referencedColumnName="username")
	public User getUsername() {
		return username;
	}
	public void setUsername(User username) {
		this.username = username;
	}
	
	
	

}
