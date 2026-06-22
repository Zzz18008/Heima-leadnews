package com.heima.wemedia.service.impl;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.heima.model.common.dtos.ResponseResult;
import com.heima.common.utils.JWTUtil;
import com.heima.model.common.enums.AppHttpCodeEnum;
import com.heima.model.wemedia.dtos.WmLoginDto;
import com.heima.model.wemedia.pojos.WmUser;
import com.heima.wemedia.mapper.WmUserMapper;
import com.heima.wemedia.service.WmUserService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.Map;
@Slf4j
@Service
public class WmUserServiceImpl extends ServiceImpl<WmUserMapper, WmUser> implements WmUserService {
    @Override
    public ResponseResult login(WmLoginDto dto) {
        log.info("开始登录,用户名:{}", dto.getName());
        //1.检查参数
        if (StringUtils.isBlank(dto.getName()) || StringUtils.isBlank(dto.getPassword())) {
            log.error("用户名或密码为空");
            return ResponseResult.errorResult(AppHttpCodeEnum.PARAM_INVALID, "用户名或密码为空");
        }
        //2.查询用户
        log.info("查询数据库,用户名:{}, 密码:{}", dto.getName(), dto.getPassword());
        WmUser wmUser = getOne(Wrappers.<WmUser>lambdaQuery().eq(WmUser::getName, dto.getName()).eq(WmUser::getPassword, dto.getPassword()));
        if (wmUser == null) {
            log.error("用户不存在");
            return ResponseResult.errorResult(AppHttpCodeEnum.DATA_NOT_EXIST,"用户信息不存在");
        }
        log.info("用户查询成功, ID:{}", wmUser.getId());
        //3.返回JWT数据
        try {
            log.info("开始生成Token, 用户ID:{}", wmUser.getId());
            String token = JWTUtil.getToken(wmUser.getId().longValue());
            log.info("Token生成成功");
            Map<String, Object> map = new HashMap<>();
            map.put("token", token);
            wmUser.setPassword("");
            map.put("user", wmUser);
            log.info("登录成功");
            return ResponseResult.okResult(map);
        } catch (Exception e) {
            log.error("登录失败,生成Token异常", e);
            throw new RuntimeException("登录失败", e);
        }
    }
}