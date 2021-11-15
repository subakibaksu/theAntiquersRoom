package com.theantiquersroom.myapp.mapper;


import com.theantiquersroom.myapp.domain.ProductCommand;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.domain.ProductFormDTO;
import org.apache.ibatis.annotations.Mapper;


import java.util.HashMap;
import java.util.List;



@Mapper
public interface ProductMapper {

    //상품등록
    public abstract Integer insertProduct(ProductFormDTO product);

    // 페이징 처리를 위한 메서드
    public List<ProductDTO> listCriteria(HashMap<Object,Object> map)throws Exception;

    // 전체 게시글 수 구하기
    public Integer getTotalCount(ProductCommand productCommand)throws Exception;


}
