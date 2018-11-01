<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>标题</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<!-- 引入jQuery -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.min.js"></script>
<!-- 引入easyui -->
<script
	src="<%=request.getContextPath()%>/js/jquery-easyui/jquery.easyui.min.js"></script>
<!-- 引入easyui  css样式  只需引入easyui.css   其中就包含了其他的内容-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/jquery-easyui/themes/default/easyui.css">
<!-- 引入小图标 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/jquery-easyui/themes/icon.css">
<!-- 样式转化为中文 -->
<script
	src="<%=request.getContextPath()%>/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	function addTabs(url, tit){
		var b = $('#my_tabs').tabs('exists',tit);
		if(!b){
			$('#my_tabs').tabs('add',{    
			    title:tit,    
// 			    href : url,
				content:'<iframe style="width:100%;height:100%;position:relative;" src="'+url+'" frameborder="0" scrolling="true" ></iframe>',
			    closable:true,    
			    tools:[{    
			        iconCls:'icon-mini-refresh',    
			        handler:function(){    
			        	//获取当前选项卡 ，进行刷新
    		        	var tab = $('#my_tabs').tabs("getSelected"); 
    		        	$('#my_tabs').tabs('update', {
    		        		tab: tab,
    		        		options: {
    		        	               }
   		       			 }); 
			        }    
			    }]    
			});  
		}else{
			$('#my_tabs').tabs('select',tit);
		}
		
	}
</script>
	
</head>
<body class="easyui-layout">
	<div data-options="region:'north',title:'North Title',split:true"
		style="height: 100px;">
		<h1 align="center">后台管理系统</h1>	
	</div>
	<div data-options="region:'west',title:'West',split:true"
		style="width: 200px;">
		
		<div id="aa" class="easyui-accordion" fit="true">   
		    <div title="商品管理" data-options="iconCls:'icon-save'" style="overflow:auto;padding:10px;">  
		    	<a href="javascript:addTabs('toSpuPage.do','商品信息管理')">商品信息管理</a>
				<br>
				<a href="javascript:addTabs('toSpuAttrPage.do','商品属性管理')">商品属性管理</a>
				<br>
				<a href="javascript:addTabs('toSkuPage.do','商品库存管理')">商品库存管理</a>
		    </div>   
		</div>  
	</div>

	<div data-options="region:'center',title:'center title'"
		style="padding: 5px; background: #eee;">
		
		<div id="my_tabs" class="easyui-tabs" fit="true">   
			
		</div>
		
	</div>
</body>

</html>