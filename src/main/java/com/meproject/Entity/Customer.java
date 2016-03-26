package com.meproject.Entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "MCUSTOMER")
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@NotNull
	@Column(nullable=false,name = "shop_name",length=50)
	private String shopname;
	@Column(nullable=false,name = "host_name",length=100)
	private String hostname;
	private String address;
	private String province;
	private String tel;
	private int level;
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

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public String getHostname() {
		return hostname;
	}

	public void setHostname(String hostname) {
		this.hostname = hostname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
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

