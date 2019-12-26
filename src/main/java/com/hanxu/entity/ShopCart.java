package com.hanxu.entity;

import com.hanxu.entity.domain.FoodDomain;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/14
 */
@Data
public class ShopCart {

    private  List<FoodDomain> shopCart = new ArrayList<>();

    public void addShopCart(FoodDomain foodDomain){
        shopCart.add(foodDomain);
    }

    public boolean isExist(int foodId){
        for(FoodDomain domain:shopCart){
            if(foodId == domain.getId()){
                return  true;
            }
        }
        return false;
    }

    public boolean removeShopcart(int id){
        for(FoodDomain domain:shopCart){
            if(id == domain.getId()){
                shopCart.remove(domain);
                return true;
            }
        }
        return false;
    }

    public boolean addOneNum(int id){
        for(FoodDomain domain:shopCart){
            if(id == domain.getId()){
                domain.setCount(domain.getCount()+1);
                return true;
            }
        }
        return false;
    }

    public boolean reduceOneNum(int id){
        for(FoodDomain domain:shopCart){
            if(id == domain.getId()){
                domain.setCount(domain.getCount()-1);
                return true;
            }
        }
        return false;
    }

    public void removeAll(){
        shopCart = new ArrayList<>();
    }


}
