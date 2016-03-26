package com.meproject.Controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;

import com.meproject.Entity.Customer;
import com.meproject.Iservice.CustomerIservice;

/*Module Customer*/
@Controller
public class OrderController {
	private java.sql.Date date = new Date(System.currentTimeMillis());
	private CustomerIservice service;
	@Autowired
	public OrderController(CustomerIservice service) {
		this.service=service;
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value = "/order/index")
	public String customer() {
		return "order";
	}
}
