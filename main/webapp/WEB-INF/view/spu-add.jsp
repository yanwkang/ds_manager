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
  
  <script type="text/javascript">
  	
  	function clickImg(index){
  		//触发file标签的点击事件
  		$("#file_"+index).click();
  	}
  	
  	function showImgs(index){
  		// 获得图片对象
		var file = $("#file_"+index)[0].files[0];
		var url = window.URL.createObjectURL(file);
		
		// 替换image
		$("#image_"+index).attr("src",url);
		
		addImg(index);
  	}
  	
  	function addImg(index){
  		
  		var imgDiv = "";
  		
  		imgDiv += '<div id="d_'+(index+1)+'" style="float: left;">';
 		imgDiv += '<input  type="file" style="display: none;"  name="files" id="file_'+(index+1)+'" onchange="showImgs('+(index+1)+')"/>';
		imgDiv += '<img id="image_'+(index+1)+'" width="80px" src="imgs/upload_hover.png" onclick="clickImg('+(index+1)+')"/>';
		imgDiv += '</div>';
  		console.log(imgDiv);
		
  		$("#d_"+index).after(imgDiv);
  	}
  </script>
 </head>
 <body>
 	商品分类信息：${spu.flbh1 }--${spu.flbh2 }--${spu.ppId }
 	<hr>
 	<form action="addSpu.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="flbh1" value="${spu.flbh1}"/>
		<input type="hidden" name="flbh2" value="${spu.flbh2}"/>
		<input type="hidden" name="ppId" value="${spu.ppId}"/>
 		<br>
 		商品名称：<input name="shpMch" type="text"/>
 		<br/>
 		商品描述：
 			<textarea rows="10" cols="50" name="shpMsh"></textarea>
 		<br/>
 		图片：<br>
 		<div id="d_0" style="float: left;">
	 		<input  type="file" style="display: none;"  name="files" id="file_0" onchange="showImgs(0)"/>
 			<img id="image_0" width="80px" src="imgs/upload_hover.png" onclick="clickImg(0)"/>
 		</div>
 		<br>
 		<input type="submit" name="提交">
 	</form>
 </body>
</html>


