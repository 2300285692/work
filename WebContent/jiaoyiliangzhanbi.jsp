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
	<style>
#ma{ width:1000px;}
#left{ width:300px;height:600px;  float:left;}
#center{ width:400px; height:600px;float:left;}
#right{ width:280px; height:600px; float:left;}
</style>
		
		
		
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
			
			<div class="widget-content">

						<div id="main" class="chart-holder" style="height: 600px; width: 1000px; border: 1px solid #ccc; padding: 1px;"></div>
           
           </div>
             <input type="text" name="agentID" id="agentID" placeholder="机场id" /> 
                   <br>
                   <input type="button" name="查询" value="确定" id="queren" style="width:100px;height:30px;"/>
		<!--</div> 
			<div id="main1" class="chart-holder" style="height: 600px; width: 900px; border: 1px solid #ccc; padding: 1px;">
			  -->	
			
			
<div id="ma">
<div id="left" class="chart-holder" style=" border: 1px solid #ccc; padding: 1px"></div>
<div id="center" class="chart-holder" style=" border: 1px solid #ccc; padding: 1px"></div>
<div id="right" class="chart-holder" style=" border: 1px solid #ccc; padding: 1px"></div>
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
 <script>
//基于准备好的dom，初始化echarts实例
 var myChart = echarts.init(document.getElementById('main'));
 //myChart.showLoading();
  // 指定图表的配置项和数据


  var option = {
     title:{
     	text:'各实体市场占比图',
     	subtext:'C开头为机场，O开头为代理商',
     	left:'right'
     },		 
     grid: {
         left: '3%',
         right: '7%',
         bottom: '3%',
         containLabel: true
     },
     tooltip: {
         trigger: 'item',
         formatter: "{a} <br/>{b}: {c} ({d}%)"      	
     },
     legend: {
         orient: 'vertical',
         x: 'left',
         data:['一般用户','机场','代理商','C9','C32','C7','C31','C43','其他机场','O5733','O2561','O6597','O476','O7128','O6129','O5220','O5017','O3507','O2067','O1169','O5224','O1173','O6342','O5233','O5158','O2035','其他代理人']
     },
     series: [
         {
             name:'次数，占比',
             type:'pie',
             selectedMode: 'single',
             radius: [0, '30%'],

             label: {
                 normal: {
                     position: 'inner'
                 }
             },
             labelLine: {
                 normal: {
                     show: false
                 }
             },
             data:[
                 {value:324335, name:'一般用户'},
                 {value:1324208, name:'机场'},
                 {value:4507157, name:'代理商'}
             ]
         },
         {
             name:'次数，占比',
             type:'pie',
             radius: ['40%', '55%'],

             data:[
                 {value:324335, name:'一般用户'},
                 {value:147344, name:'C9'},
                 {value:139306, name:'C32'},
                 {value:134627, name:'C7'},
                 {value:88782, name:'C31'},
                 {value:86810,name:'C43'},
                 {value:727339,name:'其他机场'},
                 {value:71495, name:'O5733'},
                 {value:45570, name:'O2561'},
                 {value:42643, name:'O6597'},
                 {value:41051, name:'O476'},
                 {value:36281,name:'O7128'},
                 {value:34445,name:'O6129'},
                 {value:34393, name:'O5220'},
                 {value:30601, name:'O5017'},
                 {value:30316,name:'O3507'},
                 {value:30038,name:'O2067'},
                 {value:28603, name:'O1169'},
                 {value:26517,name:'O5224'},
                 {value:26441,name:'O1173'},
                 {value:26126, name:'O6342'},
                 {value:26045, name:'O5233'},
                 {value:25610,name:'O5158'},
                 {value:25177,name:'O2035'},
                 {value:3956805,name:'其他代理人'}
             ]
         }
     ]
 };
 //myChart.hideLoading();
 // 使用刚指定的配置项和数据显示图表。


 myChart.setOption(option);




 var myChart2 = echarts.init(document.getElementById('left'));
 myChart2.showLoading();
 myChart2.setOption({
	 title:{
	     	text:'销售量',
	     	subtext:'机场销售量信息,单位15万',
	     	left:'center'
	     },		   
	 tooltip : {
 	        formatter: "{a} <br/>{b} : {c}"
 	    },
 	    toolbox: {
 	        feature: {
 	            restore: {},
 	            saveAsImage: {}
 	        }
 	    },
 	    series: [
 	        {
 	            name: '销售量',
 	            type: 'gauge',
 	            detail: /* {formatter:'{value}(2.5万)'} */[],
 	            data: [/* {value:array[0] , name: '销售量'} */]
 	        }
 	    ]
 	});

 	


 	/* myChart2.setOption(option2); */
 	
 	
 	
 var myChart3 = echarts.init(document.getElementById('center'));
 	myChart3.showLoading(); 
 	myChart3.setOption({
 		title:{
	     	text:'销售总额',
	     	subtext:'机场销售总额信息,单位1.5亿',
	     	left:'center'
	     },		    
 		tooltip : {
 		        formatter: "{a} <br/>{b} : {c}"
 		    },
 		    toolbox: {
 		        feature: {
 		            restore: {},
 		            saveAsImage: {}
 		        }
 		    },
 		    series: [
 		        {
 		            name: '销售总额',
 		            type: 'gauge',
 		            detail: /* {formatter:'{value}(2.5亿)'} */[],
 		            data: [/* {value: array[1], name: '销售总额'} */]
 		        }
 		    ]
 		});

 		


 		/* myChart3.setOption(option3); */
 		
 		
 		
 	var myChart4 = echarts.init(document.getElementById('right'));
 	myChart4.showLoading();
 	myChart4.setOption({
 		title:{
	     	text:'机场排名',
	     	subtext:'机场销售排名信息,主要参照销售总额',
	     	left:'center'
	     },		  	    
 		tooltip : {
 			        formatter: "{a} <br/>{b} : {c}"
 			    },
 			    toolbox: {
 			        feature: {
 			            restore: {},
 			            saveAsImage: {}
 			        }
 			    },
 			    series: [
 			        {
 			            name: '机场排名',
 			            type: 'gauge',
 			            detail: /* { formatter:'{value}(名)' }*/ [],
 			            data: [/*  {value:array[2], name: '机场排名'}  */]
 			        }
 			    ]
 			});

 			


 			/* myChart4.setOption(option4); */
 			
 			
 			
 			

