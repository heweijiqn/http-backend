package com.hwj.system.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hwj.model.system.SysMock;
import com.hwj.model.vo.SysMockQueryVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 模拟数据表 Mapper 接口
 * </p>
 *
 * @author hwj
 * @since 2023-08-24
 */

@Repository
public interface SysMockMapper extends BaseMapper<SysMock> {

    IPage<SysMock> selectPage(Page<SysMock> pageParam,@Param("vo") SysMockQueryVo sysMockQueryVo);

    SysMock selectMockDataByApiName(String apiName);

}
