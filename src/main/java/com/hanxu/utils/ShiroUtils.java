package com.hanxu.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/10/12
 */
public class ShiroUtils {

    public static String getSimpleHash(String phone,String password) {


        // 1.加密算法
        String algorithmName = "MD5";

        // 2.密码
        Object source = password;

        // 3.盐值
        Object salt = ByteSource.Util.bytes(phone); // 盐值一般是用户名或者userId

        // 4.加密次数
        int hashIterations = 1024;

        SimpleHash simpleHash = new SimpleHash(algorithmName, source, salt, hashIterations);
        return simpleHash.toString();
    }

    public static void main(String[] args) {
        System.out.println(getSimpleHash("18702598180","123456"));
    }


}
