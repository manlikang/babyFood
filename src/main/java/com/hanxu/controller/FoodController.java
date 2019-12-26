package com.hanxu.controller;

import com.hanxu.entity.BabyFood;
import com.hanxu.entity.ShopCart;
import com.hanxu.entity.TBabyFoodDetail;
import com.hanxu.entity.common.MyPage;
import com.hanxu.entity.common.Result;
import com.hanxu.entity.domain.FoodDetail;
import com.hanxu.entity.domain.FoodDomain;
import com.hanxu.service.IFoodDetailService;
import com.hanxu.service.IFoodService;
import com.sun.istack.internal.NotNull;
import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/10
 */

@Controller
@RequestMapping("food")
public class FoodController {

    @Autowired
    private IFoodService foodService;
    @Autowired
    private IFoodDetailService foodDetailService;
    @RequestMapping("list")
    public String getListByPage(MyPage<BabyFood> page, Model model){
        page = foodService.getListByPage(page);
        page.setUrl("food/list");
        model.addAttribute("pageInfo",page);
        return "back/page/goods/goodsList";
    }

    @RequestMapping("add")

    public  String add(String foodName, String foodtype, int foodPrice, String qualityTime, MultipartFile foodpic, Model model, HttpServletRequest request){



        BabyFood babyFood = new BabyFood();
        babyFood.setFoodName(foodName);
        babyFood.setFoodtype(foodtype);
        babyFood.setFoodPrice(foodPrice);
        babyFood.setQualityTime(qualityTime);
        babyFood.setFoodpic(uploadFile(request,foodpic));
        System.out.println(babyFood);



        int i = foodService.insertSelective(babyFood);
        if(i>0){

            int id = babyFood.getId();
            TBabyFoodDetail tBabyFoodDetail = new TBabyFoodDetail();
            tBabyFoodDetail.setFoodId(id);
            tBabyFoodDetail.setDetailName(foodName);
            foodDetailService.insertSelective(tBabyFoodDetail);

            model.addAttribute("msg","添加成功");
        }else{
            model.addAttribute("msg","添加失败");
        }

        return "forward:/food/list";
    }

    @RequestMapping("del/{id}")
    @ResponseBody
    public Result del(@PathVariable int id){
        System.out.println("进入");
        int i = foodService.del(id);
        Result result = new Result();

        if(i>0){
            result.setData("删除成功");
        }else{
            result.setData("删除失败");
        }
        return result;
    }

    @RequestMapping("toUpdate/{id}")
    public String toUpdate(@PathVariable int id ,Model model){
        BabyFood babyFood = foodService.selectByPrimaryKey(id);
        model.addAttribute("babyFood",babyFood);
        return "back/page/goods/goodupdate";
    }

    @RequestMapping("update")
    public String update(int id,String pic ,String foodName, String foodtype, int foodPrice, String qualityTime, MultipartFile foodpic, Model model, HttpServletRequest request){
        System.out.println("进入:"+foodpic.isEmpty());
        BabyFood babyFood = foodService.selectByPrimaryKey(id);
        babyFood.setFoodName(foodName);
        babyFood.setFoodtype(foodtype);
        babyFood.setFoodPrice(foodPrice);
        babyFood.setQualityTime(qualityTime);
        if(foodpic.isEmpty()){
            babyFood.setFoodpic(pic);
        }else{
            babyFood.setFoodpic(uploadFile(request,foodpic));
        }

        System.out.println(babyFood);

        int i = foodService.updateByPrimaryKey(babyFood);
        if(i>0){
            model.addAttribute("msg","更新成功");
        }else{
            model.addAttribute("msg","更新失败");
        }

        return "forward:/food/list";
    }


