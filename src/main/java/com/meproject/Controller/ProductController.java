package com.meproject.Controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;

import com.meproject.Entity.Customer;
import com.meproject.Entity.Stock;
import com.meproject.Iservice.StockIservice;
import java.sql.Date;
@Controller
public class ProductController {
	private java.sql.Date date = new Date(System.currentTimeMillis());
	private StockIservice service;
	@Autowired
	public ProductController(StockIservice service) {
		this.service=service;
	}
	@RequestMapping(value="/Stock/index")
	public String productindex(){
		return "stock";
	}
	//findall data
	@RequestMapping(value = "/stock/findAll", method = RequestMethod.GET)
	public ResponseEntity<List<Stock>> findallCustomer() {
		List<Stock> Stock =  service.findAllStock();
		return new ResponseEntity<List<Stock>>(Stock,HttpStatus.CREATED);
	}
	//create data
	@RequestMapping(value = "/stock/update/{id}", method = RequestMethod.POST)
	public ResponseEntity<Void> CreateUser(@PathVariable("id") long id,@RequestBody Stock stock) {
		Stock currenStock = service.findStockById(id);
		if(currenStock==null){
		stock.setCreate_date(date);
		service.Save(stock);
		}
		else{
		stock.setEdit_date(date);
		service.Save(stock);
		}
		
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}
	//delete data
	@RequestMapping(value = "/stock/delete{id}", method = RequestMethod.POST)
	public ResponseEntity<Stock> deleteCustomer(@PathVariable("id") long id){
			Stock stock = service.findStockById(id);
			if(stock !=null){
			   service.DeleteById(id);
			}
			return new ResponseEntity<Stock>(HttpStatus.NO_CONTENT);
		}
	@RequestMapping(value = "/stock/create", method = RequestMethod.POST)
	public ResponseEntity<Void> CreateUser(@RequestBody Stock stock) {
		stock.setCreate_date(date);
		stock.setEdit_date(date);
		service.Save(stock);
		// headers.setLocation(ucBuilder.path("/customer/add").buildAndExpand(null));
		return new ResponseEntity<Void>(HttpStatus.CREATED);
	}
}
