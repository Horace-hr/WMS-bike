package com.ken.wms.dao;

import com.ken.wms.domain.RolePermissionDO;

import java.util.List;

/**
 * 角色权限信息 Mapper
 *
 * 
 */
public interface RolePermissionMapper {

    List<RolePermissionDO> selectAll();
}
