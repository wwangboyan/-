<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="MenJin.entity.Shebei"%>
<%@page import="java.util.List"%>
<%@page import="MenJin.service.ShebeiService"%>
<%@page import="MenJin.service.imple.ShebeiServiceimp"%>
<%@page import="MenJin.dao.impl.ShebeiDaoimp"%>
<%@page import="MenJin.dao.ShebeiDao"%>
<%@page import="MenJin.servlet.addShebei"%>
<%@page import="MenJin.servlet.delShebei"%>
<%@page import="MenJin.servlet.XiugaiServlet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

	td{
	height: 50px;}
	th{
	height: 50px;}
	.ite{
	position: relative;
    line-height: 30px;
		}
	input[type="radio"] {
    width: 20px;
    height: 20px;
    opacity: 0;
        }
    .lalabel{
    position: absolute;
    left: 5px;
    top: 3px;
    width: 20px;
    height: 20px;
    border-radius: 50%;
    border: 1px solid #999;
　　 cursor: pointer;
    	}
    input:checked+label { 
    background-color: #fe6d32;
    border: 1px solid #fe6d32;
    	}
    /*添加的加号与label进行拼接(一个矩形边框去掉上和左的边框),再旋转45度*/
    input:checked+label::after {
    position: absolute;
    content: "";
    width: 5px;
    height: 10px;
    top: 3px;
    left: 6px;
    border: 2px solid #fff;
    border-top: none;
    border-left: none;
    transform: rotate(45deg);
    	}
    </style>
