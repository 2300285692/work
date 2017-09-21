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
				<li><a href="#">机场</a></li>
				<i class="icon-angle-right"></i>
				<li><a href="#">交易量占比</a></li>
			</ul>
			 <input type="text" name="agentID" id="agentID" placeholder="机场id" /> 
			  <input type="text" name="agent" id="agent" placeholder="代理人id" /> 
                   <br>
                   <input type="button" name="查询" value="确定" id="queren" style="width:100px;height:30px;"/>
		<div class="widget-content">

						<div id="main" class="chart-holder" style="height: 600px; width: 1000px; border: 1px solid #ccc; padding: 1px;"></div>
           
           </div>
            
			

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
//基于准备好的dom，初始化echarts实例
  var myChart = echarts.init(document.getElementById('main'));
 var dataAll =[692.1812650, 684.7740670, 328.1205860, 301.6723640,  295.5576550, 271.6370420, 261.7411710, 259.5348930, 231.3697645, 204.7438818];
	var yAxisData =['O5234','O5255','O4706','O2508','O3815','O3816','O5875','O160','O4975','O5953'];
   myChart.setOption({ 
	  backgroundColor: '#0f375f',
	    title:[
	        {text:"全市场地位",x: '2%', y: '1%',textStyle:{color:"#fff",fontSize:"14"}},
	        {text:"全市场TOP10(单位:百万)",x: '40%', y: '1%',textStyle:{color:"#fff",fontSize:"14"}},
	        {text:"机场地位",x: '2%', y: '50%',textStyle:{color:"#fff",fontSize:"14"}},
	    ],
	    grid: [
	        {x: '50%', y: '7%', width: '45%', height: '90%'},
	    ],
	    tooltip: {
	        formatter: '{b} ({c})'
	    },
	    xAxis: [
	        {gridIndex: 0, axisTick: {show:false},axisLabel: {show:false},splitLine: {show:false},axisLine: {show:false }},
	    ],
	    yAxis: [
	         {  gridIndex: 0, interval:0,data:yAxisData.reverse(),
	            axisTick: {show:false}, axisLabel: {show:true},splitLine: {show:false},
	            axisLine: {show:true,lineStyle:{color:"#6173a3"}},
	        }
	    ],
	   
	    series: [
	        {
	            name: '各渠道投诉占比',
	            type: 'pie',
	            radius : '30%',
	            center: ['22%', '25%'],
	            color:['#86c9f4','#4da8ec'],
	            data:[
	               /*  {value:array[1], name:'代理人'},
	                 {value:(195150989696-array[1]), name:'其他'}, */
	            ],
	            labelLine:{normal:{show:false}},
	            itemStyle: {normal: {label:{ show: true,  formatter: '{b} \n ({d}%)', textStyle:{color:'#B1B9D3'}} },},
	        },
	        {
	            name: '各级别投诉占比',
	            type: 'pie',
	            radius : '30%',
	            center: ['22%', '75%'],
	            color:['#86c9f4','#4da8ec'],
	            labelLine:{normal:{show:false}},
	            data:[
	                /* {value:array2[1], name:'代理人'},
	                {value:array1[2]-array2[1], name:'其他'},
	                 */
	            ],
	            itemStyle: {normal: {label:{ show: true,  formatter: '{b} \n ({d}%)', textStyle:{color:'#B1B9D3'}} },},
	        },
	        {
	            name: '投诉原因TOP10',
	            type: 'bar',xAxisIndex: 0,yAxisIndex: 0,barWidth:'45%',
	            itemStyle:{normal:{color:'#86c9f4'}},
	            label:{normal:{show:true, position:"right",textStyle:{color:"#9EA7C4"}}},
	            data: dataAll.sort(),
	        },
	        
	    ]
	
  });
   alert("3");
  myChart.showLoading();
