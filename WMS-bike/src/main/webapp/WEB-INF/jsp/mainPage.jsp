<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="../assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>指南者——自行车仓库管理系统</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/light-bootstrap-dashboard.css" rel="stylesheet" />
<link href="css/demo.css" rel="stylesheet" />
<link href="css/jquery.mloading.css" rel="stylesheet" />
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href='css/685fd913f1e14aebad0cc9d3713ee469.css' rel='stylesheet' type='text/css'>
<link href="css/pe-icon-7-stroke.css" rel="stylesheet" />
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css">
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css">
<link href="css/jquery.autocomplete.css" rel="stylesheet" type="text/css">
</head>
<body data-type="chart">

		<!--左侧导航栏 Starting-->
		<div class="sidebar" data-color="block"
			data-image="../picture/full-screen-image-4.jpg">
			<div class="logo">
				<a href="#" class="logo-text"> ${sessionScope.userInfo.userName} </a>
			</div>
		

			<div class="sidebar-wrapper">
				<div class="user">
					<div class="photo">
						<img src="picture/default-avatar.png" />
					</div>
					<div class="info">
						<a data-toggle="collapse" href="#collapseExample"
							class="collapsed"> 工号：&nbsp&nbsp ${sessionScope.userInfo.userID} <b class="caret"></b>
						</a>
						<div class="collapse" id="collapseExample">
							<ul class="nav">
								<li><a href="javascript:void(0)" class="menu_item" name="pagecomponent/userInfo.jsp" title="个人信息">个人信息</a></li>
								<li><a href="javascript:void(0)" class="menu_item" name="pagecomponent/passwordModification.jsp" title="修改密码">修改密码</a></li>
							</ul>
						</div>
					</div>
				</div>

				<ul class="nav">
					<li class="active"><a href="#"> <i
							class="pe-7s-graph"></i>
							<p>首页</p>
					</a></li>
					<li><a data-toggle="collapse" href="#componentsExamples">
							<i class="pe-7s-plugin"></i>
							<p>
								库存管理 <b class="caret"></b>
							</p>
					</a>
						<div class="collapse" id="componentsExamples">
							<ul class="nav">
							    <shiro:hasRole name="commonsAdmin">
							    	<li><a href="javascript:void(0)" class="menu_item"  name="pagecomponent/storageManagementCommon.jsp" title="库存查询">库存查询</a></li>
							    </shiro:hasRole>
								<shiro:hasRole name="systemAdmin">
									<li><a href="javascript:void(0)" class="menu_item"  name="pagecomponent/storageManagement.jsp" title="库存查询">库存查询</a></li>
									<li><a href="javascript:void(0)" class="menu_item"  name="pagecomponent/stockRecordManagement.jsp" title="出入库记录">出入库记录</a></li>
								</shiro:hasRole>
							</ul>
						</div></li>

					<li><a data-toggle="collapse" href="#formsExamples"> <i
							class="pe-7s-note2"></i>
							<p>
								出入库管理 <b class="caret"></b>
							</p>
					</a>
						<div class="collapse" id="formsExamples">
						    <shiro:hasRole name="systemAdmin">
								<ul class="nav">
									<li><a href="javascript:void(0)" class="menu_item"  name="pagecomponent/stock-inManagement.jsp" title="货物入库">货物入库</a></li>
									<li><a href="javascript:void(0)" class="menu_item"  name="pagecomponent/stock-outManagement.jsp" title="货物出库">货物出库</a></li>
								</ul>
							 </shiro:hasRole>
							 <shiro:hasRole name="commonsAdmin">
								<ul class="nav">
									<li><a href="javascript:void(0)" class="menu_item"  name="pagecomponent/stock-inManagementCommon.jsp" title="货物入库">货物入库</a></li>
									<li><a href="javascript:void(0)" class="menu_item"  name="pagecomponent/stock-outManagementCommon.jsp" title="货物出库" >货物出库</a></li>
								</ul>
							 </shiro:hasRole>
						</div></li>


				 <shiro:hasRole name="systemAdmin">
					<li><a data-toggle="collapse" href="#tablesExamples"> <i
							class="pe-7s-users"></i>
							<p>
								人员管理 <b class="caret"></b>
							</p>
					</a>
						<div class="collapse" id="tablesExamples">
							<ul class="nav">
								<li><a href="javascript:void(0)" class="menu_item"  name="pagecomponent/repositoryAdminManagement.jsp" title="仓库管理员管理">仓库管理员管理</a></li>
							</ul>
						</div></li>
			    </shiro:hasRole>	
						
                <shiro:hasRole name="systemAdmin">
					<li><a data-toggle="collapse" href="#mapsExamples"> <i
							class="pe-7s-graph1"></i>
							<p>
								基础数据 <b class="caret"></b>
							</p>
					</a>
						<div class="collapse" id="mapsExamples">
							<ul class="nav">
								<li><a href="javascript:void(0)" class="menu_item"  name="pagecomponent/supplierManagement.jsp" title="供应商信息管理" >供应商信息管理</a></li>
								<li><a href="javascript:void(0)" class="menu_item"  name="pagecomponent/customerManagement.jsp" title="客户信息管理" >客户信息管理</a></li>
								<li><a href="javascript:void(0)" class="menu_item"  name="pagecomponent/goodsManagement.jsp" title="货物信息管理">货物信息管理</a></li>
								<li><a href="javascript:void(0)" class="menu_item"  name="pagecomponent/repositoryManagement.jsp" title="仓库信息管理">仓库信息管理</a></li>
							</ul>
						</div></li>

 		       </shiro:hasRole>
 		       <shiro:hasRole name="systemAdmin">
					<li><a data-toggle="collapse" href="#pagesExamples"> <i
							class="pe-7s-config"></i>
							<p>
								系统维护 <b class="caret"></b>
							</p>
					</a>
						<div class="collapse" id="pagesExamples">
							<ul class="nav">
								<li><a href="javascript:void(0)" class="menu_item"  name="pagecomponent/userOperationRecorderManagement.jsp" title="系统日志">系统日志</a></li>
								<li><a href="javascript:void(0)" class="menu_item"  name="pagecomponent/accessRecordManagement.jsp" title="登录日志">登录日志</a></li>
							</ul>
						</div></li>
			 </shiro:hasRole>
				</ul>
			</div>
		</div>
		<!--左侧导航栏 Ending-->
		
		
		<div class="main-panel">
			<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-minimize">
					<button id="minimizeSidebar"
						class="btn btn-warning btn-fill btn-round btn-icon">
						<i class="fa fa-ellipsis-v visible-on-sidebar-regular"></i> <i
							class="fa fa-navicon visible-on-sidebar-mini"></i>
					</button>
				</div>
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<span class="navbar-brand" >首页</span>
				</div>
				<div class="collapse navbar-collapse">

					<form class="navbar-form navbar-left navbar-search-form"
						role="search">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-search"></i></span>
							<input type="text" value="" class="form-control"
								placeholder="搜索...">
						</div>
					</form>

					<ul class="nav navbar-nav navbar-right">
						<li><a href="javascript:void(0)" class="menu_item"  name="pagecomponent/chart.jsp" title="数据统计"> <i class="fa fa-line-chart"></i>
								<p>数据统计</p>
						</a></li>

						<li><a href="javascript:void(0)" class="menu_item"  name="pagecomponent/calendar.jsp" title="工作日历"> <i class="fa fa-gavel"></i>
								<p>工作日历</p>
						</a></li>
						<li class="divider"></li>
						<li><a href="javascript:void(0)" id="signOut" class="text-danger"> <i
										class="pe-7s-close-circle"></i> 退出
					    </a></li>

					</ul>
				</div>
			</div>
			</nav>
			
	   <!-- 设置动态加载区域  starting -->		
			<div  class="content">
				<div class="container-fluid" id="panel">

			   </div>
			</div>
	   <!-- 设置动态加载区域  ending -->


