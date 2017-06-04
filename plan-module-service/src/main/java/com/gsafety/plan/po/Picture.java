package com.gsafety.plan.po;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "pre_picture")
public class Picture implements Serializable{
	private static final long serialVersionUID = 706333807288987828L;
	private int id;
	private String imgUrl;//图片链接
	private Preplan preplanSn;//预案sn  
    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column(name="img_url",length=225)
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	@OneToOne(targetEntity=Preplan.class,mappedBy="picture")
	public Preplan getPreplanSn() {
		return preplanSn;
	}
	public void setPreplanSn(Preplan preplanSn) {
		this.preplanSn = preplanSn;
	}

	
}