<script type="text/javascript">
	function check(){
	var tquyue = document.getElementById("quyue").value; 
	var tdidian = document.getElementById("didian").value;
	var tzhuangtai = document.getElementById("zhuangtai").value;
	if(tquyue==null || tquyue==""){
		alert("区域不能为空，不可以添加！");
 		return false;
	}
	if(tdidian==null || tdidian==""){
		alert("地点不能为空，不可以添加！");
		return false;
	}
	if(tzhuangtai==null || tzhuangtai==""){
		alert("状态不能为空，不可以添加！");
		return false;
	}
	return confirm('添加设备信息成功！')
}
</script>
<script type="text/javascript">
	function xiugaicheck(){
	var shebeiId = document.getElementById("SshebeiId").value;
	var szhuangtai = document.getElementById("Szhuangtai").value; 
	var sbiaoshi = document.getElementById("Sbiaoshi").value;
	if(shebeiId==null || shebeiId==""){
		alert("设备编号不能为空，不可以修改！");
 		return false;
	}
	if(szhuangtai==null || szhuangtai==""){
		alert("设备状态不能为空，不可以修改！");
		return false;
	}
	if(sbiaoshi==null || sbiaoshi==""){
		alert("设备情况不能为空，不可以修改！");
		return false;
	}
	return confirm('修改设备信息成功！')
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
        <li><a href="daka.jsp"><i class="fa fa-home"></i> <span>学生打卡管理</span></a></li>
 <!--         <li><a href="daka.jsp" data-toggle="tab"><i class="fa fa-home">学生打卡管理</i></a></li> -->
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
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header" >
      <h1 style="margin-top:30px;">
       区域设备管理
      </h1>
      <div class="shebei" style="margin-top:50px;">
       <form method="post" action="delShebei" id="delForm">
          <table border="1" style="width:100%;">
            <tr>
              <th>编号</th>
              <th>区域</th>
              <th>地点</th>
              <th>设备状态</th>
              <th>设备情况</th>
              <th>操作</th>
            </tr>
            <%
              ShebeiService shService = new ShebeiServiceimp();
              List<Shebei> list = shService.getAllSgebei();
              session.setAttribute("list", list);		
             %>
             <c:forEach items="${list }" var="sh">
              <tr> 
               <td name="shebeiId">${sh.shebeiId } </td>
               <td>${sh.quyue }</td>
               <td>${sh.didian }</td>
               <td><c:choose>
				<c:when test="${sh.zhuangtai== 0}"> 正在使用状态
                </c:when>
				<c:otherwise> 不可用状态
                </c:otherwise>
                </c:choose>              
                </td>
                <td><c:choose>
				<c:when test="${sh.biaoshi== 1}"> 设备已经打开
                </c:when>
				<c:otherwise> 设备处于关闭状态
                </c:otherwise>
                </c:choose>            
                </td>     
              <td><a href="<%=request.getContextPath()%>/delShebei?shebeiId=${sh.shebeiId}" onclick="return confirm('确定将此记录删除?')">删 除</a></td>
			 </tr>
			</c:forEach>
          </table>
           </form>
          </div>
       <lable>
       <button class="btn btn-block btn-success btn-lg" type="submit" value="chaxun" name="chaxun" data-toggle="modal" data-target="#myModal" style="height: 45px;width: 160px;float: right;margin-top: 20px;">添加设备信息</button>
      <button type="button" class="btn btn-lg btn-block btn-info btn-primary bg-light-blue-active color-palette xinzenBtn" data-toggle="modal" data-target="#myModal3" style="height: 45px;width: 160px;float: right;margin-top: 20px;margin-right: 30px;">修改设备信息</button>
       </lable>  
       <div class="shexiu">   
      <form id="form3" method="post" action="XiugaiServlet" name="form3" onsubmit="return xiugaicheck()">  
       <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                  <h4 class="modal-title">进行设备修改</h4>
                  <!--  标题内容  -->
                </div>              
                <div class="modal-body">   
                <!--  模态框内容，我在此处添加一个表单 -->           
                    <div class="box-body">
                        <div class="form-group">
                          <label for="exampleInputstuno" class="control-label">设备编号 </label>
                          <input type="text" class="form-control well" id="SshebeiId" name="SshebeiId" value="${sh.shebieId}" placeholder="请输入设备编号"/>
                        </div>
                         <div class="form-group">
                          <label for="exampleInputstuname">设备状态</label>
                          <input type="text" class="form-control well" id="Szhuangtai" name="Szhuangtai" value="${sh.zhuangtai}" placeholder="请确认设备状态"/>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputstubanji">设备情况</label>
                            <input type="text" class="form-control well" id="Sbiaoshi" name="Sbiaoshi" value="${sh.biaoshi}" placeholder="请输入设备情况"/>
                         </div> 
                     </div>   
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary btn-info quedingBtn" id="add">进行添加</button>
                </div>
              </div><!-- /.modal-content -->
            </div>
                  </div>
               </form>
             </div>
     <form method="post" id="form1" name="form1" action="addShebei" class="form-horizontal" role="form" onsubmit="return check()">     
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
                  <h4 class="modal-title">进行设备添加</h4>
                  <!--  标题内容  -->
                </div>              
                <div class="modal-body">   
                <!--  模态框内容，我在此处添加一个表单 -->           
                <div class="box-body">
                        <div class="form-group">
                          <label for="exampleInputstuno" class="control-label">编号 </label>
                          <input type="text" class="form-control well" id="shebeiId" name="shebeiId" value="${sh.shebeiId}" placeholder="请输入编号"/>
                        </div>
                        <div class="form-group">
                          <label for="exampleInputstuname">区域</label>
                          <input type="text" class="form-control well" id="quyue" name="quyue" value="${sh.quyue}" placeholder="请输入区域名"/>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputstubanji">地点</label>
                            <input type="text" class="form-control well" id="didian" name="didian" value="${sh.didian}" placeholder="请输入地点"/>
                         </div>
                         <div class="form-group">
                          <label for="exampleInputstuname">状态</label>
                          <input type="text" class="form-control well" id="zhuangtai" name="zhuangtai" value="${sh.zhuangtai}" placeholder="请确认设备状态"/>
                        </div> 
                     </div>   
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary btn-info quedingBtn" id="add">进行添加</button>
                </div>
              </div><!-- /.modal-content -->
            </div>
          </div><!-- /.modal -->          
        </form>
      </div> 
    </section>
</div>

  <div class="control-sidebar-bg">
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
<script type="text/javascript">
	/* var oclick = document.getElementById('concheck');
	oclick.onclick = function(){ */
		function del(){
		var Szhuangtai = document.getElementById("zhuangtai").value;
		
		if(Szhuangtai =='0'){
			alert("设备为可使用状态，不可以删除！");
			return false;
		}
		if(Szhuangtai =='1'){
			alert("设备为不可使用状态，删除成功！");
			var delform=document.getElementById("delForm");
			delform.submit();
		}
	}
	function xiugai(){
		}
	}
</script>
</body>
</html>