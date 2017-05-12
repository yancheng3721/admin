--新增菜单
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
 values(null,null,null,'/roleMenuMapping/manageRoleMenuMapping.do',nextval for s_tf_resources,'角色菜单权限管理');
--新增功能项
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='角色菜单权限管理'),null,null,'/roleMenuMapping/queryRoleMenuMapping.do',nextval for s_tf_resources,'角色菜单权限查询');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='角色菜单权限管理'),null,null,'/roleMenuMapping/saveRoleMenuMapping.do',nextval for s_tf_resources,'角色菜单权限保存');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='角色菜单权限管理'),null,null,'/roleMenuMapping/deleteRoleMenuMapping.do',nextval for s_tf_resources,'角色菜单权限删除');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='角色菜单权限管理'),null,null,'/roleMenuMapping/expandRoleMenuMapping.do',nextval for s_tf_resources,'角色菜单权限扩展');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='角色菜单权限管理'),null,null,'/roleMenuMapping/batchDeleteRoleMenuMapping.do',nextval for s_tf_resources,'角色菜单权限批量查询');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='角色菜单权限管理'),null,null,'/roleMenuMapping/uploadRoleMenuMapping.do',nextval for s_tf_resources,'角色菜单权限上传');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='角色菜单权限管理'),null,null,'/roleMenuMapping/exportRoleMenuMapping.do',nextval for s_tf_resources,'角色菜单权限导出');

--初始化ADMIN账号



insert into user_source_rel (user_code,cluster_code,rel_status) select '10000' as user_code,(select cluster_code from  tf_resources where cluster_desc='角色菜单权限管理') as cluster_code ,'1' as rel_status from (values 1) as tmp

INSERT INTO user_source_rel
    (
        user_code,cluster_code,rel_status
    )
    SELECT
        '10000' AS user_code,cluster_code ,'1' AS rel_status
    FROM tf_resources
    WHERE parent_id in
        (
        SELECT
            cluster_code
        FROM tf_resources
        WHERE cluster_desc='角色菜单权限管理'
        )
