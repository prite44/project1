package com.meproject.service;

import java.util.List;

import com.meproject.Entity.Stock;

public interface Stockservice {
	public boolean Save(Stock stock);
	List<Stock> findAllStock();
	public boolean DeleteById(long id);
	public Stock findStockById(long id);
}
