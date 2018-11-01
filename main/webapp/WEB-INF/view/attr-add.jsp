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
 </head>
 <body>
 		add
 		<hr>
 		flbh2：${flbh2}
 		<hr>
 		<form action="addAttr.do" method="post">
			<input type="text" name="flbh2" value="${flbh2}"/>
			<table border="1" width="600px">
				<tr>
					<td>属性名：<input type="text" name="mallAttrs[0].shxmMch"/> </td>
					<td></td>
					<td>添加属性值</td>
				</tr>
				<tr>
					<td>属性值：<input type="text" name="mallAttrs[0].mallValues[0].shxzh"/> </td>
					<td>单位：<input type="text" name="mallAttrs[0].mallValues[0].shxzhMch"/> </td>
					<td>删除 </td>
				</tr>
				<tr>
					<td>属性值：<input type="text" name="mallAttrs[0].mallValues[1].shxzh"/> </td>
					<td>单位：<input type="text" name="mallAttrs[0].mallValues[1].shxzhMch"/> </td>
					<td>删除 </td>
				</tr>
			</table>
			
			<table border="1" width="600px">
				<tr>
					<td>属性名：<input type="text" name="mallAttrs[1].shxmMch"/></td>
					<td></td>
					<td>添加属性值</td>
				</tr>
				<tr>
					<td>属性值：<input type="text" name="mallAttrs[1].mallValues[0].shxzh"/> </td>
					<td>单位：<input type="text" name="mallAttrs[1].mallValues[0].shxzhMch"/> </td>
					<td>删除 </td>
				</tr>
				<tr>
					<td>属性值：<input type="text" name="mallAttrs[1].mallValues[1].shxzh"/> </td>
					<td>单位：<input type="text" name="mallAttrs[1].mallValues[1].shxzhMch"/> </td>
					<td>删除 </td>
				</tr>
			</table>
			
			<input type="submit">
 		</form>
 </body>
</html>