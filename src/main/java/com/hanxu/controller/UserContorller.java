package com.hanxu.controller;

import cn.hutool.core.date.DateUtil;
import com.hanxu.entity.*;
import com.hanxu.entity.common.MyPage;
import com.hanxu.entity.common.Result;
import com.hanxu.entity.domain.FoodDomain;
import com.hanxu.entity.domain.OrderInfo;
import com.hanxu.service.*;
import com.hanxu.utils.ShiroUtils;
import com.hanxu.utils.Utils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.Set;


/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/10
 */

@Controller
@RequestMapping("user")
public class UserContorller {

    @Autowired
    private IUserService userService;
    @Autowired
    private IFoodService foodService;
    @Autowired
    private IAddressService addressService;
    @Autowired
    private IOrderService orderService;
    @Autowired
    private IOrderDetailService orderDetailService;
    @Autowired
    private IIntegralService iIntegralService;
    @Autowired
    private ServletContext servletContext;



    @RequestMapping("list")
    public String getListByPage(MyPage<User> page, Model model){
        page = userService.getListByPage(page);
        page.setUrl("user/list");
        model.addAttribute("pageInfo",page);
        return "back/page/user/userinfo";
    }

    @RequestMapping("del/{id}")
    @ResponseBody
    public Result delete(@PathVariable int id){
        User user =userService.selectByPrimaryKey(id);
        Map<String,String> userMap = (Map<String, String>) servletContext.getAttribute("userMap");
        int i = userService.delById(id);
        Result result = new Result();
        if(i>0){
            userMap.remove(user.getPhone());
            System.out.println(user.getPhone()+"已从userMap中移除");
            result.setResult(true);
            result.setData("删除成功");
            servletContext.setAttribute("userMap",userMap);
        }else{
            result.setResult(false);
            result.setData("删除失败");
        }
        return result;
    }
    @RequestMapping("hasPhone/{phone}")
    @ResponseBody
    public Result hasPhone(@PathVariable String phone){
        Result result = new Result();
        boolean flag = userService.hasPhone(phone);
        System.out.println(flag+"::"+phone);
        if(flag){
            result.setData("该手机号已存在，请重新输入");
        }
        result.setResult(flag);
        return result;
    }

    @RequestMapping("toUpdate/{id}")
    public String toUpdate(@PathVariable int id,Model model){
        User user = userService.selectByPrimaryKey(id);
        model.addAttribute("user",user);
        return "back/page/user/updateuser";
    }

    @RequestMapping("update")
    public String  update(User user, Model model){
        System.out.println("进入");
       User user1 = userService.selectByPrimaryKey(user.getId());
       user1.setUsername(user.getUsername());
       user1.setEmail(user.getEmail());
       user1.setSex(user.getSex());
       user1.setMemberRank(user.getMemberRank());
        int i = userService.updateByPrimaryKey(user1);

        if(i>0){
            model.addAttribute("msg","更新成功");
        }else{
            model.addAttribute("msg","更新失败");
        }

    return "forward:/user/list";
    }

    @RequestMapping("add")
    public String add(User user,Model model){
        Map<String,String> userMap = (Map<String, String>) servletContext.getAttribute("userMap");
        user.setPassword(ShiroUtils.getSimpleHash(user.getPhone(),user.getPassword()));
        int i = userService.insertSelective(user);
        if(i>0){
            userMap.put(user.getPhone(),"");
            System.out.println(user.getPhone()+"已加入userMap中");
            model.addAttribute("msg","添加成功");
            servletContext.setAttribute("userMap",userMap);
        }else{
            model.addAttribute("msg","添加失败");
        }
        return "forward:/user/list";

    }

    @RequestMapping("setAdmin/{id}")
    public String setAdmin(@PathVariable int id,Model model){
        int i = userService.setAdmin(id);
        if(i>0){
            model.addAttribute("msg","设置成功");
        }else{
            model.addAttribute("msg","设置失败");
        }

        return "forward:/user/list";
    }

    @RequestMapping("reAdmin/{id}")
    public String reAdmin(@PathVariable int id,Model model){
        int i = userService.reAdmin(id);
        if(i>0){
            model.addAttribute("msg","取消成功");
        }else{
            model.addAttribute("msg","取消失败");
        }

        return "forward:/user/list";
    }

