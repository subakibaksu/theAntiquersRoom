package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.mapper.ProductMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by KBS.
 * User: KBS
 * Date: 11/14/2021
 * Time: 오전 2:42
 */
@Log4j2

@Service
public class ProductServiceImpl implements ProductService, InitializingBean, DisposableBean {

    @Setter(onMethod_= {@Autowired} )
    private ProductMapper mapper;

    @Override
    public List<ProductDTO> getProductList(String categoryId) {

        log.debug("getProductList() invoked");
        log.debug("categoryId : {}",categoryId);

        List<ProductDTO> productDTOList = new ArrayList<>();

        productDTOList.add(mapper.selectProduct(categoryId));

        productDTOList.forEach(log::debug);

        return productDTOList;

    } // getProductList()

    @Override
    public List<ProductDTO> getProductList(String categoryId, Integer mode) {

        log.debug("getProductList() invoked");
        log.debug("categoryId : {}",categoryId);

        List<ProductDTO> productDTOList = new ArrayList<ProductDTO>();

        return null;

    } // getProductList()

    @Override
    public void destroy() throws Exception {

    } //destroy()

    @Override
    public void afterPropertiesSet() throws Exception {

    } // afterPropertiesSet()

} // end class
