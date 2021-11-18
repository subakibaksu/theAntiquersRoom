package com.theantiquersroom.myapp.mapper;

import com.theantiquersroom.myapp.domain.BoardVO;
import com.theantiquersroom.myapp.domain.ProductImageDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ImageMapper {

    // 상품 이미지 등록
    public abstract Integer insertImage(ProductImageDTO image);
    // 이미지 삭제
    public void delete(Integer imageId);
    // 특정 게시물 번호로 이미지파일 찾기
    public abstract List<ProductImageDTO> findByPId(Integer pId);

}
