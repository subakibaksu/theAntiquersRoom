package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.domain.ProductCommand;
import com.theantiquersroom.myapp.domain.ProductCriteria;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.mapper.ProductMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public List<ProductDTO> listCriteria(ProductCriteria cri, ProductCommand productCommand) throws Exception {

        HashMap<Object,Object> map = new HashMap<>();
        map.put("pageStart",cri.getPageStart());
        map.put("perPageNum",cri.getPerPageNum());
        map.put("category_id",productCommand.getCategory_id());
        return mapper.listCriteria(map);

    } // listCriteria()

    @Override
    public Integer totalCount(ProductCommand productCommand) throws Exception {
        return mapper.getTotalCount(productCommand);
    } //totalCount()

    @Override
    public void destroy() throws Exception {

    } //destroy()

    @Override
    public void afterPropertiesSet() throws Exception {

    } // afterPropertiesSet()

} // end class
