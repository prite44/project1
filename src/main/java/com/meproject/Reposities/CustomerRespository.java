package com.meproject.Reposities;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.meproject.Entity.Customer;

public interface CustomerRespository extends JpaRepository<Customer,Long> {
	

}
