package com.evi.server.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.evi.server.entity.SysDept;
import org.apache.ibatis.annotations.Select;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * <p>
 * 部门 Mapper 接口
 * </p>
 *
 * @author Lenovo
 * @since 2023-05-16
 */
public interface SysDeptMapper extends BaseMapper<SysDept> {
}
