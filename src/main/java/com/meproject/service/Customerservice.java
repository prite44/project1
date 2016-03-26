package com.meproject.service;

import java.util.List;

import com.meproject.Entity.Customer;

public interface Customerservice {
		public boolean Save(Customer customer);
		List<Customer> findAllCustomer();
		public boolean DeleteById(long id);
		public Customer findByIdCustomer(long id);
		

}
