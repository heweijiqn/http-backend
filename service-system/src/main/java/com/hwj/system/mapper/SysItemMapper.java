package com.hwj.system.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hwj.model.system.SysItem;
import com.hwj.model.vo.SysItemQueryVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 项目表 Mapper 接口
 * </p>
 *
 * @author hwj
 * @since 2023-08-06
 */

@Repository
public interface SysItemMapper extends BaseMapper<SysItem> {

    IPage<SysItem> selectPage(Page<SysItem> pageParam, @Param("vo")SysItemQueryVo sysItemQueryVo);

}
