package com.meproject.Iservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meproject.Entity.Stock;
import com.meproject.Reposities.StockRespository;
import com.meproject.service.Stockservice;
@Service
public class StockIservice implements Stockservice{
	private StockRespository res;
	@Autowired
	public StockIservice(StockRespository res){
		this.res = res;
	}
	@Override
	public boolean Save(Stock stock) {
		res.save(stock);
		return false;
	}

	@Override
	public List<Stock> findAllStock() {
		List<Stock> stock = res.findAll();
		return stock;
	}

	@Override
	public boolean DeleteById(long id) {
		res.delete(id);
		return false;
	}

	@Override
	public Stock findStockById(long id) {
		Stock stock = res.findOne(id);
		return stock;
	}
	

}
