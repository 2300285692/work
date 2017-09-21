<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

					<li>
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

					<li  class="active">
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
</script>
  </body>
</html>