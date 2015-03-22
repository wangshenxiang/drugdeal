package me.wsx.drugdeal.persist.model;

/**
 * Created by wangshenxiang on 15-3-19.
 */
public class Drug {
    private String id;
    private String name;
    //名称缩写(拼音的首字母大写)
    private String suoxie;
    //药品规格
    private String spec;
    private double price;
    //生产厂家
    private String product;
    //药品数量
    private int numbers;
    private String memo;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSuoxie() {
        return suoxie;
    }

    public void setSuoxie(String suoxie) {
        this.suoxie = suoxie;
    }

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public int getNumbers() {
        return numbers;
    }

    public void setNumbers(int numbers) {
        this.numbers = numbers;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
}
