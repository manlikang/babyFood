package com.hanxu.controller;

import com.hanxu.entity.Baby;
import com.hanxu.entity.common.MyPage;
import com.hanxu.entity.common.Result;
import com.hanxu.service.IBabyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/11
 */
@Controller
@RequestMapping("baby")
public class BabyController {

    @Autowired
    private IBabyService babyService;
    @RequestMapping("list")
    public String getList(Model model, MyPage<Baby> myPage){
        myPage =babyService.getList(myPage);
        myPage.setUrl("baby/list");
        model.addAttribute("pageInfo",myPage);
        return "back/page/baby/babylist";
    }

    @RequestMapping("add")
    public String add(String name, String age, MultipartFile pic , int like, HttpServletRequest request,Model model){
        String imgPic = FoodController.uploadFile(request,pic);
        Baby baby = new Baby();
        baby.setName(name);
        baby.setAge(age);
        baby.setPic(imgPic);
        baby.setLike(like);

        int i = babyService.insertSelective(baby);
        if(i>0){
            model.addAttribute("msg","添加成功");
        }else{
            model.addAttribute("msg","添加失败");
        }

        return "forward:/baby/list";
    }

    @RequestMapping("del/{id}")
    @ResponseBody
    public Result del(@PathVariable int id){
        int i = babyService.deleteByPrimaryKey(id);
        Result result = new Result();
        if(i>0){
            result.setData("删除成功");
        }else{
            result.setData("删除失败");
        }

        return result;
    }

    @RequestMapping("toUpdate/{id}")
    public String toUpdate(@PathVariable int id,Model model){
        Baby baby = babyService.selectByPrimaryKey(id);
        model.addAttribute("baby",baby);
        return "back/page/baby/babyupdate";
    }

    @RequestMapping("update")
    public String update(String name,int id, String age, MultipartFile pic , int like, HttpServletRequest request,Model model){
        Baby baby = babyService.selectByPrimaryKey(id);
        baby.setName(name);
        baby.setAge(age);
        baby.setLike(like);
        if(!pic.isEmpty()){
            baby.setPic(FoodController.uploadFile(request,pic));
        }

        int i = babyService.updateByPrimaryKeySelective(baby);
        if(i>0){
            model.addAttribute("msg","更新成功");
        }else{
            model.addAttribute("msg","更新失败");
        }

        return "forward:/baby/list";
    }

    @RequestMapping("toInteract_child")
    public String toTointeract(MyPage<Baby> myPage , Model model){
        myPage =babyService.getList(myPage);
        myPage.setUrl("baby/toInteract_child");
        model.addAttribute("pageInfo",myPage);
        return "front/interact_child";
    }

    @RequestMapping("updatelike/{id}/{num}")
    @ResponseBody
    public Result updatelike(@PathVariable int id,@PathVariable int num){
        babyService.updatelike(id,num);
        Result result = new Result();
        result.setData("操作成功");
        return result;
    }




}
