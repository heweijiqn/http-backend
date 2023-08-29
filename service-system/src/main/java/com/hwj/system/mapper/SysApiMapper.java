package com.hwj.system.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hwj.model.system.SysApi;
import com.hwj.model.vo.SysApiQueryVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 接口表 Mapper 接口
 * </p>
 *
 * @author hwj
 * @since 2023-08-09
 */
@Repository
public interface SysApiMapper extends BaseMapper<SysApi> {

    IPage<SysApi> selectPage(Page<SysApi> pageParam, @Param("vo")SysApiQueryVo sysApiQueryVo);


    SysApi selectApiById(String id);



}
