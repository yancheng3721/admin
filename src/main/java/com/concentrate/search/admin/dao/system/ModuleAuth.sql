--新增菜单
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
 values(null,null,null,'/module/manageModule.do',nextval for s_tf_resources,'模块管理');
--新增功能项
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='模块管理'),null,null,'/module/queryModule.do',nextval for s_tf_resources,'模块查询');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='模块管理'),null,null,'/module/saveModule.do',nextval for s_tf_resources,'模块保存');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='模块管理'),null,null,'/module/deleteModule.do',nextval for s_tf_resources,'模块删除');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='模块管理'),null,null,'/module/expandModule.do',nextval for s_tf_resources,'模块扩展');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='模块管理'),null,null,'/module/batchDeleteModule.do',nextval for s_tf_resources,'模块批量查询');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='模块管理'),null,null,'/module/uploadModule.do',nextval for s_tf_resources,'模块上传');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='模块管理'),null,null,'/module/exportModule.do',nextval for s_tf_resources,'模块导出');

--初始化ADMIN账号



insert into user_source_rel (user_code,cluster_code,rel_status) select '10000' as user_code,(select cluster_code from  tf_resources where cluster_desc='模块管理') as cluster_code ,'1' as rel_status from (values 1) as tmp

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
        WHERE cluster_desc='模块管理'
        )
