--新增菜单
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
 values(null,null,null,'/feature/manageFeature.do',nextval for s_tf_resources,'专题模块管理');
--新增功能项
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='专题模块管理'),null,null,'/feature/queryFeature.do',nextval for s_tf_resources,'专题模块查询');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='专题模块管理'),null,null,'/feature/saveFeature.do',nextval for s_tf_resources,'专题模块保存');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='专题模块管理'),null,null,'/feature/deleteFeature.do',nextval for s_tf_resources,'专题模块删除');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='专题模块管理'),null,null,'/feature/expandFeature.do',nextval for s_tf_resources,'专题模块扩展');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='专题模块管理'),null,null,'/feature/batchDeleteFeature.do',nextval for s_tf_resources,'专题模块批量查询');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='专题模块管理'),null,null,'/feature/uploadFeature.do',nextval for s_tf_resources,'专题模块上传');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='专题模块管理'),null,null,'/feature/exportFeature.do',nextval for s_tf_resources,'专题模块导出');

--初始化ADMIN账号



insert into user_source_rel (user_code,cluster_code,rel_status) select '10000' as user_code,(select cluster_code from  tf_resources where cluster_desc='专题模块管理') as cluster_code ,'1' as rel_status from (values 1) as tmp

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
        WHERE cluster_desc='专题模块管理'
        )
