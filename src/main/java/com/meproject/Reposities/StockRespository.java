package com.meproject.Reposities;

import org.springframework.data.jpa.repository.JpaRepository;

import com.meproject.Entity.Stock;

public interface StockRespository extends JpaRepository<Stock,Long>{

}
