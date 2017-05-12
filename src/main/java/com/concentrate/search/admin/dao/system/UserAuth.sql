--新增菜单
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
 values(null,null,null,'/user/manageUser.do',nextval for s_tf_resources,'用户管理管理');
--新增功能项
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='用户管理管理'),null,null,'/user/queryUser.do',nextval for s_tf_resources,'用户管理查询');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='用户管理管理'),null,null,'/user/saveUser.do',nextval for s_tf_resources,'用户管理保存');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='用户管理管理'),null,null,'/user/deleteUser.do',nextval for s_tf_resources,'用户管理删除');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='用户管理管理'),null,null,'/user/expandUser.do',nextval for s_tf_resources,'用户管理扩展');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='用户管理管理'),null,null,'/user/batchDeleteUser.do',nextval for s_tf_resources,'用户管理批量查询');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='用户管理管理'),null,null,'/user/uploadUser.do',nextval for s_tf_resources,'用户管理上传');
insert into  tf_resources(parent_id,child_id,resource_desc,resource_url,cluster_code,cluster_desc)
values((select cluster_code from tf_resources where cluster_desc='用户管理管理'),null,null,'/user/exportUser.do',nextval for s_tf_resources,'用户管理导出');

--初始化ADMIN账号



insert into user_source_rel (user_code,cluster_code,rel_status) select '10000' as user_code,(select cluster_code from  tf_resources where cluster_desc='用户管理管理') as cluster_code ,'1' as rel_status from (values 1) as tmp

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
        WHERE cluster_desc='用户管理管理'
        )
