<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="MenJin.entity.Student"%>
<%@page import="MenJin.entity.Shebei"%>
<%@page import="MenJin.service.StudentService"%>
<%@page import="MenJin.service.imple.StudentServiceimp"%>
<%@page import="MenJin.dao.impl.StudentDaoimp"%>
<%@page import="MenJin.dao.StudentDao"%>
<%@page import="MenJin.servlet.selectServlet"%>
<%@page import="java.util.*"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

  <title>门禁管理系统</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="AdminLTE-master/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="AdminLTE-master/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="AdminLTE-master/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="AdminLTE-master/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="AdminLTE-master/dist/css/skins/skin-blue.min.css">
  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"/>
<title>门禁管理系统</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <a href="AdminLTE-master/index2.html" class="logo">
      <span class="logo-mini"><b>门禁管理</b></span>
      <span class="logo-lg"><b>门禁管理系统</b></span>
    </a>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <section class="sidebar">
      <div class="user-panel">
        <div class="pull-left image">
          <img src="AdminLTE-master/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>管理员${user.username }</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Manager</a>
        </div>
      </div>
      <!-- search form (Optional) -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
        </div>
      </form>
      <!-- /.search form -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">主页</li>	
        <!-- Optionally, you can add icons to the links -->
        <li class="active stu"><a href="index.jsp"><i class="fa fa-circle-o"></i> <span>信息管理</span></a></li>
        <li><a href="shebeiqingkuang.jsp"><i class="fa fa-th"></i> <span>设备管理</span></a></li>
        <li class="treeview">
            <a href="tongjiShow">
              <i class="fa fa-files-o"></i> <span>统计管理</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu" style="display: none;">
            <li><a href="tongjiShow"><i class="fa fa-circle-o"></i>打卡情况统计管理</a></li>
              <li><a href="tongjiShowZhuangtai"><i class="fa fa-circle-o"></i>设备统计管理</a></li>
            </ul> 
          </li>
        <li><a href="select.jsp"><i class="fa fa-table"></i> <span>数据查询</span></a></li>
      </ul>
    </section>
  </aside>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
       门禁管理
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li class="active">数据查询</li>
      </ol>
    </section>
    <div class="container" style="width:90%;">
    <h3 style="text-align: center">人员数据查询</h3>   
    <table border="1" class="table table-bordered table-hover">

               <%-- action默认不写就是本地址 --%>
               <form action="selectServlet" method="post">
               <div class="form-group">
                       <label for="exampleInputstubanji" style="float:left;"> 设备人员查询：
                      <input type="text" class="form-control well" id="shebeiId" name="shebeiId" value=""  placeholder="请输入设备" style="width: 450px;float: right;"></label> 
                 </div>
                   <input type="submit" value="进行查询" onclick="conclick();"style=" border-radius: 12%; background-color: #4CAF50; font-size: 16px; margin: 4px 16px; color: white; width:120px; height:40px;">
               </form>
         <thead>
            <tr role="row">
            <th rowspan="1" colspan="1">编号</th>
            <th rowspan="1" colspan="1">学号</th>
            <th rowspan="1" colspan="1">姓名</th>
            <th rowspan="1" colspan="1">打卡时间</th>
            <th rowspan="1" colspan="1">设备</th>
            <th rowspan="1" colspan="1">打卡情况</th>
            <th rowspan="1" colspan="1">操作</th>
            </tr>
            </thead>
             <%
              StudentService stuService = new StudentServiceimp();
              List<Student> lists = stuService.getAllStudent();
              session.setAttribute("lists", lists);		
             %> 
        <c:forEach items="${lists }" var="list">
            <tr>
                <td>${list.id}</td>
                <td>${list.xuehao}</td>
                <td>${list.name}</td>
                <td>${list.dakashijian}</td>
                <td><c:choose>
				<c:when test="${list.shebeiId== 1}"> 学校南门
                </c:when>
				<c:when test="${list.shebeiId== 2}"> 学校北门
                </c:when>
                <c:when test="${list.shebeiId== 3}"> 女生9#宿舍楼
                </c:when>
				<c:otherwise> 男生12#宿舍楼
                </c:otherwise>
			</c:choose></td>
                <td><c:choose>
               <c:when test="${list.qingkuang== '0'}">未打卡
               </c:when>
               <c:otherwise> 打卡成功
               </c:otherwise> 
               </c:choose></td>
                <td><span>禁止任何操作</span></td>
            </tr>
        </c:forEach>
    </table>
    </div>
    <%-- <!-- 分页查询 -->
 			<br>
			<!-- 指定页大于1，显示“首页 上一页”-->
			<c:if test="${pageNos>1 }">
			<a href="PageServlet?pageNos=1" style="margin-left: 390px;margin-top: 200px;color:#444444;">首页</a>
			<a href="PageServlet?pageNos=${pageNos-1 }" style="color: #444444;">上一页</a>
			</c:if>
			<!-- 指定页小于总页数，显示“末页 下一页” 与 “首页 上一页”-->
			<c:if test="${pageNos <recordCount }">
			<a href="PageServlet?pageNos=${pageNos+1 }" style="margin-left: 270px;margin-top: 200px;color: #444444;">下一页</a>
			<a href="PageServlet?pageNos=${recordCount }" style="color: #444444;">末页</a>
			</c:if>
			<form action="PageServlet">
			<h4 align="center">共${recordCount}页  
			<input type="text" value="${pageNos}" name="pageNos" size="1" style="border-radius: 5px;">页
			<input type="submit" value="到达" style="border-radius: 20px;">
			</h4>
			</form> --%>
  </div>
</div>
<!-- jQuery 3 -->

<script src="AdminLTE-master/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="AdminLTE-master/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="AdminLTE-master/dist/js/adminlte.min.js"></script>   
<!-- Bootstrap的所有插件都依赖于jQuery，必须在引入bootstrap.min.js前引入jQuery -->
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- 压缩版的bootstrap.min.js包含了所有的Bootstrap数据API插件 -->
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>