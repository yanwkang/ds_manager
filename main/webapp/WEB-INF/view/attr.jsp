<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
		$(function(){
			$.getJSON("js/json/class_1.js",function(data){
				var oneSelectVal = "";
				for(var i = 0; i < data.length ; i++){
					$("#attrOneSelectId").append('<option value="'+data[i].id+'">'+data[i].flmch1+'</option>')
				}
			})		
			
// 			$('#attrOneSelectId').combobox({    
// 			    url:'js/json/class_1.js',    
// 			    valueField:'id',
// 			    textField:'flmch1' ,
// 			    width : 80,
// 			    onChange: function(param){
// 			    	twoSelect(param);
// 				}
// 			}); 
		})
		
		function twoSelect(value){
			$.getJSON("js/json/class_2_"+value+".js",function(data){
				$("#attrTwoSelectId").empty();
				for(var i = 0; i < data.length ; i++){
					$("#attrTwoSelectId").append('<option value="'+data[i].id+'">'+data[i].flmch2+'</option>')
				}
			}) 
			
// 			$('#attrTwoSelectId').combobox({
// 			    url:"js/json/class_2_"+value+".js",
// 			    valueField:'id',
// 			    textField:'flmch2' ,
// 			    width : 80,
// 			    onChange: function(param){
// 			    	get_attr_list_json(param);
// 				}
// 			});
		}
		
		function toAttrAddPage(){
			var class_2 = $("#attrTwoSelectId").val();
			location.href="toAttrAddPage.do?flbh2="+class_2;
		}
		
		//查询list集合
		function getAttrList(flbh2){
			$.post("getAttrList.do",{"flbh2":flbh2},function(data){
				$("#attr_list_div").html(data);
			});		
		}
		
		function get_attr_list_json(flbh2){
			$('#attr_list_div').datagrid({    
			    url:'getAttrList.do', 
			    queryParams: {
			    	"flbh2": flbh2
				},
			    columns:[[    
			        {field:'id',title:'id',width:100},    
			        {field:'shxmMch',title:'属性名',width:100},   
			        {field:'mallValues',title:'属性值',width:100,
			        	formatter: function(value,row,index){
			        		str = "";
							$(value).each(function(i,json){
								str = str + json.shxzh + json.shxzhMch + "";
							})
							return str;
			        	}
			        },   
			        {field:'chjshj',title:'创建时间',width:100,
			        	formatter: function(value,row,index){
			        		var d = new Date(value);
			        		var str = d.toLocaleString();
							return str;
			        	}	
			        },    
			    ]]    
			});  

		}
	</script>
 </head>
 <body>
 	attr
 	<hr>
 	一级：<select id="attrOneSelectId"  onchange="twoSelect(this.value)">
 			<option>请选择</option>
 		</select>
 		
 	二级：<select id="attrTwoSelectId"   onchange="get_attr_list_json(this.value)">
 			<option>请选择</option>
 		</select>
 	<hr>
	
 	<a href="javascript:toAttrAddPage()">增加</a>
 	
 	<br>
<!--  	<div id="attr_list_div" class="easyui-datagrid" ></div> -->
 	<table id="attr_list_div"></table>  
 </body>
</html>