    @RequestMapping("login")
    public String login(String phone, String password, boolean rememberMe, Model model, HttpServletRequest request){
        HttpSession session = request.getSession(true);
        Map<String,String> userMap = (Map<String, String>) servletContext.getAttribute("userMap");
        String remoteAddr = Utils.getIpAddr(request);
        List<User> userList = userService.getList();

        if(userMap.size() == 0 || userMap.size() != userList.size()){
            System.out.println("正在将所有用户添加至userMap集合，并将初始值设为''");
            for(User myuser:userList){
                userMap.put(myuser.getPhone(),"");
            }
            System.out.println("初始值设置完毕");
        }
        System.out.println("当前userMap如下");
        System.out.println("------------------------------");
        Set<Map.Entry<String,String>> entries = userMap.entrySet();
        for(Map.Entry<String,String> entry:entries){
            System.out.println(entry.getKey()+":"+entry.getValue());
        }
        System.out.println("------------------------------");
        if(!session.getId().equals(userMap.get(phone)) && !"".equals(userMap.get(phone)) && userMap.containsKey(phone)){
            model.addAttribute("msg","该用户已在其他地方登录！！！");
            return "front/login";
        }
        Subject subject = SecurityUtils.getSubject();
        if(!subject.isAuthenticated()){
            UsernamePasswordToken token = new UsernamePasswordToken(phone,password);
            token.setRememberMe(rememberMe);
            try {
                subject.login(token);
            }catch (AuthenticationException e){
                model.addAttribute("msg","用户名或密码错误");
                System.out.println("认证失败!!");
                return "front/login";
            }
        }
        User user = userService.getUserByPhone(phone);
        userMap.put(phone,session.getId());
        System.out.println("登录用户为:"+phone);
        System.out.println("用户地址为:"+remoteAddr);
        System.out.println("用户"+phone+"登录成功，当前userMap如下");
        Set<Map.Entry<String,String>> entries2 = userMap.entrySet();
        System.out.println("------------------------------");
        for(Map.Entry<String,String> entry:entries2){
            System.out.println(entry.getKey()+":"+entry.getValue());
        }
        System.out.println("------------------------------");
        servletContext.setAttribute("userMap",userMap);

        session.setAttribute("user",user);
        ShopCart shopcart = new ShopCart();
        System.out.println("购物车创建成功");
        session.setAttribute("shopcart",shopcart);
        List<BabyFood> list = foodService.getList();
        session.setAttribute("babyFoodList",list);
        return "redirect:/front/index.jsp";
    }

    @RequestMapping("myLogOut/{phone}")
    public String logout(@PathVariable String phone,HttpServletRequest request){
        Map<String,String> userMap = (Map<String, String>) servletContext.getAttribute("userMap");
        if(userMap != null){
            System.out.println(phone+"的userMap"+"设为空");
            userMap.put(phone,"");
        }

        System.out.println("退出");
        return "redirect:/user/logout";
    }

    @RequestMapping("isPhone/{phone}")
    @ResponseBody
    public Result isPhone(@PathVariable String phone){
        User user = userService.getUserByPhone(phone);
        Result result = new Result();
        if(user!=null){
            result.setResult(false);
        }else{
            result.setResult(true);
        }
        return result;
    }

    @RequestMapping("isUserName/{username}")
    @ResponseBody
    public Result isUserName(@PathVariable String username){
        int i= userService.isExist(username);
        Result result = new Result();
        if(i>0){
            result.setResult(false);
        }else{
            result.setResult(true);
        }
        return result;
    }

    @RequestMapping("register")
    @ResponseBody
    public Result register(User user){
        System.out.println(user);
        user.setPassword(ShiroUtils.getSimpleHash(user.getPhone(),user.getPassword()));
        int i = userService.insertSelective(user);
        Result result = new Result();
        if(i>0){
            Map<String,String> userMap = (Map<String, String>) servletContext.getAttribute("userMap");
            userMap.put(user.getPhone(),"");
            servletContext.setAttribute("userMap",userMap);
            result.setResult(true);
        }else{
            result.setResult(false);
        }
        return  result;
    }

    @RequestMapping("toMember/{id}/{menuId}")
    public String toMember(@PathVariable int id,@PathVariable int menuId,MyPage<TOrderDetail> orderDetailPage,MyPage<TIntegral> integralPage, Model model){
        //System.out.println(id);
        User user = userService.selectByPrimaryKey(id);
        integralPage = iIntegralService.getListByUserId(id,integralPage);
        orderDetailPage = orderDetailService.getListByUserId(id,orderDetailPage);
        List<Address> addresses= addressService.getListByUserIdNoPage(id);
        integralPage.setUrl("user/toMember/"+id+"/3");
        orderDetailPage.setUrl("user/toMember/"+id+"/4");
        model.addAttribute("addresses",addresses);
        model.addAttribute("orderDetails",orderDetailPage);
        model.addAttribute("integrals",integralPage);
        model.addAttribute("user",user);
        model.addAttribute("menuId",menuId);
        return "front/member";
    }

