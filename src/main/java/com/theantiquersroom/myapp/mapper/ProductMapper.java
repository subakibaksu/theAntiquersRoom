package com.theantiquersroom.myapp.mapper;


import com.theantiquersroom.myapp.domain.ProductDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ProductMapper {

    public abstract ProductDTO selectProduct(@Param("category_id") String categoryId);

}
