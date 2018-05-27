<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<link rel="icon" type="image/png" href="../assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>指南者——自行车仓库管理系统</title>
    <!--  Social tags      -->
    <meta name="keywords" content="指南者——自行车仓库管理系统">
    <!-- Bootstrap core CSS     -->
    <link href="../css/bootstrap.min.css" rel="stylesheet" />     
    <link href="../css/light-bootstrap-dashboard.css" rel="stylesheet"/> 
    <link href="../css/demo.css" rel="stylesheet" />
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href='../css/685fd913f1e14aebad0cc9d3713ee469.css' rel='stylesheet' type='text/css'>
    <link href="../css/pe-icon-7-stroke.css" rel="stylesheet" />
</head>
<body> 
<div class="wrapper wrapper-full-page">
    <div class="full-page register-page" data-color="black" data-image="../picture/full-screen-image-3.jpg">

        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="header-text">
                            <h2>指南者——自行车仓库管理系统</h2>
                            <h4> Compass —— Bicycle warehouse management system</h4>
                            <hr />
                        </div>
                    </div>
                    <div class="col-md-4 col-md-offset-2">
                        <div class="media">
                            <div class="media-left">
                                <div class="icon">
                                    <i class="pe-7s-user"></i>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4>精准管理</h4>
                                管理人员实时追踪项目所需物料的状态和入库预期，真正做到按需采购，降低安全库存
                            </div>
                        </div>

                        <div class="media">
                            <div class="media-left">
                                <div class="icon">
                                    <i class="pe-7s-graph1"></i>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4>精准定位</h4>
                                根据项目排期按需发起库存启用和采购需求

                            </div>
                        </div>

                        <div class="media">
                            <div class="media-left">
                                <div class="icon">
                                    <i class="pe-7s-headphones"></i>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4>精准量化</h4>
                               精确到任务，实时更新订单计划情况和进出库数据表,存储数据可视化

                            </div>
                        </div>

                    </div>
                    <div class="col-md-4 col-md-offset-s1">
                        <form id="login_form">
                            <div class="card card-plain">
                                <div class="content">
                                    <div class="form-group">
                                       <input type="text" id="userID" class="form-control" placeholder="工号" name="userID">
                                    </div>
                                    <div class="form-group">
                                       <input type="password" id="password" class="form-control" placeholder="密码" name="password">
                                    </div>
                                   <div class="form-group">
                                        <label>
								      	<input type="text" id="checkCode" class="form-control" placeholder="验证码" name="checkCode"></label>
										<img id="checkCodeImg" alt="checkCodeImg" src="account/checkCode/1">
                                   </div>   
                                </div>
                                <div class="footer text-center">
                                    <button type="submit" class="btn btn-fill btn-neutral btn-wd">确认登录</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    	
    	<footer class="footer footer-transparent">
            <div class="container">            
                <p class="copyright pull-right">
                    <a href="#">&copy;2018 孙含琦 毕业设计——基于分类算法的自行车仓库管理平台</a>
                </p>
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
      <!--   Core JS Files and PerfectScrollbar library inside jquery.ui   -->
    <script src="../js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="../js/jquery-ui.min.js" type="text/javascript"></script> 
	<script src="../js/bootstrap.min.js" type="text/javascript"></script>
	<script src="../js/jquery.validate.min.js"></script>
	<script src="../js/light-bootstrap-dashboard.js"></script>
	<script type="text/javascript" src="../js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="../js/jquery.md5.js"></script>
    <script src="js/demo.js"></script>
    <script src="js/login.js"></script>
    <script type="text/javascript">
        $().ready(function(){
            lbd.checkFullPageBackgroundImage();
        });
    </script>
    
   
</html>