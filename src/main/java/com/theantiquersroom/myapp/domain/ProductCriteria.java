package com.theantiquersroom.myapp.domain;


/**
 * Created by KBS.
 * User: KBS
 * Date: 11/15/2021
 * Time: 오전 12:43
 */


public class ProductCriteria {

    private int page;// 현재페이지
    private int perPageNum;// 페이지당 보여줄 페이지수

    public int getPageStart(){
        return (this.page -1) *this.perPageNum;
    }

    public ProductCriteria() {

        this.page =1;
        this.perPageNum =9;// 페이지당 기본 9개씩 출력하도록 초기화

    }


    // getter setter
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        if ( page <=0 ){

            this.page =1;

        }else{

            this.page = page;

        }
    }
    public int getPerPageNum() {

        return perPageNum;
    }
    public void setPerPageNum(int perPageNum) {
        if ( perPageNum <=0 || perPageNum >100 ) {
            this.perPageNum =10;
        }else {
            this.perPageNum = perPageNum;
        }
    }

    @Override
    public String toString() {
        return "Criteria [page=" + page +", perPageNum=" + perPageNum +"]";
    }

}