<!-- 提示消息模态框 -->
<div class="modal fade" id="global_info_modal" table-index="-1" role="dialog"
    aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal"
                    aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">信息</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-4 col-sm-4"></div>
                    <div class="col-md-4 col-sm-4">
                        <div id="info_success" class=" hide" style="text-align: center;">
                            <img src="media/icons/success-icon.png" alt=""
                                style="width: 100px; height: 100px;">
                        </div>
                        <div id="info_error" style="text-align: center;">
                            <img src="media/icons/error-icon.png" alt=""
                                style="width: 100px; height: 100px;">
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4"></div>
                </div>
                <div class="row" style="margin-top: 10px">
                    <div class="col-md-3"></div>
                    <div class="col-md-6" style="text-align: center;">
                        <h4 id="info_summary"></h4>
                    </div>
                    <div class="col-md-3"></div>
                </div>
                <dic class="row" style="margin-top: 10px">
                    <div class="col-md-3"></div>
                    <div class="col-md-6" style="text-align: center;">
                        <p id='info_content'></p>
                    </div>
                    <div class="col-md-3"></div>
                </dic>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" type="button" data-dismiss="modal">
                    <span>&nbsp;&nbsp;&nbsp;关闭&nbsp;&nbsp;&nbsp;</span>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 初始密码修改框 -->
