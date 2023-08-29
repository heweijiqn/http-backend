package com.hwj.system.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hwj.model.system.SysApi;
import com.hwj.model.vo.SysApiQueryVo;
import com.hwj.system.mapper.SysApiMapper;
import com.hwj.system.service.SysApiService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 接口表 服务实现类
 * </p>
 *
 * @author hwj
 * @since 2023-08-09
 */
@Service
@Transactional
public class SysApiServiceImpl extends ServiceImpl<SysApiMapper, SysApi> implements SysApiService {

    @Override
    public IPage<SysApi> selectPage(Page<SysApi> pageParam, SysApiQueryVo sysApiQueryVo) {
        return baseMapper.selectPage(pageParam,sysApiQueryVo);
    }

    @Override
    public SysApi selectApiById(String id) {
        return baseMapper.selectApiById(id);
    }


}
