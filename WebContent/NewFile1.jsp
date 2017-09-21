<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*"%>
 
<%-- <%  
ArrayList<String[]> list = connDb.index_1(); //获得test表中所有数据并以列表形式返回
%>  --%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>民航机票代理市场预测系统</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />

    <link href="./css/bootstrap.min.css" rel="stylesheet" />
    <link href="./css/bootstrap-responsive.min.css" rel="stylesheet" />


    <link href="./css/font-awesome.css" rel="stylesheet" />

    <link href="./css/1.css" rel="stylesheet" />
    <link href="./css/responsive.css" rel="stylesheet" />

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  </head>

<body>

<div class="navbar navbar-fixed-top">

	<div class="navbar-inner">

		<div class="container">

			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>

			<a class="brand" href="./">民航机票代理市场预测系统</a>
		</div> <!-- /container -->

	</div> <!-- /navbar-inner -->
</div> <!-- /navbar -->

<div id="content">

	<div class="container">

		<div class="row">

			<div class="span3">

				<ul id="main-nav" class="nav nav-tabs nav-stacked">

					<li class="active">
						<a href="./NewFile1.jsp" >
							<i></i>
							各类角色交易量对比
						</a>
					</li>

					<li >
						<a href="./NewFile.jsp">
							<i></i>
							主界面
						</a>
					</li>

					<li>
						<a href="./NewFile2.jsp">
							<i></i>
							代理市场交易关系网络
						</a>
					</li>

					<li>
						<a href="./NewFile3.jsp">
							<i></i>
							交易次数统计
						</a>
					</li>

					<li>
						<a href="./NewFile4.jsp">
							<i></i>
							代理全市场基本特征
						</a>
					</li>
					<li>
						<a href="./NewFile5.jsp">
							<i></i>
							代理市场地位预测表
						</a>
					</li>
				</ul>
				<hr />
				<br />
			</div> <!-- /span3 -->
			<div class="span9">

				<h1 class="">
					<i class="icon-signal"></i>
					可视化分析
				</h1>
				
					


				<div class="widget">

					<div class="widget-header">
						<h3>统计图</h3>
					</div> <!-- /widget-header -->

					<div class="widget-content">

						<div id="main" class="chart-holder"></div>
                       
					</div> <!-- /widget-content -->

				</div> <!-- /widget -->

			</div> <!-- /span9 -->


		</div> <!-- /row -->

	</div> <!-- /container -->

</div> <!-- /content -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="./js/jquery-1.7.2.min.js"></script>
<script src="./js/bootstrap.js"></script>

<script src="js/echarts(1).js"></script>

<script>
//基于准备好的dom，初始化echarts实例

var myChart = echarts.init(document.getElementById('main'));
//指定图表的配置项和数据
myChart.setOption( {   
   backgroundColor: '#2c343c',

   title: {
       text: '',
       left: 'center',
       top: 20,
       textStyle: {
           color: '#ccc'
       }
   },
   

   tooltip : {
       trigger: 'item',
       formatter: "{a} <br/>{b} : {c} ({d}%)"
   },

   visualMap: {
       show: false,
       min: 80,
       max: 600,
       inRange: {
           colorLightness: [1, 1]
       }
   },
  
   series : [
       {
           name:'访问来源',
           type:'pie',
           radius : '55%',
           center: ['50%', '60%'],
           data:[
              /*  {value:c_numsum, name:'机场'},
               {value:o_numsum, name:'代理人'},
               {value:p_numsum, name:'用户'},
             */
           ] .sort(function (a, b) { return a.value - b.value; }),
           roseType: 'radius',
           label: {
               normal: {
                   textStyle: {
                       color: 'rgba(255, 255, 255, 0.3)'
                   }
               }
           },
           labelLine: {
               normal: {
                   lineStyle: {
                       color: 'rgba(255, 255, 255, 0.3)'
                   },
                   smooth: 0.2,
                   length: 10,
                   length2: 20
               }
           },
           itemStyle: {
               normal: {
                   
                   shadowBlur: 200,
                   shadowColor: 'rgba(0, 0, 0, 0.3)'
               }
           },

           animationType: 'scale',
           animationEasing: 'elasticOut',
           animationDelay: function (idx) {
               return Math.random() * 200;
           }
       }
   ]
});
//获取数据

myChart.showLoading();// 加载动画
//异步加载数据
$.post('/work/Bingtu1Servlet').done(function (data) {
	//jQuery触发ajax 从后台异步获取数据

/* var str = eval('(' + data + ')'); */ //解析json


var array = [ {value:data.o_numsum, name:'代理人'},
    {value:data.p_numsum, name:'用户'}, {value:data.c_numsum, name:'机场'}];
myChart.hideLoading();
// 填入数据

myChart.setOption({
/*      legend: {
        data: str.name
        },  */
    series:[{ 
        // 根据名字对应到相应的系列
        name: '访问来源',
        type: 'pie',
        
        data:  array
             
        
    }],
});
});
  

 
 // 使用刚指定的配置项和数据显示图表。
 
</script>
  </body>
</html>