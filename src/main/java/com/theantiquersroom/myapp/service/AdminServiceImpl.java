package com.theantiquersroom.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theantiquersroom.myapp.domain.MypageCriteria;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@AllArgsConstructor

@Service
public class AdminServiceImpl implements AdminService {
	
	@Setter(onMethod_= {@Autowired})
	AdminMapper mapper;

	@Override
	public List<ProductDTO> getRequestedList(MypageCriteria cri) {
		log.debug("getRequestedList({}) invoked.",cri);
		
		List<ProductDTO> list=this.mapper.getRequestedList(cri);
		log.info("\t+ list size: {}", list.size());
		
		return list;
	}//getRequestedList

	@Override
	public Integer getRequestedListTotal() {
		log.debug("getRequestedListTotal({}) invoked.");

		return this.mapper.getRequestedListTotal();
	}//getRequestedListTotal

	@Override
	public Boolean modifyStatus(Integer pId) {
		log.debug("modifyStatus({}) invoked.", pId);
		
		int affectedRows=this.mapper.updateStatus(pId);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows>0;
	}

	@Override
	public Boolean rejectRequest(Integer pId) {
		log.debug("rejectRequest({}) invoked.", pId);
		
		int affectedRows=this.mapper.rejectRequest(pId);
		log.info("\t+ affectedRows: {}", affectedRows);
		
		return affectedRows>0;
	}//modifyStatus

	@Override
	public List<ProductDTO> getOnSaleProductList(MypageCriteria cri) {
		log.debug("getOnSaleProductList({}) invoked.",cri);
		
		List<ProductDTO> list=this.mapper.getOnSaleProductList(cri);
		log.info("\t+ list size: {}", list.size());
		
		return list;
	}//getOnSaleProductList

	@Override
	public Integer getOnSaleTotal() {
		log.debug("getOnSaleTotal({}) invoked.");

		return this.mapper.getOnSaleTotal();
	}//getOnSaleTotal

}//end class
