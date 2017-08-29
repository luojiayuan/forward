package com.ntech.controller;

import com.ntech.model.Customer;
import com.ntech.model.SetMeal;
import com.ntech.service.inf.ICustomerService;
import com.ntech.service.inf.ISetMealService;
import com.ntech.util.SHAencrypt;
import com.ntech.util.VerifyCode;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;


@Controller
@RequestMapping("/customer")
public class CustomerController {

    private static final Logger logger = Logger.getLogger(CustomerController.class);

//    @Autowired
//    private HttpServletResponse response;

    @Autowired
    ICustomerService customerService;

    @Autowired
    ISetMealService setMealService;

    @RequestMapping("/register")
    public String jumpToRegister() {
        logger.info("jump to register page");
        return "register";
    }



    @RequestMapping("/check")
    @ResponseBody
    public Boolean checkUserName(@RequestParam String userName) {
        logger.info("checkLogin");
        return customerService.checkUserName(userName);
    }

    @RequestMapping("/commitReg")
    public ModelAndView register(@RequestParam("name") String name, String password, String email) {
        ModelAndView mav = new ModelAndView("msg");
        if (null == name || "".equals(name) || null == password || "".equals(password) || null == email || "".equals(email)) {
            mav.addObject("msg", "注册信息有无，请重启填写");
            return mav;
        }

        logger.info("commit register");
        Customer customer = new Customer();
        customer.setName(name);
        customer.setPassword(SHAencrypt.encryptSHA(password));
        customer.setEmail(email);
        try {
            customerService.add(customer);
        } catch (MessagingException e) {
            logger.error(e.getMessage());
            mav.addObject("msg", "注册失败");
            mav.setViewName("error");
        }
        mav.addObject("msg", "注册成功，请到邮箱激活账号");
        return mav;

    }

    //登录
    @RequestMapping("loginCheck")
    @ResponseBody
    public boolean login(String name, String password,HttpSession session) {
        logger.info("login check user:"+name);
        boolean result=false;
        result= customerService.loginCheck(name, password);
        if(result){
         session.setAttribute("name",name);
        }
        return result;
    }




    @RequestMapping("active")
    public ModelAndView activeEmail(String name, String validateCode, String email) {
        ModelAndView mav = new ModelAndView();
        if (null == name || "".equals(name) || null == validateCode || "".equals(validateCode)) {
            mav.addObject("msg", "验证信息有误，请重新注册");
            mav.setViewName("error");
            return mav;
        }
        Customer customer = customerService.findByName(name);
        if (validateCode.equals(SHAencrypt.encryptSHA(customer.getEmail()))) {
            customer.setActive(1);
            if (customerService.modify(customer) == 1) {
                logger.info(customer.getName() + "激活成功");
                mav.setViewName("msg");
                mav.addObject("msg", "激活成功<a href=\"login\">点击登录</a>");
                return mav;
            }
            ;
        }
        mav.addObject("msg", "出现未知错误");
        mav.setViewName("error");
        return mav;
    }

    @RequestMapping("verifyCode")
    public void VerifyCode(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        int width = 63;
        int height = 37;
        Random random = new Random();
        //设置response头信息
        //禁止缓存
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        //生成缓冲区image类
        BufferedImage image = new BufferedImage(width, height, 1);
        //产生image类的Graphics用于绘制操作
        Graphics g = image.getGraphics();
        //Graphics类的样式
        g.setColor(this.getRandColor(200, 250));
        g.setFont(new Font("Times New Roman", 0, 28));
        g.fillRect(0, 0, width, height);
        //绘制干扰线
        for (int i = 0; i < 40; i++) {
            g.setColor(this.getRandColor(130, 200));
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int x1 = random.nextInt(12);
            int y1 = random.nextInt(12);
            g.drawLine(x, y, x + x1, y + y1);
        }

        //绘制字符
        String strCode = "";
        for (int i = 0; i < 4; i++) {
            String rand = String.valueOf(random.nextInt(10));
            strCode = strCode + rand;
            g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
            g.drawString(rand, 13 * i + 6, 28);
        }
        //将字符保存到session中用于前端的验证

        session.setAttribute("strCode", strCode);
        logger.info(strCode);
        g.dispose();

        ImageIO.write(image, "JPEG", response.getOutputStream());
        response.getOutputStream().flush();
    }

    @RequestMapping("checkCode")
    @ResponseBody
    public boolean checkCode(HttpSession session, String authCode) {
        String preCode = (String) session.getAttribute("strCode");
        logger.info("precode" + preCode);
        logger.info("commitcode" + authCode);
        if (preCode.equalsIgnoreCase(authCode)) {
            logger.info("validate success");
            return true;
        }

        return false;

    }


    /**
     * 页面跳转控制
     * 1.个人中心
     * 2.套餐购买
     * 3.人脸探测
     * 4.人脸对比
     * 5.图库管理
     * 6.使用记录
     * 8.登录跳转
     *
     */
    //登录成功后进入主页面
    @RequestMapping("personInfo")
    public ModelAndView customerInfo(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        String name= (String) session.getAttribute("name");
        if (name==null||name.equals("")||!customerService.checkUserName(name)) {
            mav.setViewName("error");
            return mav;
        }
        mav.setViewName("info");

        return mav;
    }

    @RequestMapping("setMeal")
    public String setMealJump(){
        return "set-meal";
    }

    @RequestMapping("detect")
    public String faceDetectJump(){
        return "show-detect";
    }
    @RequestMapping("verify")
    public String faceVerifyJump(){
        return "show-verify";
    }
    @RequestMapping("gallery")
    public String galleryManageJump(HttpServletRequest request,HttpServletResponse response,HttpSession session){
        String name= (String) session.getAttribute("name");

        return "show-gallery";
    }
    @RequestMapping("record")
    public String recordLogJump(){
        return "record-log";
    }
    @RequestMapping("login")
    public String loginJump() {
        return "login";
    }





    @RequestMapping("setMealBuy")
    @ResponseBody
    public boolean setMeal(@RequestParam("name")String name,@RequestParam("type")String type,@RequestParam("value")String value){
        if(null==name||"".equals(name)||null==type||"".equals(type)||null==value||"".equals(value)){
            return false;
        }
        if(!(type.equals("date")||type.equals("times"))){
            return false;
        }
        if(customerService.checkUserName(name)){
            logger.error("username is not exist");
            return false;
        }
        int intValue= Integer.parseInt(value);
        SetMeal setMeal= new SetMeal();
        setMeal.setUserName(name);
        setMeal.setContype(type);
        setMeal.setBeginTime(new Date());
        if(type.equals("date")){
            if(intValue==1||intValue==3||intValue==6||intValue==12){
                setMeal.setEndTime(count(intValue));
            }else {
                return false;
            }
        }else{
            if(intValue==100||intValue==300||intValue==500||intValue==1000){
                setMeal.setTotalTimes(intValue);
                setMeal.setLeftTimes(intValue);
            }else{
                return false;
            }
        }
        if(setMealService.add(setMeal)){
            return true;
        }
        return false;
    }



    private Date count(int value){
        GregorianCalendar gc=new GregorianCalendar();
        gc.setTime(new Date());
        gc.add(2,value);
        return gc.getTime();
    }
    //创建颜色
    Color getRandColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255)
            fc = 255;
        if (bc > 255)
            bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }
}