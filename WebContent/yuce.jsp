<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title>民航机票代理市场的预测及可视化</title>
	<meta name="description" content="Bootstrap Metro Dashboard">
	<meta name="author" content="Dennis Ji">
	<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->
	
	<!-- start: CSS -->
	<link id="bootstrap-style" href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="css/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="css/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
	<!-- end: CSS -->
	

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link id="ie-style" href="css/ie.css" rel="stylesheet">
	<![endif]-->
	
	<!--[if IE 9]>
		<link id="ie9style" href="css/ie9.css" rel="stylesheet">
	<![endif]-->
		
	<!-- start: Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico">
	<!-- end: Favicon -->
	
		
		
		
</head>

<body>
		<!-- start: Header -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="index.html"><span><img src="img/ico/timg.jpg"></img><img src="img/ico/logo1.png"></img></span></a>	
			</div>
		</div>
	</div>
	<!-- start: Header -->
	
		<div class="container-fluid-full">
		<div class="row-fluid">
				
			<!-- start: Main Menu -->
			<div id="sidebar-left" class="span2">
				<div class="nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li>
							<a class="dropmenu" href="#"><i class="icon-plane"></i><span class="hidden-tablet">机场</span><span class="label label-important"> 2 </span></a>
							<ul>
								<li><a class="submenu" href="jiaoyiguanxi.jsp"><i class="icon-plane"></i><span class="hidden-tablet">交易关系网</span></a></li>
								<li><a class="submenu" href="jiaoyiliangzhanbi.jsp"><i class="icon-plane"></i><span class="hidden-tablet">交易量占比</span></a></li>
							</ul>	
						</li>
						<li>
							<a class="dropmenu" href="#"><i class="icon-user"></i><span class="hidden-tablet">代理人</span><span class="label label-important"> 2 </span></a>
							<ul>
								<li><a class="submenu" href="jiaoyixinxitongji.jsp"><i class="icon-user"></i><span class="hidden-tablet">交易信息统计</span></a></li>
								<li><a class="submenu" href="dailirenxiaoxiangkehua.jsp"><i class="icon-user"></i><span class="hidden-tablet">代理人肖像刻画</span></a></li>
							</ul>	
						</li>
						<li>
							<a class="dropmenu" href="#"><i class="icon-eye-open"></i><span class="hidden-tablet">预测</span><span class="label label-important"> 1 </span></a>
							<ul>
								<li><a class="submenu" href="yuce.jsp"><i class="icon-eye-open"></i><span class="hidden-tablet">预测</span></a></li>
							</ul>	
						</li>
					</ul>
				</div>
			</div>
			<!-- end: Main Menu -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<!-- start: Content -->
			<div id="content" class="span10">
              <ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="index.html">Home</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li><a href="#">预测</a></li>
				<i class="icon-angle-right"></i>
				<li><a href="#">预测</a></li>
			</ul>
			
				<div class="widget" style="height: 600px; width: 900px; border: 1px solid #ccc; padding: 10px;"> 

					<div class="widget-header">
						<h3>文件导出位置为/usr/linux/yuce2.cvs</h3>
					</div> <!-- /widget-header -->

					<div class="widget-content">

						<!-- <div id="main" class="chart-holder" style="height: 500px; width: 800px; border: 1px solid #ccc; padding: 5px;"></div> -->
                           <form> <br>
                   <input type="text" name="agentID" id="agentID" placeholder="代理人id" /> 
                   <br>
<!--                    <input type="submit" name="btn" value="确定" id="btn" style="width:100px;height:30px;" /> -->
                   <button type="submit" class="btn btn-primary" name="btn" value="确定" id="btn">确定</button>
					
                           <table id="datatable" width="95%" border="1">
                              <thead>
                                  <tr>
                                             <th>day_id</th>
                                             <li>第几天(day_id)</li>
                                             <th>sale_id</th>
                                             <li>卖家id(sale_id)</li>
                                             <th>buy_id</th>
                                             <li>买家id(buy_id)</li>
                                             <th>count_num</th>
                                             <li>未来一月总交易次数(count_num)</li>
                                             <th>num</th>
                                             <li>未来一月平均每天交易量(num)</li>
                                             <th>num_count</th>
                                             <li>未来一月平均每天交易钱数(num_count)</li>
                                 </tr>
                              </thead>
                           </table>
                           </form>
					</div> <!-- /widget-content -->

				</div> <!-- /widget -->
	</div><!--/.fluid-container-->
	
			<!-- end: Content -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>Settings</h3>
		</div>
		<div class="modal-body">
			<p>Here settings can be configured...</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a>
			<a href="#" class="btn btn-primary">Save changes</a>
		</div>
	</div>
	
	<div class="common-modal modal fade" id="common-Modal1" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-content">
			<ul class="list-inline item-details">
				<li><a href="#">Admin templates</a></li>
				<li><a href="http://themescloud.org">Bootstrap themes</a></li>
			</ul>
		</div>
	</div>
	
	<div class="clearfix"></div>
	
	<footer>

		<p>
			<span style="text-align:left;float:left">&copy; 2017 <a href="http://www.stdu.edu.cn/" alt="Bootstrap_Metro_Dashboard">石家庄铁道大学 Dance-joker制作</a></span>
			
		</p>

	</footer>
	
	<!-- start: JavaScript-->

		<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/jquery-migrate-1.0.0.min.js"></script>
	
		<script src="js/jquery-ui-1.10.0.custom.min.js"></script>
	
		<script src="js/jquery.ui.touch-punch.js"></script>
	
		<script src="js/modernizr.js"></script>
	
		<script src="js/bootstrap.min.js"></script>
	
		<script src="js/jquery.cookie.js"></script>
	
		<script src='js/fullcalendar.min.js'></script>
	
		<script src='js/jquery.dataTables.min.js'></script>

		<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.js"></script>
	<script src="js/jquery.flot.pie.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	
		<script src="js/jquery.chosen.min.js"></script>
	
		<script src="js/jquery.uniform.min.js"></script>
		
		<script src="js/jquery.cleditor.min.js"></script>
	
		<script src="js/jquery.noty.js"></script>
	
		<script src="js/jquery.elfinder.min.js"></script>
	
		<script src="js/jquery.raty.min.js"></script>
	
		<script src="js/jquery.iphone.toggle.js"></script>
	
		<script src="js/jquery.uploadify-3.1.min.js"></script>
	
		<script src="js/jquery.gritter.min.js"></script>
	
		<script src="js/jquery.imagesloaded.js"></script>
	
		<script src="js/jquery.masonry.min.js"></script>
	
		<script src="js/jquery.knob.modified.js"></script>
	
		<script src="js/jquery.sparkline.min.js"></script>
	
		<script src="js/counter.js"></script>
	
		<script src="js/retina.js"></script>

		<script src="js/custom.js"></script>
	<!-- end: JavaScript-->
	<!-- Placed at the end of the document so the pages load faster -->
<script src="./js/jquery-1.7.2.min.js"></script>
<script src="./js/bootstrap.js"></script>
<script type="text/javascript">
$("#btn").click(function(agentID){
    var agentID = $("#agentID").val();
  
    $.ajax({
        type: 'post', //post方式
        async: false, //是否异步，默认为true
        url: "/work/Yuce1", //发送的接收地址。
         dataType: "json", //返回结果的类型。
        data: {agentID}, //参数
        error: function (xhr) { //如果发生错误，在这里处理或提示
        alert("546");
        },
        success: function (str) { //如果成功，返回一个结果，在这里处理
        alert("success");
        alert("文件已导出到相应路径！");

       }
        

    });
});
</script>
</body>
</html>
