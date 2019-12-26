package com.hanxu.realm;




import com.hanxu.entity.User;
import com.hanxu.service.IUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author : FuHan
 * @description : ***
 * @date: 2019/9/29
 */
public class MyRealm extends AuthorizingRealm {

    @Autowired
    private IUserService userService;
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        System.out.println("授权处理");
        Set<String> permissions = new HashSet<>();
        User user = (User) principalCollection.getPrimaryPrincipal();
        if("是".equals(user.getIsadmin())){
            permissions.add("admin");
        }
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        authorizationInfo.setRoles(permissions);
        return authorizationInfo;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        System.out.println("认证处理");
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        String phone = token.getUsername();
        User user =userService.getUserByPhone(phone);
        if(user == null){
            return null;
        }
        ByteSource bytes = ByteSource.Util.bytes(phone);
        return new SimpleAuthenticationInfo(user, user.getPassword(),bytes, this.getName());

    }
}
