package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.domain.ProductImageDTO;
import com.theantiquersroom.myapp.domain.ProductFormDTO;
import com.theantiquersroom.myapp.mapper.ProductMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@AllArgsConstructor
@Log4j2

@Service
public class ProductServiceImpl implements ProductService {

    private final String PRODUCT_IMAGE_DIR = "product";

    @Setter(onMethod_= {@Autowired})
    ProductMapper mapper;
    FileUploadService uploadService;

    // 상품등록
    @Transactional
    @Override
    public void registerProduct(ProductFormDTO product) throws Exception {
        log.debug("login({}) invoked.", product);

        this.mapper.insertProduct(product);

        for (MultipartFile img: product.getImages()) {
            String url = uploadService.upload(img, PRODUCT_IMAGE_DIR);
            ProductImageDTO imageDto = new ProductImageDTO();
            imageDto.setProductId(product.getPId());
            imageDto.setImageUrl(url);
            imageDto.setImageName(img.getOriginalFilename());
            this.mapper.insertProductImage(imageDto);
        }

    }

}


// FIle[] -> AWS S3 Upload -> Image DB 넣어 -> Image ID -> ProductDB