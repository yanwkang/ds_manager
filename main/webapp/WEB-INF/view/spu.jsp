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
					$("#oneSelectId").append('<option value="'+data[i].id+'">'+data[i].flmch1+'</option>')
				}
			})	
// 			twoSelect(param);
// 			$('#oneSelectId').combobox({
// 			    url:'js/json/class_1.js',
// 			    valueField:'id',
// 			    textField:'flmch1' ,
// 			    onChange: function(param){
// // 			    	console.log(param);
//
// 				}
// 			});
		})

		function twoSelect(value){
			$.getJSON("js/json/class_2_"+value+".js",function(data){
				$("#twoSelectId").empty();
				for(var i = 0; i < data.length ; i++){
					$("#twoSelectId").append('<option value="'+data[i].id+'">'+data[i].flmch2+'</option>')
				}
			})
			
			
// 			$('#twoSelectId').combobox({
// 			    url:"js/json/class_2_"+value+".js",
// 			    valueField:'id',
// 			    textField:'flmch2'
// 			});

			ppSelect(value);
		}
		
		function ppSelect(value){
			 $.getJSON("js/json/tm_class_1_"+value+".js",function(data){
				$("#ppSelectId").empty();
				for(var i = 0; i < data.length ; i++){
					$("#ppSelectId").append('<option value="'+data[i].id+'">'+data[i].ppmch+'</option>')
				}
			}) 
// 			$('#ppSelectId').combobox({    
// 			    url:"js/json/tm_class_1_"+value+".js",    
// 			    valueField:'id',    
// 			    textField:'ppmch'   
// 			});
		}
		
		function toSpuAddPage(){
			var class_1 = $("#oneSelectId").val();
			var class_2 = $("#twoSelectId").val();
			var tm_val = $("#ppSelectId").val();
			location.href="toSpuAddPage.do?flbh1="+class_1
						+"&flbh2="+class_2+"&ppId="+tm_val;
			
		}
	</script>
 </head>
 <body>
 	spu
 	<hr>
 	一级：<select id="oneSelectId" style="width: 80px;"  onchange="twoSelect(this.value)">
 			<option>请选择</option>
 		</select>
 		
 	二级：<select id="twoSelectId"  >
 			<option>请选择</option>
 		</select>
 		
 	品牌：<select id="ppSelectId" >
 			<option>请选择</option>
 		</select>
 	<hr>

 	<a href="javascript:toSpuAddPage()">增加</a>
 	
 </body>
</html>