    @RequestMapping("frontUpdate")
    public String frontUpdate(User user,HttpServletRequest request,Model model){

        userService.updateByPrimaryKeySelective(user);
        user = userService.selectByPrimaryKey(user.getId());
        request.getSession(true).setAttribute("user",user);
        model.addAttribute("msg","更新成功");
        return "forward:/user/toMember/"+user.getId()+"/2";
    }

    @RequestMapping("updateImg")
    public String updateImg(int id, MultipartFile file, HttpServletRequest request,Model model){
        User user = new User();
        System.out.println(file);
        user.setId(id);
        user.setPicPath(FoodController.uploadFile(request,file));
        userService.updateByPrimaryKeySelective(user);
        user = userService.selectByPrimaryKey(user.getId());
        request.getSession(true).setAttribute("user",user);
        model.addAttribute("msg","更新成功");
        return "forward:/user/toMember/"+id+"/2";
    }

    @RequestMapping("toJieSuan/{id}")
    public String toJieSuan(@PathVariable int id,Model model){
        List<Address> addresses =addressService.getListByUserIdNoPage(id);
        User user = userService.selectByPrimaryKey(id);
        for(Address address:addresses) {
            if("是".equals(address.getIsdefault())) {
                model.addAttribute("defalutAddress",address);
                break;
            }
        }
        model.addAttribute("user",user);
        model.addAttribute("addresses",addresses);
        System.out.println(addresses);
        return "front/pay";
    }

    @RequestMapping("addAddress/{id}")
    public String addAddress(@PathVariable int id,Address address){
        address.setUserid(id);
        addressService.insertSelective(address);

        return "redirect:/user/toJieSuan/"+id;
    }

    @RequestMapping("addAddress2/{id}")
    public String addAddress2(@PathVariable int id,Address address){
        address.setUserid(id);
        addressService.insertSelective(address);
        return "redirect:/user/toMember/"+id+"/5";
    }

    @RequestMapping("removeAddress/{id}")
    @ResponseBody
    public Result removeAddress(@PathVariable int id){
        addressService.deleteByPrimaryKey(id);
        Result result = new Result();
        result.setResult(true);
        return result;
    }

    @RequestMapping("toUpdateAddress/{id}")
    public String toUpdateAddress(@PathVariable int id,Model model){
        Address address = addressService.selectByPrimaryKey(id);
        model.addAttribute("address",address);
        return "front/updateAddress";
    }

    @RequestMapping("toUpdateAddress2/{id}")
    public String toUpdateAddress2(@PathVariable int id,Model model){
        Address address = addressService.selectByPrimaryKey(id);
        model.addAttribute("address",address);
        return "front/updateAddress2";
    }

    @RequestMapping("updateAddress")
    public String updateAddress(Address address){
        addressService.updateByPrimaryKeySelective(address);
        return "redirect:/user/toJieSuan/"+address.getUserid();
    }
    @RequestMapping("updateAddress2")
    public String updateAddress2(Address address){
        addressService.updateByPrimaryKeySelective(address);
        return "redirect:/user/toMember/"+address.getUserid()+"/5";
    }

