package com.theantiquersroom.myapp.mapper;

import com.theantiquersroom.myapp.domain.ProductFormDTO;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Log4j2
@NoArgsConstructor

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductMapperTests {


    @Setter(onMethod_= {@Autowired})
    private ProductMapper mapper;

    // 상품 등록 Test
    @Test
    public void testInsert() {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        ProductFormDTO product = new ProductFormDTO();
            product.setName("이름");
            product.setContent("내용");
            product.setCategoryId(1);
            product.setUserId("asdfasdf@gmail.com");
            product.setStartedAt(LocalDateTime.parse("2021-11-15 00:00:10", formatter));
            product.setEndedAt(LocalDateTime.parse("2021-11-16 00:00:15", formatter));
            product.setStartedPrice(5000);
            product.setBidIncrement(500);
            product.setStatus("REQUESTED");

        int affectedLines = this.mapper.inserProduct(product);
        log.info("\t+ affectedLines: {}", affectedLines);
    }
}
