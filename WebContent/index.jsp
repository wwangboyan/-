<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="MenJin.entity.Student"%>
<%@page import="java.util.List"%>
<%@page import="MenJin.service.StudentService"%>
<%@page import="MenJin.service.imple.StudentServiceimp"%>
<%@page import="MenJin.dao.impl.StudentDaoimp"%>
<%@page import="MenJin.dao.StudentDao"%>
<%@page import="MenJin.servlet.addStudent"%>
<%@page import="MenJin.servlet.delStudent"%>
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
<script type="text/javascript">
	function check(){
	var txuehao = document.getElementById("xuehao").value;
	var tname = document.getElementById("name").value;
 	var tshebei = document.getElementById("shebeiId").value; 
	if(txuehao==null || txuehao==""){
	  alert("学号不能为空，不可以添加！");
	  return false;
	}
	if(tname==null || tname==""){
		alert("姓名不能为空，不可以添加！");
		 return false;
		}
/*  	if(tshebei==null || tshebei==""){
		alert("设备不能为空，不可以添加！");
		return false;
	}  */
	return confirm("添加学生信息成功！");
}
</script>
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
    <!--      <li><a href="daka.jsp"><i class="fa fa-home"></i> <span>学生打卡管理</span></a></li> -->
        <li class="active stu"><a href="#"><i class="fa fa-circle-o"></i> <span>信息管理</span></a></li>
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
        </li>
      </ul>
    </section>
  </aside>
  <div class="content-wrapper">
			<section class="content-header">
			<h1>门禁管理</h1>
			<ol class="breadcrumb">
				<!-- <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li class="active">门禁管理</li> -->
				<!-- <li style="padding-right: 50px;"><a href="#"><i
						class="fa fa-dashboard"></i> 打卡人数：</a></li> -->
			</ol>
			</section>
    <section class="contet ">
      <div class="container"> 
      <div class="but">
      <button type="button" class="btn btn-lg btn-block btn-info btn-primary bg-light-blue-active color-palette xinzenBtn" data-toggle="modal" data-target="#myModal" style="height: 50px;width: 150px; float:right;">添加人员信息</button>  
 	  </div>
 	<!-- 添加人员信息模态框（Modal） -->         
        <form method="post" id="form1" name="form1" action="addStudent" class="form-horizontal" role="form" onsubmit="return check()" method="post">     
          <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <!--  定义模态框，过渡效果为淡入，id为myModal,tabindex=-1可以禁用使用tab切换，aria-labelledby用于引用模态框的标题，aria-hidden=true保持模态框在触发前窗口不可见  -->         
            <div class="modal-dialog">
              <!--  显示模态框对话框模型（若不写下一个div则没有颜色）  -->
              <div class="modal-content">
                <!--  显示模态框白色背景，所有内容都写在这个div里面  -->
                <div class="btn-info modal-header">
                <!--  模态框标题  -->
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                  </button>
                  <!--  关闭按钮  -->
                  <h4 class="modal-title">学生信息添加</h4>
                  <!--  标题内容  -->
                </div>              
                <div class="modal-body">   
                <!--  模态框内容，我在此处添加一个表单 -->           
                    <div class="box-body">
                    <input type="hidden" id="yincangid1" name="yincangid1" value="${stu.id}"/>
                        <div class="form-group">
                          <label for="exampleInputstuno" class="control-label">学号 </label>
                          <input type="text" class="form-control well" id="xuehao" name="xuehao" value="${stu.xuehao}" length="11"  placeholder="请输入有效学号" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
                        </div>
                        <div class="form-group">
                          <label for="exampleInputstuname">姓名</label>
                          <input type="text" class="form-control well" id="name" name="name" value="${stu.name}" placeholder="请输入中文姓名" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5]/g,''))">
                        </div>
                     <input type="hidden" id="qingkuang" name="qingkuang" value="${stu.qingkuang=='0'}"/>
                        <%-- <input type="hidden" id="yincangid1" name="yincangid1" value="${stu.qingkuang== '0'}"/> --%>
                       <div class="form-group">
                            <label for="exampleInputstubanji">设备</label>
                               <input type="text" class="form-control well" id="shebeiId" name="shebeiId" value="${stu.shebeiId}" placeholder="请输入打卡设备" >
                          </div>
                       <%-- <div class="form-group">
                            <label for="exampleInputstubanji">打卡情况</label>
                               <input type="text" class="form-control well" id="qingkuang" name="qingkuang" value="${stu.qingkuang }" placeholder="打卡情况" >
                          </div> --%>
                     </div>   
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary btn-info quedingBtn" id="add">确定</button>
                </div>
              </div><!-- /.modal-content -->
            </div>
          </div><!-- /.modal -->          
        </form>
     </div>    
    </section>
    
			<!-- Main content -->
    <section class="content container-fluid">
      <div class="box">
        <div class="box-header">
          <h3 class="box-title">门禁管理</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
             <div class="row"><div class="col-sm-6"></div><div class="col-sm-6"></div></div>
          </div>
          <div class="row">
          <div class="col-sm-12">
          <table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
            <thead>
            <tr role="row">
            <th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">编号</th>
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
              List<Student> list = stuService.getAllStudent();
              session.setAttribute("list", list);		
             %>
             <c:forEach items="${list }" var="stu">
              <tr> 
               <td>${stu.id } </td>
               <td>${stu.xuehao }</td>
               <td>${stu.name }</td>
               <td>${stu.dakashijian }</td>
              <%--  <td>${stu.shebeiId }</td> --%>
              <td><c:choose>
				<c:when test="${stu.shebeiId== 1}"> 学校南门
                </c:when>
				<c:when test="${stu.shebeiId== 2}"> 学校北门
                </c:when>
                <c:when test="${stu.shebeiId== 3}"> 女生9#宿舍楼
                </c:when>
				<c:when test="${stu.shebeiId== 4}"> 男生12#宿舍楼
                </c:when>
			</c:choose></td>
               <td><c:choose>
               <c:when test="${stu.qingkuang== '1'}">打卡成功
               </c:when>
               <c:otherwise>未打卡 
               </c:otherwise>
               </c:choose></td>
               <td><a href="<%=request.getContextPath()%>/delStudent?id=${stu.id}" onclick="return confirm('确定将此记录删除?')">删 除</a></td>
             </c:forEach>
          </table> 
          <!-- 分页查询 -->
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
			</form>       
				</div>
          </div>
        </div>
      </div>
    </section>
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
<!-- <script type="text/javascript">
	function check(){
	var txuehao = document.getElementById("xuehao").value;
	var tname = document.getElementById("name").value;
	var tshebei = document.getElementById("shebeiId").value;
	if(txuehao==null || txuehao==""){
	  alert("学号不能为空，不可以添加！");
	  return false;
	}
	if(tname==null || tname==""){
		alert("姓名不能为空，不可以添加！");
		 return false;
		}
	if(tshebei==null || tshebei==""){
		alert("设备不能为空，不可以添加！");
		return false;
	}
	return confirm("添加学生信息成功！");
}
</script> -->
<script type="text/javascript">
	function dakaclick(){
	var Sid = document.getElementById("Sid").value;
	var Sxuehao = document.getElementById("Sxuehao").value;
	var Sname = document.getElementById("Sname").value;
	if(Sid==null || Sid==""){
		  alert("编号不能为空，不可以打卡！");
		  return false;
		}
		if(Sxuehao==null || Sxuehao==""){
			alert("学号不能为空，不可以打卡！");
			 return false;
			}
		if(Sname==null || Sname==""){
			alert("姓名不能为空，不可以打卡！");
			return false;
		}
	return confirm("人员打卡成功！");
	}
</script>
</body>
</html>