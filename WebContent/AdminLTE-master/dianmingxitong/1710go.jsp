<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

  <title>AdminLTE 2 | Starter</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="../bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="../bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href="../dist/css/skins/skin-blue.min.css">

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<title>点名系统</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="../index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Admin</b>LTE</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <img src="../dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs">软件1710</span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                <p>
                  1710V587
                </p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="../dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>软件1710</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
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

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">HEADER</li>
        <!-- Optionally, you can add icons to the links -->
        <li class="active"><a href="#"><i class="fa fa-user"></i> <span>学生管理</span></a></li>
        <li><a href="#"><i class="fa fa-reorder (alias)"></i> <span>班级管理</span></a></li>
        <li class="treeview">
          <a href="#"><i class="fa fa-hand-stop-o (alias)"></i> <span>点名</span>
            <!-- <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span> -->
          </a>
          <!-- <ul class="treeview-menu">
            <li><a href="#">Link in level 2</a></li>
            <li><a href="#">Link in level 2</a></li>
          </ul> -->
        </li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        学生管理
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
        <li class="active">学生管理</li>
      </ol>
    </section>

    <section class="contet ">
        <button type="button" class="btn btn-lg btn-block btn-info btn-primary bg-light-blue-active color-palette" data-toggle="modal" data-target="#myModal" style="width:9%;margin: 15px;">新增</button>
          <!-- 模态框（Modal） -->
          <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                  </button>
                  <h4 class="modal-title">新增学生</h4>
                </div>
                <div class="modal-body">
                    <div class="box-body">
                        <div class="form-group">
                          <label for="exampleInputEmail1">学号 <i style="color:red">*</i></label>
                          <input type="text" class="form-control" id="exampleInputEmail1" placeholder="请输入学号">
                        </div>
                        <div class="form-group">
                          <label for="exampleInputEmail1">姓名</label>
                          <input type="text" class="form-control" id="exampleInputEmail1" placeholder="请输入姓名">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">拼音</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" placeholder="请输入拼音">
                        </div>
                        <div class="form-group">
                          <label for="exampleInputPassword1">密码</label>
                          <input type="password" class="form-control" id="exampleInputPassword1" placeholder="请输入密码">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">性别</label>
                            <br>
                            <input type="radio" name="xb"  id="boy" checked >男
                            <br>
                            <input type="radio" name="xb"  id="girl" >女
                          </div>
                        <div class="form-group">
                          <label for="exampleInputFile">头像</label>
                          <input type="file" id="exampleInputFile">
        
                          <p class="help-block">请选择头像</p>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputFile">班级</label>
                            <select class="form-control">
                                <option>软件1710</option>
                                <option>软件1711</option>
                                <option>互联171</option>
                              </select>
                          </div>
                          <form action="" method="get">
                              <label for="exampleInputFile">离开</label>
                              <label><input name="likai" type="checkbox" value="离开"></label>
                              <!-- <label><input name="likai" type="checkbox" value="不离开"></label> -->
                          </form>
                      </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">确定</button>
                  </div>
              </div><!-- /.modal-content -->
            </div><!-- /.modal -->

          </div>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

      <!--------------------------
        | Your Page Content Here |
        -------------------------->
      <!--
        代码写这里
      -->

      <div class="box">
        <div class="box-header">
          <h3 class="box-title">学生管理</h3>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
          <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap"><div class="row"><div class="col-sm-6"></div><div class="col-sm-6"></div></div><div class="row"><div class="col-sm-12"><table id="example2" class="table table-bordered table-hover dataTable" role="grid" aria-describedby="example2_info">
            <thead>
            <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Rendering engine: activate to sort column descending">编号</th><th rowspan="1" colspan="1">姓名</th><th rowspan="1" colspan="1">拼音</th><th rowspan="1" colspan="1">学号</th><th rowspan="1" colspan="1">性别</th><th rowspan="1" colspan="1">头像</th><th rowspan="1" colspan="1">班级</th><th rowspan="1" colspan="1">操作</th></tr>
            </thead>
            <tbody action="DBCPdEMO" method="get">
            <tr role="row" class="odd">
              <td class="sorting_1">1</td>
              <td>陈唯</td>
              <td>chenwei</td>
              <td>15895061655</td>
              <td>女</td>
              <td>A</td>              
              <td>软件1710</td>   
              <td><button type="button" class="btn btn-block btn-success" data-toggle="modal" data-target="#myModal" style="width:45%; float: left; margin: 5px;">修改</button>
                <button type="button" class="btn btn-block btn-danger"  data-toggle="modal" data-target="#myModal1"  style="width:45%; float: left;">删除</button>
 
                <!-- 模态框（Modal） -->
                <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                          &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                          删除
                        </h4>
                      </div>
                      <div class="modal-body">
                        你确定要删除信息吗？
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消
                        </button>
                        <button type="button" class="btn btn-primary">
                          确定
                        </button>
                      </div>
                    </div><!-- /.modal-content -->
                  </div><!-- /.modal -->
              </td>
            </tr><tr role="row" class="even">
              <td class="sorting_1">2</td>
              <td>李广益</td>
              <td>liguangyi</td>
              <td>17091231011</td>
              <td>男</td>
              <td>A</td>           
              <td>软件1710</td>   
              <td><button type="button" class="btn btn-block btn-success" data-toggle="modal" data-target="#myModal" style="width:45%; float: left; margin: 5px;">修改</button>
                <button type="button" class="btn btn-block btn-danger" data-toggle="modal" data-target="#myModal1" style="width:45%; float: left;">删除</button></td>
            </tr><tr role="row" class="odd">
              <td class="sorting_1">3</td>
              <td>张益飞</td>
              <td>zhangyifei</td>
              <td>15061939161</td>
              <td>男</td>
              <td>A</td>
              <td>软件1710</td>   
              <td><button type="button" class="btn btn-block btn-success" data-toggle="modal" data-target="#myModal" style="width:45%; float: left; margin: 5px;">修改</button>
                <button type="button" class="btn btn-block btn-danger" data-toggle="modal" data-target="#myModal1" style="width:45%; float: left;">删除</button></td>
            </tr> </tbody>
          </table></div></div>
        </div>
        <!-- /.box-body -->
      </div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.
  </footer>

</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3 -->
<script src="../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
</body>
</html>