    @RequestMapping("pay")
    @ResponseBody
    public Result pay(@RequestBody OrderInfo orderInfo,HttpServletRequest request){
        HttpSession session = request.getSession(true);
        ShopCart shopcart = (ShopCart) session.getAttribute("shopcart");
        int userId = orderInfo.getUserId();

        //积分信息
        TIntegral integral = new TIntegral();
        integral.setUserid(userId);
        if(orderInfo.getGetIntegral() == 0){
            integral.setDetailed("商品抵扣");
            integral.setUsefulness("-"+orderInfo.getIntegralDikou()*100);
            integral.setSurplus((userService.selectByPrimaryKey(userId).getIntegral()-(int)(orderInfo.getIntegralDikou()*100))+"");
            userService.reduceIntegral((int)orderInfo.getIntegralDikou()*100,userId);
        }else{
            integral.setDetailed("全额付款获得");
            integral.setUsefulness("+"+orderInfo.getGetIntegral());
            integral.setSurplus((userService.selectByPrimaryKey(userId).getIntegral()+(orderInfo.getGetIntegral())+""));
            userService.addIntegral(orderInfo.getGetIntegral(),userId);
        }

        int i = iIntegralService.insertSelective(integral);

        //订单信息
        TOrder order = new TOrder();
        order.setUserid(userId);
        order.setOrderdate(DateUtil.date());
        order.setPaycount(orderInfo.getInfactPay());
        order.setPaytype(orderInfo.getPayMethod());
        order.setSendtype(orderInfo.getExpress());
        order.setShaddress(orderInfo.getAddress());
        order.setShperson(orderInfo.getShouhuoren());
        order.setShphone(orderInfo.getPhone());
        int i1 = orderService.insertSelective(order);

        int flag ;
        int i3=0;
        //订单详情表
        List<FoodDomain> shopCart = shopcart.getShopCart();
        for(FoodDomain domain:shopCart){
            TOrderDetail orderDetail = new TOrderDetail();
            orderDetail.setFoodid(domain.getId());
            orderDetail.setOrderid(order.getId());
            orderDetail.setFoodname(domain.getFoodName());
            orderDetail.setFoodnum(domain.getCount());
            orderDetail.setFoodpic(domain.getFoodpic());
            orderDetail.setFoodprice((double)domain.getFoodPrice());
            orderDetail.setFoodTotalPrice((double) (domain.getFoodPrice()*domain.getCount()));
            orderDetail.setOrderdate(DateUtil.date());
            flag = orderDetailService.insertSelective(orderDetail);
            if(flag>0){
                i3++;
            }
        }


        System.out.println(orderInfo);
        System.out.println("i:"+i+",i1:"+i1+",shopcart.size():"+shopCart.size()+",i3:"+i3);
        Result result = new Result();
        if(i>0 && i1>0 && i3==shopCart.size()){
            result.setResult(true);
        }else{
            result.setResult(false);
        }
        shopcart.removeAll();
        return result;
    }

    @RequestMapping("toSuccess/{money}/{shouhuoren}/{phone}/{address}")
    public String toSuccess(@PathVariable double money,@PathVariable String shouhuoren,@PathVariable String phone,@PathVariable String address,Model model){
        model.addAttribute("money",money);
        model.addAttribute("shouhuoren",shouhuoren);
        model.addAttribute("phone",phone);
        model.addAttribute("address",address);
        return "front/success";
    }

    @RequestMapping("setDefault/{id}/{userId}")
    @ResponseBody
    public Result setDefault(@PathVariable int id,@PathVariable int userId){
        int i =addressService.updateDefult("否",userId);
        Address address = new Address();
        address.setIsdefault("是");
        address.setId(id);
        addressService.updateByPrimaryKeySelective(address);
        Result result = new Result();
        result.setData("成功");
        result.setResult(true);
        return result;
    }

    @RequestMapping("checkPassword/{userId}/{password}")
    @ResponseBody
    public Result checkPassword(@PathVariable int userId,@PathVariable String password){
        Result result = new Result();
        User user =userService.selectByPrimaryKey(userId);
        String simpleHash = ShiroUtils.getSimpleHash(user.getPhone(), password);
        if(simpleHash.equals(user.getPassword())){
            result.setResult(true);
            result.setData("<font color='green'>正确</font>");
        }else{
            result.setResult(false);
            result.setData("<font color='red'>密码错误</font>");
        }
        return result;
    }

    @RequestMapping("updatePassword/{userId}/{password}")
    @ResponseBody
    public Result updatePassword(@PathVariable int userId,@PathVariable String password){
        User user =userService.selectByPrimaryKey(userId);
        user.setPassword(ShiroUtils.getSimpleHash(user.getPhone(),password));
        int i = userService.updateByPrimaryKeySelective(user);
        Result result = new Result();
        if(i>0){
            result.setResult(true);
        }else{
            result.setResult(false);
        }
        return result;
    }

    @RequestMapping("batchDel")
    @ResponseBody
    public Result batchDel(@RequestParam(value = "ids") List<Integer> ids){
        Result result = new Result();
        Map<String,String> userMap = (Map<String, String>) servletContext.getAttribute("userMap");
        List<String> phones = userService.getPhoneListById(ids);
        int i =userService.batchDel(ids);
        if(i>0){
            for(String phone:phones){
                userMap.remove(phone);
                System.out.println(phone+"已从userMap移除");
            }
            servletContext.setAttribute("userMap",userMap);
            result.setResult(true);
        }else{
            result.setResult(false);
        }
        return result;
    }

}
