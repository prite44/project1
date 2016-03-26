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
public class CustomerController {
	private java.sql.Date date = new Date(System.currentTimeMillis());
	private CustomerIservice service;
	@Autowired
	public CustomerController(CustomerIservice service) {
		this.service=service;
		// TODO Auto-generated constructor stub
	}
	@RequestMapping(value = "/customer/index")
	public String customer() {
		return "customer";
	}
	//findall data
		@RequestMapping(value = "/customer/findAll", method = RequestMethod.GET)
		public ResponseEntity<List<Customer>> findallCustomer() {
			//List<Stock> Stock =  service.findAllStock();
			List<Customer> customer = service.findAllCustomer();
			return new ResponseEntity<List<Customer>>(customer,HttpStatus.CREATED);
		}
		//create data
		@RequestMapping(value = "/customer/update/{id}", method = RequestMethod.POST)
		public ResponseEntity<Void> CreateUser(@PathVariable("id") long id,@RequestBody Customer customer) {
			Customer currenCustomer = service.findByIdCustomer(id);
			if(currenCustomer==null){
				currenCustomer.setCreate_date(date);
			service.Save(customer);
			}
			else{
				currenCustomer.setEdit_date(date);
			service.Save(customer);
			}
			
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		}
		//delete data
		@RequestMapping(value = "/customer/delete{id}", method = RequestMethod.POST)
		public ResponseEntity<Customer> deleteCustomer(@PathVariable("id") long id){
				Customer customer = service.findByIdCustomer(id);
				if(customer !=null){
				   service.DeleteById(id);
				}
				return new ResponseEntity<Customer>(HttpStatus.NO_CONTENT);
			}
		@RequestMapping(value = "/customer/create", method = RequestMethod.POST)
		public ResponseEntity<Void> CreateUser(@RequestBody Customer customer) {
			customer.setCreate_date(date);
			customer.setEdit_date(date);
			service.Save(customer);
			// headers.setLocation(ucBuilder.path("/customer/add").buildAndExpand(null));
			return new ResponseEntity<Void>(HttpStatus.CREATED);
		}
}