$("#queren").click(function(){
	var array=[];
	var array1=[];
	var array2=[];
	var sum1=[];
   var agentID = $("#agentID").val();
   var agent = $("#agent").val();
    $.ajax({
        type: 'post', //post方式
        async: true, //是否异步，默认为true
        url: "/work/kehuaServlet", //发送的接收地址。
        dataType: "json",//返回结果的类型。
        data: {"agentID":agentID,"agent":agent}, //参数
        error: function (xhr) { //如果发生错误，在这里处理或提示
        },
        success: function (str) { //如果成功，返回一个结果，在这里处理
        alert("success!");
    
     
       	 for(var i=0;i<3;i++)
       		{
       			array[i]=str.data[i].item;
       			array1[i]=str.data[i].item1;
       			array2[i]=str.data[i].item2;
       		}      
       	sum1[0]=195150989696-array[1];
       	sum1[1]=array1[2]-array2[1];
       	
        }
       
    });  

  
    myChart.hideLoading();
 /*  var dataAll = [ 692.1812650, 684.7740670, 328.1205860, 301.6723640,  295.5576550, 271.6370420, 261.7411710, 259.5348930, 231.3697645, 204.7438818];
	var yAxisData = ['O5234','O5255','O4706','O2508','O3815','O3816','O5875','O160','O4975','O5953'];
	 */
	 alert(sum1[0]);
	alert(sum1[1]);
	 myChart.setOption({
		    backgroundColor: '#0f375f',
		    title:[
		        {text:"全市场地位",x: '2%', y: '1%',textStyle:{color:"#fff",fontSize:"14"}},
		        {text:"全市场TOP10(单位:百万)",x: '40%', y: '1%',textStyle:{color:"#fff",fontSize:"14"}},
		        {text:"机场地位",x: '2%', y: '50%',textStyle:{color:"#fff",fontSize:"14"}},
		    ],
		    grid: [
		        {x: '50%', y: '7%', width: '45%', height: '90%'},
		    ],
		    tooltip: {
		        formatter: '{b} ({c})'
		    },
		    xAxis: [
		        {gridIndex: 0, axisTick: {show:false},axisLabel: {show:false},splitLine: {show:false},axisLine: {show:false }},
		    ],
		    yAxis: [
		         {  gridIndex: 0, interval:0,data:yAxisData.reverse(),
		            axisTick: {show:false}, axisLabel: {show:true},splitLine: {show:false},
		            axisLine: {show:true,lineStyle:{color:"#6173a3"}},
		        }
		    ], 
		    series: [
		        {
		            name: '各渠道投诉占比',
		            type: 'pie',
		            radius : '30%',
		            center: ['22%', '25%'],
		            color:['#86c9f4','#4da8ec'],
		            data:[
		                {value:array[1]*100, name:'代理人'},
		                 {value:sum1[0], name:'其他代理人'},
		            ],
		            labelLine:{normal:{show:false}},
		            itemStyle: {normal: {label:{ show: true,  formatter: '{b} \n ({d}%)', textStyle:{color:'#B1B9D3'}} },},
		        },
		        {
		            name: '各级别投诉占比',
		            type: 'pie',
		            radius : '30%',
		            center: ['22%', '75%'],
		            color:['#86c9f4','#4da8ec'],
		            labelLine:{normal:{show:false}},
		            data:[
		                {value:array2[1]*10000, name:'代理人'},
		                {value:sum1[1], name:'其他代理人'},
		                
		            ],
		            itemStyle: {normal: {label:{ show: true,  formatter: '{b} \n ({d}%)', textStyle:{color:'#B1B9D3'}} },},
		        },
		        {
		            name: '投诉原因TOP10',
		            type: 'bar',xAxisIndex: 0,yAxisIndex: 0,barWidth:'45%',
		            itemStyle:{normal:{color:'#86c9f4'}},
		            label:{normal:{show:true, position:"right",textStyle:{color:"#9EA7C4"}}},
		            data: dataAll.sort(),
		        },
		        
		    ]
		});
                    
 
});  

</script>
</body>
</html>
