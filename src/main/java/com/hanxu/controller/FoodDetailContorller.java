package com.hanxu.controller;

import com.hanxu.entity.TBabyFoodDetail;
import com.hanxu.entity.common.MyPage;
import com.hanxu.entity.domain.FoodDetail;
import com.hanxu.service.IFoodDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/11
 */
@Controller
@RequestMapping("foodDetail")
public class FoodDetailContorller  {

    @Autowired
    private IFoodDetailService foodDetailService;
    @RequestMapping("list")
    public String getList(MyPage<TBabyFoodDetail> myPage , Model model){
        myPage = foodDetailService.getList(myPage);
        myPage.setUrl("foodDetail/list");
        model.addAttribute("pageInfo",myPage);
        return "back/page/good_detail/goodlist";
    }

    @RequestMapping("toUpdate/{id}")
    public String toUpdate(@PathVariable int id,Model model){
        TBabyFoodDetail tBabyFoodDetail = foodDetailService.selectByPrimaryKey(id);
        model.addAttribute("foodDetail",tBabyFoodDetail);
        return "back/page/good_detail/goodupdate";

    }

    @RequestMapping("update")
    public String update(TBabyFoodDetail tBabyFoodDetail,Model model){
        int i = foodDetailService.updateByPrimaryKeySelective(tBabyFoodDetail);

        if(i>0){
            model.addAttribute("msg","更新成功");
        }else{
            model.addAttribute("msg","更新失败");
        }

        return "forward:/foodDetail/list";
    }

    @RequestMapping("toProductinfo/{foodId}")
    public String toProductinfo(@PathVariable int foodId,Model model){
        FoodDetail foodDetail =foodDetailService.getFoodDetailByFoodId(foodId);
        model.addAttribute("foodDetail",foodDetail);
        return "front/productinfo";
    }

}
