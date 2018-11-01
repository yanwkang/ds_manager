<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
  <script type="text/javascript">
  $(function (){
	  	var flbh1 = "${flbh1}"; 
		$.getJSON("js/json/tm_class_1_"+flbh1+".js",function(data){
			$("#ppSelectId").empty();
			for(var i = 0; i < data.length ; i++){
				$("#ppSelectId").append('<option value="'+data[i].id+'">'+data[i].ppmch+'</option>')
			}
		})
	})
	
	function getSpuList(ppId){
	  	var flbh2 = "${flbh2}";
	  	$.post("getSpuList.do",{"ppId":ppId,"flbh2":flbh2},function(data){
	  		//$("#shopSelectId").empty();
	  		$(
	  		    data).each(function(i,json){
	  			console.log(json);
	  			$("#shopSelectId").append('<option value="'+json.id+'">'+json.shpMch+'</option>');
	  		})
	  	})
  	}
  
  function show_val(attr_id,obj){
	  if(obj.checked){
		  $("#div_"+attr_id).show();
	  }else{
		  $("#div_"+attr_id).hide(); 
	  }
  }
  </script>
 </head>
 <body>
 <form action="addSku.do" method="post">
 	品牌：<select id="ppSelectId" onchange="getSpuList(this.value)"></select>
 	商品：<select id="shopSelectId" name="shpId" ></select>
 	<br>
 	<hr>
 	<c:forEach items="${attrList}" var="attr" varStatus="i" >
 		<input type="checkbox" onclick="show_val(${attr.id},this)" value="${attr.id}" name="list[${i.index }].shxmId">${attr.shxmMch}
 	</c:forEach>
 	<hr>
 	<c:forEach items="${attrList }" var="attr" varStatus="i">
		<div id="div_${attr.id}" style="display: none;" >
		 		<c:forEach items="${attr.mallValues}" var="val" >
			 			<input type="radio" name="list[${i.index }].shxzhId" value="${val.id}"/>
			 				${val.shxzh}${val.shxzhMch}
		 		</c:forEach>
 		</div>
 		<br>
 	</c:forEach>
 	<hr>
 	商品库存名称：<input type="text" name="skuMch"/><br>
	商品库存数量：<input type="text" name="kc"/><br>
	商品库存价格：<input type="text" name="jg"/><br>
	商品库存地址：<input type="text" name="kcdz"/><br>
	
	<input type="submit"/>
</form>
 </body>
</html>