package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.domain.ProductFormDTO;
import com.theantiquersroom.myapp.mapper.ImageMapper;
import com.theantiquersroom.myapp.mapper.ProductMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@AllArgsConstructor
@Log4j2

@Service
public class ProductServiceImpl implements ProductService {

    @Setter(onMethod_= {@Autowired})
    ProductMapper mapper;
    @Setter(onMethod_={@Autowired} )
    ImageMapper imageMapper;

    // 상품등록
    @Transactional
    @Override
    public void registerProduct(ProductFormDTO product) {
        log.debug("login({}) invoked.", product);

//        this.mapper.insertProduct(product);
//        this.imageMapper.insertImage(image);
//        return true;
        this.mapper.insertSelectKey(product);

        if(product.getImageList() == null || product.getImageList().size() <= 0) {
            return;
        }
            product.getImageList().forEach(imageDTO ->{

            imageDTO.setPId(product.getPId());
            imageMapper.insertImage(imageDTO);
        });
    }

}
