<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="MenJin.entity.Student"%>
<%@page import="MenJin.dao.impl.StudentDaoimp"%>
<%@page import="MenJin.dao.StudentDao"%>
<%@page import="MenJin.servlet.tongjiShow"%>
<%@page import="MenJin.servlet.tongjiShowZhuangtai"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>门禁管理系统</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <script src="static/echarts.js"></script>
  <script src="static/jquery-1.8.3.js"></script>
  <script src="static/echarts.min.js"></script>
  <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts-all-3.js"></script>
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
    <style>
    .button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    /* padding: 15px 32px; */
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 16px;
    cursor: pointer;
    border-radius: 8%;
    }
    .button2 {background-color: #f44336;} /* Red */

    </style>

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
  <!-- Content Wrapper. Contains page content -->
  <!-- 写代码 -->
  	<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header" id="xueshengguanli">
			<h1>门禁管理系统</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
				<li class="active">数据统计</li>
			</ol>
			<br />
			<br />
			<span style="text-align: center; font-weight: bold;">门禁打卡</span><br />
			<span style="text-align: center; color: #c1c1c1;">柱状图</span>
			<form action="tongjiShowZhuangtai">
				<div align="center">
					<div class="row">
						<div id="main1" style="width: 800px;height:600px;"></div>
					</div>
				</div>
			</form>
			</section>
			<!-- /.content -->
		</div>	
</div>
	<%
	int bj10=(int)request.getAttribute("bj10");
	int bj11=(int)request.getAttribute("bj11");
	
	int bj20=(int)request.getAttribute("bj20");
	int bj21=(int)request.getAttribute("bj21");
	
 	int bj30=(int)request.getAttribute("bj30");
	int bj31=(int)request.getAttribute("bj31"); 
	
 	int bj40=(int)request.getAttribute("bj40");
	int bj41=(int)request.getAttribute("bj41"); 
	%> 
	<script type="text/javascript">
	// 基于准备好的dom，初始化echarts实例
	 var myChart1 = echarts.init(document.getElementById('main1'));
	 var option = {
			    tooltip : {
			        trigger: 'axis',
			        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
			            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			        }
			    },
			    legend: {
			        data:['已打卡人数','未打卡人数',]
			    },
			    grid: {
			        left: '3%',
			        right: '4%',
			        bottom: '3%',
			        containLabel: true
			    },
			    xAxis : [
			        {
			            type : 'category',
			            data : ['已打卡人数','未打卡人数']
			        }
			    ],
 			    yAxis : [
			        {
			            type : 'value'
			        }
			    ], 
			    series : [
			        {
			            name:'学校南门',
			            type:'bar',
			            data:[<%=bj11%>, <%=bj10%>]
			        },
			        {
			            name:'学校北门',
			            type:'bar',
			            data:[<%=bj21%>, <%=bj20%>]
			        },
			        {
			            name:'女生9#宿舍楼',
			            type:'bar',
			            data:[<%=bj31%>, <%=bj30%>]
			        },
			        {
			            name:'男生9#宿舍楼',
			            type:'bar',
			            data:[<%=bj41%>, <%=bj40%>]
			        },
			    ]
			};

	// 使用刚指定的配置项和数据显示图表。
 	myChart1.setOption(option); 
</script>

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