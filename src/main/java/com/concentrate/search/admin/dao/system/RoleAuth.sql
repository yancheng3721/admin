--新增菜单
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
 values(null,null,null,'/role/manageRole.do',nextval for s_tf_resources,'角色管理管理');
--新增功能项
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='角色管理管理'),null,null,'/role/queryRole.do',nextval for s_tf_resources,'角色管理查询');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='角色管理管理'),null,null,'/role/saveRole.do',nextval for s_tf_resources,'角色管理保存');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='角色管理管理'),null,null,'/role/deleteRole.do',nextval for s_tf_resources,'角色管理删除');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='角色管理管理'),null,null,'/role/expandRole.do',nextval for s_tf_resources,'角色管理扩展');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='角色管理管理'),null,null,'/role/batchDeleteRole.do',nextval for s_tf_resources,'角色管理批量查询');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='角色管理管理'),null,null,'/role/uploadRole.do',nextval for s_tf_resources,'角色管理上传');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='角色管理管理'),null,null,'/role/exportRole.do',nextval for s_tf_resources,'角色管理导出');

--初始化ADMIN账号



insert into user_source_rel (user_code,cluster_code,rel_status) select '10000' as user_code,(select cluster_code from  tf_resources where cluster_desc='角色管理管理') as cluster_code ,'1' as rel_status from (values 1) as tmp

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
        WHERE cluster_desc='角色管理管理'
        )
