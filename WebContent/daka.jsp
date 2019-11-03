<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="MenJin.entity.Shebei"%>
<%@page import="java.util.List"%>
<%@page import="MenJin.service.ShebeiService"%>
<%@page import="MenJin.service.imple.ShebeiServiceimp"%>
<%@page import="MenJin.dao.impl.ShebeiDaoimp"%>
<%@page import="MenJin.dao.ShebeiDao"%>
<%@page import="MenJin.servlet.dakaServlet"%>
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
<style type="text/css">
	.content-wrapper{margin: 0;}
/* 	.guan{margin: 0;} */
</style>
<script type="text/javascript">
function validate_form(){
	var Sid = document.getElementById("Sid").value;
	var SshebeiId = document.getElementById("SshebeiId").value;
	if(Sid==null || Sid==""){
		  alert("学生编号不能为空，不可以打卡！");
		  return false;
		}
	if(SshebeiId==null || SshebeiId==""){
		alert("设备不能为空，不可以打卡！");
		return false;
	}
	return confirm("人员打卡成功！");
	/* var element = document.getElementById("wenzi");
	element.innerHTML = "设备已经打开";
	document.getElementById("guanmen").src = "AdminLTE-master/dist/img/kaimen-300x209.jpg"; */
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
        <li class="active stu"><a href="login.jsp"><i class="fa fa-circle-o"></i> <span>进入门禁管理系统</span></a></li>
        <!-- <li><a href="shebeiqingkuang.jsp"><i class="fa fa-th"></i> <span>设备管理</span></a></li>
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
        <li><a href="select.jsp"><i class="fa fa-table"></i> <span>地点查看</span></a></li> 
        </li> -->
      </ul>
    </section>
  </aside>
  <div class="content-wrapper">
  <div class="guan" >
	<div class="box-header" >
          <h1 style="margin-top:30px;text-align: center;">
       学生打卡管理
      </h1>
       </div>
    </div>
 <div class="container" onsubmit="return validate_form()" style="width: 950px;">
 	<div class="kaiguan">
 	<table class="tu" >
 		<c:forEach items="${list }" var="she" >
 			<tr role = "row" class="odd" >${she.shebeiId }</tr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 			<tr role = "row" class="odd" >
 			${she.biaoshi== 0?'<img src="AdminLTE-master/dist/img/guanmen-380x400.jpg" id="guanmen">':'<img src="AdminLTE-master/dist/img/kaimen-380x400.jpg" id="kaimen">'}
 			</tr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		</c:forEach>
 	</table>
 	</div>
   	<div>
    	<button type="button" class="btn btn-lg btn-block btn-info btn-primary bg-light-blue-active color-palette xinzenBtn" data-toggle="modal" data-target="#myModal3" style="height: 45px;width: 120px;float:left;margin-top: 50px;margin-bottom: 50px;">打卡</button>
	 </div>  
	  <!-- 模态框  打卡确认 -->
	  <div class="daka">
	  <form id="form3" method="post" action="dakaServlet" name="form3" >  
       <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
           <div class="modal-dialog">
            <div class="modal-content message_align">
               <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                   <span aria-hidden="true">×</span>
                 </button>
                 <h4 class="modal-title">提示</h4>
                 </div>                                                
                   <div class="modal-body">
                  		<div class="form-group">
                          <label for="exampleInputstuno" class="control-label">编号 </label>
                          <input type="text" class="form-control well" id="Sid" name="Sid" value="${sh.id}" placeholder="请输入正确编号" >
                        </div>
                        <div class="form-group">
                            <label for="exampleInputstubanji">打卡设备</label>
                               <input type="text" class="form-control well" id="SshebeiId" name="SshebeiId" value="${sh.shebeiId}" placeholder="请输入打卡设备" >
                         </div>
                     <div class="modal-footer">
                     <button type="reset" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary btn-info quedingBtn" id="add" >确定</button>
                        </div>
                       </div>
                     <!-- /.modal-content -->
                     </div>
                     <!-- /.modal-dialog -->
                  </div>
                  </div>
               </form> 
               </div>      
          <table border="1" style="width:100%; padding-bottom: 20px;">
            <tr>
             <th>序号</th>
             <th>地点</th>
             <th>设备情况</th>
            </tr>
           <%
              ShebeiService shService = new ShebeiServiceimp();
              List<Shebei> list = shService.getAllSgebei();
              session.setAttribute("list", list);		
             %>
             <c:forEach items="${list }" var="sh">
              <tr> 
               <td>${sh.shebeiId }</td>
               <td>${sh.didian }</td>
                <td><c:choose>
				<c:when test="${sh.biaoshi== 1}"> 设备已经打开
                </c:when>
				<c:otherwise> 设备处于关闭状态
                </c:otherwise>
                </c:choose>              
                </td>     
 			</c:forEach> 
          </table>
         <!--  <a href="from.jsp" style="margin-top: 20px;margin-bottom: 20px; float: right;"><span>进门门禁后台管理系统</span></a> -->
           </div>
</div>  
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