package com.meproject.Iservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meproject.Entity.Customer;
import com.meproject.Reposities.CustomerRespository;
import com.meproject.service.Customerservice;
@Service
public class CustomerIservice implements Customerservice{
	private CustomerRespository res;
	@Autowired
	 public CustomerIservice(CustomerRespository res) {
		 this.res=res;
	}
	@Override
	public boolean Save(Customer customer) {
		res.save(customer);
		return true;
	}
	@Override
	public List<Customer> findAllCustomer() {
		   List<Customer> customer = res.findAll();
		return customer;
	}
	@Override
	public boolean DeleteById(long id) {
			res.delete(id);
		return true;
	}
	@Override
	public Customer findByIdCustomer(long id) {
			Customer cus = res.findOne(id);
		return cus;
	}
	

}
