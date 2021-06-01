package com.Admin.LibManage.entity;

public class Lib {
    private int lib_id;
    private String goods_name;
    private String goods_type;
    private int goods_num;
    private int goods_price;
    private String goods_bzq;
    private String goods_source;
    private String goods_producer;
    public Lib(){

    }
    public Lib(String name,String type,int num ,int price,String source,String bzq,String producer){
        this.setGoods_name(name);
        this.setGoods_type(type);
        this.setGoods_num(num);
        this.setGoods_price(price);
        this.setGoods_source(source);
        this.setGoods_bzq(bzq);
        this.setGoods_producer(producer);
    }
    public int getLib_id() {
        return lib_id;
    }

    public void setLib_id(int lib_id) {
        this.lib_id = lib_id;
    }

    public String getGoods_name() {
        return goods_name;
    }

    public void setGoods_name(String goods_name) {
        this.goods_name = goods_name;
    }

    public String getGoods_type() {
        return goods_type;
    }

    public void setGoods_type(String goods_type) {
        this.goods_type = goods_type;
    }

    public int getGoods_num() {
        return goods_num;
    }

    public void setGoods_num(int goods_num) {
        this.goods_num = goods_num;
    }

    public int getGoods_price() {
        return goods_price;
    }

    public void setGoods_price(int goods_price) {
        this.goods_price = goods_price;
    }

    public String getGoods_bzq() {
        return goods_bzq;
    }

    public void setGoods_bzq(String goods_bzq) {
        this.goods_bzq = goods_bzq;
    }

    public String getGoods_source() {
        return goods_source;
    }

    public void setGoods_source(String goods_source) {
        this.goods_source = goods_source;
    }

    public String getGoods_producer() {
        return goods_producer;
    }

    public void setGoods_producer(String goods_producer) {
        this.goods_producer = goods_producer;
    }
}