$("#queren").click(function(agentID){
	var array=[];
	
   var agentID = $("#agentID").val();
    $.ajax({
        type: 'post', //post方式
        async: true, //是否异步，默认为true
        url: "/work/searchServlet", //发送的接收地址。
        dataType: "json",//返回结果的类型。
        data: {agentID}, //参数
        error: function (xhr) { //如果发生错误，在这里处理或提示
        },
        success: function (str) { //如果成功，返回一个结果，在这里处理
        alert("success!");
    
     
       	 for(var i=0;i<3;i++)
       		{
       			array[i]=str.data[i].item;
       			
       		}       
        }
     
    });  
    alert("Please wait...");
    myChart2.hideLoading();
    myChart3.hideLoading();
    myChart4.hideLoading();
    myChart2.setOption({
    	    tooltip : {
    	        formatter: "{a} <br/>{b} : {c}"
    	    },
    	    toolbox: {
    	        feature: {
    	            restore: {},
    	            saveAsImage: {}
    	        }
    	    },
    	    series: [
    	        {
    	            name: '销售量',
    	            type: 'gauge',
    	            detail: {formatter:'{value}(15万)'},
    	            data:array[0]/150000,name: '销售量'
    	        }
    	    ]
    	});
    
    	myChart3.setOption({
    		    tooltip : {
    		        formatter: "{a} <br/>{b} : {c}"
    		    },
    		    toolbox: {
    		        feature: {
    		            restore: {},
    		            saveAsImage: {}
    		        }
    		    },
    		    series: [
    		        {
    		            name: '销售总额',
    		            type: 'gauge',
    		            detail: {formatter:'{value}(1.5亿)'},
    		            data:array[2]/150000000
    		        }
    		    ]
    		});

    	
    		
    		myChart4.setOption({
		    tooltip : {
		        formatter: "{a} <br/>{b} : {c}"
		    },
		    toolbox: {
		        feature: {
		            restore: {},
		            saveAsImage: {}
		        }
		    },
		    series: [
		        {
		            name: '机场排名',
		            type: 'gauge',
		            detail: {formatter:'{value}(名)'},
		            data:array[1]
		        }
		    ]
		});

		
		

});

</script> 
<script>

/* //基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));
//myChart.showLoading();
 // 指定图表的配置项和数据


 var option = {
    title:{
    	text:'各实体市场占比图',
    	subtext:'C开头为机场，O开头为代理商',
    	left:'right'
    },		 
    grid: {
        left: '3%',
        right: '7%',
        bottom: '3%',
        containLabel: true
    },
    tooltip: {
        trigger: 'item',
        formatter: "{a} <br/>{b}: {c} ({d}%)"      	
    },
    legend: {
        orient: 'vertical',
        x: 'left',
        data:['一般用户','机场','代理商','C9','C32','C7','C31','C43','其他机场','O5733','O2561','O6597','O476','O7128','O6129','O5220','O5017','O3507','O2067','O1169','O5224','O1173','O6342','O5233','O5158','O2035','其他代理人']
    },
    series: [
        {
            name:'次数，占比',
            type:'pie',
            selectedMode: 'single',
            radius: [0, '30%'],

            label: {
                normal: {
                    position: 'inner'
                }
            },
            labelLine: {
                normal: {
                    show: false
                }
            },
            data:[
                {value:324335, name:'一般用户', selected:true},
                {value:1324208, name:'机场'},
                {value:4507157, name:'代理商'}
            ]
        },
        {
            name:'次数，占比',
            type:'pie',
            radius: ['40%', '55%'],

            data:[
                {value:324335, name:'一般用户'},
                {value:147344, name:'C9'},
                {value:139306, name:'C32'},
                {value:134627, name:'C7'},
                {value:88782, name:'C31'},
                {value:86810,name:'C43'},
                {value:727339,name:'其他机场'},
                {value:71495, name:'O5733'},
                {value:45570, name:'O2561'},
                {value:42643, name:'O6597'},
                {value:41051, name:'O476'},
                {value:36281,name:'O7128'},
                {value:34445,name:'O6129'},
                {value:34393, name:'O5220'},
                {value:30601, name:'O5017'},
                {value:30316,name:'O3507'},
                {value:30038,name:'O2067'},
                {value:28603, name:'O1169'},
                {value:26517,name:'O5224'},
                {value:26441,name:'O1173'},
                {value:26126, name:'O6342'},
                {value:26045, name:'O5233'},
                {value:25610,name:'O5158'},
                {value:25177,name:'O2035'},
                {value:3956805,name:'其他代理人'}
            ]
        }
    ]
};
//myChart.hideLoading();
// 使用刚指定的配置项和数据显示图表。


myChart.setOption(option);



 */
 

</script>
</body>
</html>
