package com.hwj.system.service;



import com.baomidou.mybatisplus.core.metadata.IPage;
import com.hwj.model.system.SysOperLog;
import com.hwj.model.vo.SysOperLogQueryVo;

import java.util.List;

public interface OperLogService {

    /**
     * 保存日志
     * @param sysOperLog
     */
    public void saveSysLog(SysOperLog sysOperLog);

    /**
     * 分页查询
     * @param page
     * @param limit
     * @param sysOperLogQueryVo
     * @return
     */
    IPage<SysOperLog> selectPage(Long page, Long limit, SysOperLogQueryVo sysOperLogQueryVo);

    /**
     * 根据 idList删除
     */
    void removeByIds(List<Long> idList);

    /**
     * 根据 id删除
     */
    void removeById(String id);
}
