package com.theantiquersroom.myapp.mapper;

import com.theantiquersroom.myapp.domain.ProductImageDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ImageMapper {

    // 상품 이미지 등록
    public Integer insertImage(ProductImageDTO image);

    // 특정 게시물 번호로 이미지파일 찾기
    public List<ProductImageDTO> findByPId(Integer pId);

    // 이미지 수정
    public Integer updateImage(ProductImageDTO image);

}
