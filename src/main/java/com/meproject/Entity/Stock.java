package com.meproject.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "MSTOCK")
public class Stock {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@Column(nullable=false,name = "tname",length=50)
	private String name;
	@Column(nullable=false,name = "quantity",length=50)
	private int quality;
	private double price1;
	private double price2;
	private double price3;
	@Column(nullable=false,name = "create_date",columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private java.sql.Date  create_date;
	@Column(nullable=false,name = "edit_date",columnDefinition = "DATE DEFAULT CURRENT_DATE")
	private java.sql.Date  edit_date;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuality() {
		return quality;
	}
	public void setQuality(int quality) {
		this.quality = quality;
	}
	public double getPrice1() {
		return price1;
	}
	public void setPrice1(double price1) {
		this.price1 = price1;
	}
	public double getPrice2() {
		return price2;
	}
	public void setPrice2(double price2) {
		this.price2 = price2;
	}
	public double getPrice3() {
		return price3;
	}
	public void setPrice3(double price3) {
		this.price3 = price3;
	}
	public java.sql.Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(java.sql.Date create_date) {
		this.create_date = create_date;
	}
	public java.sql.Date getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(java.sql.Date edit_date) {
		this.edit_date = edit_date;
	}
	
}
