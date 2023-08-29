package com.hwj.system.service;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.hwj.model.system.SysLoginLog;
import com.hwj.model.vo.SysLoginLogQueryVo;

import java.util.List;

public interface LoginLogService  {

    /*
    记录登录日志
     */
    public void recordLoginLog(String username,Integer status,
                               String ipaddr,String message);

    /*
    分页查询登录日志
     */
    IPage<SysLoginLog> selectPage(long page, long limit, SysLoginLogQueryVo sysLoginLogQueryVo);

    /*
    根据id删除登录日志
     */
    void removeById(String id);

    /*
    根据id批量删除登录日志
     */
    void removeByIds(List<Long> idList);
}