<div class="modal fade" id="init_password_modify" table-index="-1" role="dialog"
    aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">修改初始密码</h4>
            </div>
            <div class="modal-body">
                <div class="row" style="margin-top: 25px">
                    <div class="col-md-1 col-sm-1"></div>
                    <div class="col-md-10 col-sm-10">

                        <form action="" class="form-horizontal" style=""
                            role="form" id="form">
                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> 用户ID: </label>
                                <div class="col-md-6 col-sm-6">
                                    <span class="hidden" id="userID">${sessionScope.userInfo.userID }</span>
                                    <span class="hidden" id="isFirstLogin">${sessionScope.userInfo.firstLogin}</span>
                                    <p class="form-control-static">${sessionScope.userInfo.userID }</p>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> 输入原密码: </label>
                                <div class="col-md-6 col-sm-6">
                                    <input type="password" class="form-control" id="oldPassword"
                                        name="oldPassword">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> 输入新密码: </label>
                                <div class="col-md-6 col-sm-6">
                                    <input type="password" class="form-control" id="newPassword"
                                        name="newPassword">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="" class="control-label col-md-4 col-sm-4"> 确认新密码: </label>
                                <div class="col-md-6 col-sm-6 has-feedback">
                                    <input type="password" class="form-control" id="newPassword_re"
                                        name="newPassword_re">
                                </div>
                            </div>
                            <input id="reset" type="reset" style="display:none">
                        </form>

                    </div>
                    <div class="col-md-1 col-sm-1"></div>
                </div>

                <div class="row">
                    <div class="col-md-1 col-sm-1"></div>
                    <div class="col-md-10 col-sm-10">
                        <div class="alert alert-info" style="margin-top: 25px">
                            <p>登录密码修改规则说明：</p>
                            <p>1.密码长度为6~16位，建议包含数字、字母、特殊符号中的两类，字母区分大小写</p>
                            <p>2.密码不可与账号相同</p>
                        </div>
                    </div>
                    <div class="col-md-1 col-sm-1"></div>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" id="init_password_modify_submit">
                    <span>&nbsp;&nbsp;&nbsp;确定修改&nbsp;&nbsp;&nbsp;</span>
                </button>
            </div>
        </div>
    </div>
</div>

      		 <footer class="footer">
					<div class="container-fluid">
						<p class="copyright pull-right">&copy; 2018 孙含琦
							毕业设计——基于分类算法的自行车仓库管理平台</p>
					</div>
			</footer>

<div class="fixed-plugin">
    <div class="dropdown show-dropdown">
        <a href="#" data-toggle="dropdown">
        <i class="fa fa-cog fa-2x"> </i>
        </a>
        <ul class="dropdown-menu">
            <li class="header-title">个性服务</li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger">
                    <p>背景风格</p>
                    <div class="switch"
                        data-on-label="ON"
                        data-off-label="OFF">
                        <input type="checkbox" checked/>
                    </div>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="adjustments-line">
                <a href="javascript:void(0)" class="switch-trigger">
                    <p>滤镜</p>
                    <div class="pull-right">
                        <span class="badge filter" data-color="black"></span>
                        <span class="badge filter badge-azure" data-color="azure"></span>
                        <span class="badge filter badge-green" data-color="green"></span>
                        <span class="badge filter badge-orange active" data-color="orange"></span>
                        <span class="badge filter badge-red" data-color="red"></span>
                        <span class="badge filter badge-purple" data-color="purple"></span>
                    </div>
                    <div class="clearfix"></div>
                </a>
            </li>
            <li class="header-title">背景图片</li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../picture/full-screen-image-1.jpg">
                </a>
            </li>
            <li class="active">
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../picture/full-screen-image-2.jpg">
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../picture/full-screen-image-3.jpg">
                </a>
            </li>
            <li>
                <a class="img-holder switch-trigger" href="javascript:void(0)">
                    <img src="../picture/full-screen-image-4.jpg">
                </a>
            </li>

           
        </ul>
    </div>
</div>
			
</body>
<!-- <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>  -->
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<script src="js/moment.min.js" type="text/javascript"></script>
<script src="js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
<script src="js/bootstrap-selectpicker.js" type="text/javascript"></script>
<script src="js/bootstrap-checkbox-radio-switch-tags.js" type="text/javascript"></script>
<script src="js/bootstrap-notify.js" type="text/javascript"></script>
<script src="js/sweetalert2.js" type="text/javascript"></script>
<script src="js/jquery.bootstrap.wizard.min.js" type="text/javascript"></script>
<script src="js/jquery.datatables.js" type="text/javascript"></script>
<script src="js/light-bootstrap-dashboard.js" type="text/javascript"></script>
<script src="js/demo.js"></script>


<!-- 自定义添加 -->
<script src="js/mainPage.js" type="text/javascript"></script>
<script src="js/jquery.mloading.js" type="text/javascript"></script>
<script src="js/bootstrapValidator.min.js" type="text/javascript"></script>
<script src="js/bootstrap-table.min.js" type="text/javascript"></script>
<script src="js/bootstrap-table-zh-CN.min.js" type="text/javascript" ></script>
<script src="js/jquery.md5.js" type="text/javascript" ></script>




</html>
