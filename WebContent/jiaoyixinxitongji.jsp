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
				<li><a href="#">代理人</a></li>
				<i class="icon-angle-right"></i>
				<li><a href="#">交易信息统计</a></li>
			</ul>
			<input type="text" name="agentID" id="agentID" placeholder="代理人id" /> 
                   <br>
                   <input type="button" name="查询" value="确定" id="01" style="width:100px;height:30px;"/>
					
					<div class="widget-content" >
                           
						<div id="main" class="chart-holder" style="height: 700px; width: 1000px; border: 1px solid #ccc; padding: 5px;"></div>

					</div> <!-- /widget-content -->
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

<script src="js/echarts(1).js"></script>


	    
	    
	
<script type="text/javascript"> 

var myChart = echarts.init(document.getElementById('main'));
myChart.setOption({
	    title : {
	        text: '某代理商代理特征',
	        subtext: '虚线为平均量'
	    },
	    tooltip : {
	    	
	        trigger: 'axis'
	    },
	    legend: {
	        data:['买入量','出售量']
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            dataView : {show: true, readOnly: true},
	            magicType : {show: true, type: ['line', 'bar']},
	            restore : {show: true},
	            saveAsImage : {show: true}
	        }
	    },
	    calculable : true,
	    xAxis : [
	        {
	            /* type : 'category', */
	            name:'天',
	            data : [  '1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22'
	            	,'23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','43'
	            	,'44','45','46','47','48','49','50','51','52','53','54','55','56','57','58','59','60','61','62','63','64'
	            	,'65','66','67','68','69','70','71','72','73','74','75','76','77','78','79','80','81','82','83','84','85'
	            	,'86','87','88','89','90','91' ]
	        }],
	    yAxis : 
	    	[{
	           /*  type : 'value' */
	        }],
	    series : [{
	            name:'出售量',
	            type:'bar',
	            data:[],
	            markPoint : {
	                data : [
	                 /*    {type : 'max', name: '最大值'},
	                    {type : 'min', name: '最小值'} */  
	                ]},
	            markLine : {
	                data : [
	                    /* {type : 'average', name: '平均值'}  */ 
	                ]}
	        },
	        {
	            name:'买入量',
	            type:'bar',
	            data:[], 
	            markPoint : {
	                data : [
	                    
	                ]
	            },
	            markLine : {
	                data : [
	                     {type : 'average', name : '平均值'} 
	                ]
	            }
	        }
]
	});

myChart.showLoading();

$("#01").click(function(agentID){
	var array=[];
	var array2=[];
   var agentID = $("#agentID").val();
    $.ajax({
        type: 'post', //post方式
        async: true, //是否异步，默认为true
        url: "/work/Agentsearch", //发送的接收地址。
        dataType: "json",//返回结果的类型。
        data: {agentID}, //参数
        error: function (xhr) { //如果发生错误，在这里处理或提示
        },
        success: function (str) { //如果成功，返回一个结果，在这里处理
        alert("success!");
        /* alert(str.data[1].item2); */ 
     
       	 for(var i=0;i<92;i++)
       		{
       			array[i]=str.data[i].item2;
       			array2[i]=str.data[i].item;
       		}       
        }
     
    });     


  //  alert();
  /*   alert(array);
    alert(array2); */
   alert(" Please wait..."); 
    myChart.hideLoading();
    myChart.setOption({
   	    title : {
   	        text: '某代理商代理特征',
   	        subtext: '虚线为平均量'
   	    },
   	    tooltip : {
   	    	
   	        trigger: 'axis'
   	    },
   	    legend: {
   	        data:['出售量','买入量']
   	    },
   	    toolbox: {
   	        show : true,
   	        feature : {
   	            dataView : {show: true, readOnly: true},
   	            magicType : {show: true, type: ['line', 'bar']},
   	            restore : {show: true},
   	            saveAsImage : {show: true}
   	        }
   	    }, 
   	    calculable : true,
   	    xAxis : [
   	        {
   	            type : 'category',
   	            name:'天',
   	            data : [ '1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22'
   	            	,'23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38','39','40','41','42','43'
   	            	,'44','45','46','47','48','49','50','51','52','53','54','55','56','57','58','59','60','61','62','63','64'
   	            	,'65','66','67','68','69','70','71','72','73','74','75','76','77','78','79','80','81','82','83','84','85'
   	            	,'86','87','88','89','90','91']
   	        }],
   	    yAxis : 
   	    	[{
   	            type : 'value'
   	        }],
   	    series : [
   	    	{
   	            name:'出售量',
   	            type:'bar',
   	            data:array,
   	            markPoint : {
   	                data : [
   	                    {type : 'max', name: '最大值'},
   	                    {type : 'min', name: '最小值'}  
   	                ]},
   	            markLine : {
   	                data : [
   	                    {type : 'average', name: '平均值'}  
   	                ]}
   	        },
   	        {
   	            name:'买入量',
   	            type:'bar',
   	            data:array2, 
   	            markPoint : {
   	                data : [
   	                	{type : 'max', name: '最大值'},
   	                    {type : 'min', name: '最小值'}  

   	                ]
   	            },
   	            markLine :{
   	                data : [
   	                    {type : 'average', name : '平均值'}
   	                ]
   	            }
   	        }
   	        ]
   	            
   	        
   	});


});


 

  /* myChart.setOption(option); */

   

 </script>
</body>
</html>
