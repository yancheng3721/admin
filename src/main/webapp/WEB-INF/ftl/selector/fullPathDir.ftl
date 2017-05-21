
<#include   "/head/head.ftl">

<script type="text/javascript">
if('${_msg}'!=null&&'${_msg}'!=""){
   alert('${_msg}');
}

	function selThis(ary){
		
		if(window.opener&&window.opener.__receivers&&ary){
		  	if(ary&&ary.length&&window.opener.__receivers.length){
		  		for(var i=0;i<ary.length;i++){
		  			if(window.opener.__receivers[i]){
		  				window.opener.__receivers[i].val(ary[i]);
		  			}
		  		}
		  	}
		}
		window.close();
	}
	//查询
	function doQuery(){
		
		var searchForm = $("#searchForm");
		searchForm.attr("action", "/esp-admin/selector/query.do").submit()
	}
	
	$(function() {
		if(window.location.href.indexOf('/esp-admin/selector/query.do')==-1){
			//alert(window.location.href);
			doQuery();
		}
	});	
	
</script>
<div style="background:white;" >
<form method="post" action="" id="searchForm">			
		<div class="mRtBox">
		
			<div class="rTitle" >
				<h3>目录选择<span style="color:red"></span></h3>
			</div>
			
			<div class="searchCenter">
				
				<input type="hidden" name="__querySql" value="SELECT A.ID AS ROOT_ID,A.NAME as ROOT_NAME,B.id as id1,b.name as NAME1 ,C.ID AS ID2,C.NAME AS NAME2,D.ID AS ID3 ,D.NAME AS NAME3 FROM TF_DIRECTORY A LEFT JOIN TF_DIRECTORY B ON A.ID=B.PARENT_ID LEFT JOIN TF_DIRECTORY C ON B.ID=C.PARENT_ID LEFT JOIN TF_DIRECTORY D ON C.ID=D.PARENT_ID WHERE (A.PARENT_ID=0 OR A.PARENT_ID IS NULL ) ORDER BY A.SORT,B.SORT,C.SORT,D.SORT"/>
				<input type="hidden" name="module" value="fullPathDir"/>
				
				<table width="100%" class="searTabBg">
					<tr><td class='tdName'>频道ID:</td><td><input name='searchbox.ROOT_ID' type='text' id='searchbox.ROOT_ID'  value='${searchbox["ROOT_ID"]}' /></td><td class='tdName'>频道名称:</td><td><input name='searchbox.ROOT_NAME' type='text' id='searchbox.ROOT_NAME'  value='${searchbox["ROOT_NAME"]}' /></td></tr><tr><td class='tdName'>一级ID:</td><td><input name='searchbox.ID1' type='text' id='searchbox.ID1'  value='${searchbox["ID1"]}' /></td><td class='tdName'>一级名称:</td><td><input name='searchbox.NAME1' type='text' id='searchbox.NAME1'  value='${searchbox["NAME1"]}' /></td></tr><tr><td class='tdName'>二级ID:</td><td><input name='searchbox.ID2' type='text' id='searchbox.ID2'  value='${searchbox["ID2"]}' /></td><td class='tdName'>二级名称:</td><td><input name='searchbox.NAME2' type='text' id='searchbox.NAME2'  value='${searchbox["NAME2"]}' /></td></tr><tr><td class='tdName'>三级ID:</td><td><input name='searchbox.ID3' type='text' id='searchbox.ID3'  value='${searchbox["ID3"]}' /></td><td class='tdName'>三级名称:</td><td><input name='searchbox.NAME3' type='text' id='searchbox.NAME3'  value='${searchbox["NAME3"]}' /></td></tr>
					
				</table>
				
			</div>
			<div class="searchCenter">
				<button id='queryBtn' onClick="doQuery()"><span><span>查询</span></span></button>
			</div>
			
			<div class="searchCenter" style="position:relative;overflow:auto;height:330px">
			<table width="100%"  class="list">		
				<tr style="position:relative;top:expression(this.offsetParent.scrollTop);">
					<th width=60px >序号</th>
					<th>频道ID</th><th>频道名称</th><th>一级ID</th><th>一级名称</th><th>二级ID</th><th>二级名称</th><th>三级ID</th><th>三级名称</th>
				</tr>
				<#list objs as obj>
				<tr  onmouseover="this.className='even_over'" onmouseout="this.className=''" style="cursor:pointer" onClick="selThis(['${obj.ID3}','${obj.NAME3}'])">
					<td align="left">
						
						${page.length*(page.currentPage-1)+obj_index+1}
					</td>
					
					<td>${obj.ROOT_ID}</td><td>${obj.ROOT_NAME}</td><td>${obj.ID1}</td><td>${obj.NAME1}</td><td>${obj.ID2}</td><td>${obj.NAME2}</td><td>${obj.ID3}</td><td>${obj.NAME3}</td>
					
				</tr>
				</#list>
			
			</table>
			</div>
			
			<div class="searchCenter" style="text-align:right">
				<script type="text/javascript">
					window.__page=new SnPage(document.getElementById("searchForm"),'/esp-admin/selector/query.do','${page.totalPage?c}','${page.currentPage?c}');
				</script>
				   每页<input type="text"  name="length" size=2 value="${page.length?c}"/>条记录
				|共<span style="color:red">${page.total?c}</span>条记录
				|第  <span style="color:red">${page.currentPage?c}/${page.totalPage?c}</span> 页
				|<a href="#" onclick="__page.goToPage('1');" >首页</a>
				|<a href="#" onclick="__page.goToPage('${page.beforePage?c}');" >上一页</a>
				|<a href="#" onclick="__page.goToPage('${page.nextPage?c}');" >下一页</a>
				|<a href="#" onclick="__page.goToPage('${page.totalPage?c}');" >尾页</a>
				|
				|第<input type="text" id="currentPage" value="${page.currentPage?c}" name="currentPage" size=2/>页 
				 <input type="button" value="GO" onclick="__page.goToPage(document.getElementById('currentPage').value);" style="width:30px;height:24px;font:black 20px;"/>
				
			</div>
			</form>
		</div>

</div>

<#--同步信息-->
<div id="syncData" style="display:none;text-align:center;">
	<span style="font-size:12pt;">
		正在同步，请稍等...，<b>请勿关闭该窗口</b>
	</span>
</div>