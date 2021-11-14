package com.theantiquersroom.myapp.utils;

import com.theantiquersroom.myapp.domain.ProductCriteria;
import lombok.Data;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

/**
 * Created by KBS.
 * User: KBS
 * Date: 11/15/2021
 * Time: 오전 12:01
 */

@Data
public class ProductPageMaker {

    private ProductCriteria cri;

    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;

    private int displayPageNum =10;
    private int tempEndPage;


    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;

        calcData();
    }

    private void calcData() {

        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

        startPage = (endPage - displayPageNum) +1;

        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
        this.tempEndPage = tempEndPage;

        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }

        prev = startPage ==1 ?false :true;
        next = endPage * cri.getPerPageNum() >= totalCount ?false :true;

    }

    public String makeQuery(int page) {

        UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
                .queryParam("perPageNum", cri.getPerPageNum()).build();

        return uriComponents.toUriString();
    }

}