    public static String uploadFile(@NotNull HttpServletRequest request, @NotNull MultipartFile file){

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
        String res = sdf.format(new Date());

        // uploads文件夹位置
        String rootPath = request.getSession().getServletContext().getRealPath("back/style/img/");
        // 原始名称
        String originalFileName = file.getOriginalFilename();

        String newFileName = "sliver" + res + originalFileName.substring(originalFileName.lastIndexOf("."));

        File file1 = new File(rootPath,newFileName);
        if( !file1.getParentFile().exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            file1.getParentFile().mkdirs();
        }
        try {
            file.transferTo(file1);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return newFileName;
    }

    @RequestMapping("toFrontList")
    public String toFrontList(MyPage<BabyFood> page, Model model){
        page = foodService.getListByPage(page);
        page.setUrl("food/toFrontList");
        model.addAttribute("pageInfo",page);
        return "front/product";
    }

    @RequestMapping("getListByType/{type}")
    public String getListByType(MyPage<BabyFood> page,@PathVariable int type, Model model){

        page = foodService.getListByType(page,type);
        page.setUrl("food/getListByType/"+type);
        model.addAttribute("pageInfo",page);
        model.addAttribute("type",type);
        return "front/product";
    }

    @RequestMapping("serach/{foodName}")
    public String serach(@PathVariable String foodName,Model model,MyPage<BabyFood> myPage){
      myPage=  foodService.serachByName(myPage,foodName);
      myPage.setUrl("food/serach/"+foodName);
      model.addAttribute("pageInfo",myPage);
      return "front/product";
    }

    @RequestMapping("addCart/{foodId}")
    @ResponseBody
    public Result addCart(@PathVariable int foodId, Model model, HttpServletRequest request){
        ShopCart shopcart = (ShopCart) request.getSession(true).getAttribute("shopcart");
        FoodDetail foodDetail = foodDetailService.getFoodDetailByFoodId(foodId);
        model.addAttribute("foodDetail",foodDetail);
        Result result = new Result();
        if(!shopcart.isExist(foodId)) {
            BabyFood babyFood = foodService.selectByPrimaryKey(foodId);
            FoodDomain foodDomain = new FoodDomain();
            foodDomain.setId(babyFood.getId());
            foodDomain.setFoodName(babyFood.getFoodName());
            foodDomain.setFoodpic(babyFood.getFoodpic());
            foodDomain.setOrigin(babyFood.getOrigin());
            foodDomain.setFoodtype(babyFood.getFoodtype());
            foodDomain.setFoodPrice(babyFood.getFoodPrice());
            foodDomain.setIntegral(foodDetail.getIntegral());
            foodDomain.setCount(1);

            shopcart.addShopCart(foodDomain);


            request.getSession(true).setAttribute("shopcart",shopcart);

            result.setResult(true);
        }else{
            model.addAttribute("msg","该商品已在购物车");
            result.setResult(false);
        }
        return result;

    }

    @RequestMapping("addOneNum/{id}")
    @ResponseBody
    public Result addOneNum(@PathVariable int id,HttpServletRequest request){
        HttpSession session = request.getSession(true);
        ShopCart shopcart = (ShopCart) session.getAttribute("shopcart");
        boolean b = shopcart.addOneNum(id);
        Result result = new Result();
        if(b){
            result.setData("增加成功");
        }else{
            result.setData("增加失败");
        }
        return result;

    }
    @RequestMapping("reduceOneNum/{id}")
    @ResponseBody
    public Result reduceOneNum(@PathVariable int id,HttpServletRequest request){
        HttpSession session = request.getSession(true);
        ShopCart shopcart = (ShopCart) session.getAttribute("shopcart");
        boolean b = shopcart.reduceOneNum(id);
        Result result = new Result();
        if(b){
            result.setData("减少成功");
        }else{
            result.setData("减少失败");
        }
        return result;

    }

    @RequestMapping("delCart/{id}")
    @ResponseBody
    public Result delCart(@PathVariable int id,HttpServletRequest request){
        HttpSession session = request.getSession(true);
        ShopCart shopcart = (ShopCart) session.getAttribute("shopcart");
        boolean b = shopcart.removeShopcart(id);
        Result result = new Result();
        if(b){
            result.setData("删除成功");
        }else{
            result.setData("删除失败");
        }
        return result;

    }



}
