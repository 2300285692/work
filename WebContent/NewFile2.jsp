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

					<li >
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

					<li  class="active">
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
				
					


				<div class="widget" style="height: 700px; width: 1000px; border: 1px solid #ccc; padding: 20px;">

					<div class="widget-header" >
						<h3>统计图</h3>
					</div> <!-- /widget-header -->

					<div class="widget-content">

						<div id="main" class="chart-holder" style="height: 600px; width: 900px; border: 1px solid #ccc; padding: 1px;"></div>

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
<script src="js/datatool.js"></script>
<script src="js/shine.js"></script>
<script type="text/javascript">
var myChart = echarts.init(document.getElementById('main'));
myChart.showLoading();
$.get('js/les-miserables.gexf', function (xml) {
    myChart.hideLoading();

    var graph = echarts.dataTool.gexf.parse(xml);
    var str = ['C1','C10','C11','C12','C13','C14','C15','C16','C17','C18','C19','C2','C20','C21','C22','C23','C24','C25','C26','C27','C28','C29','C3','C30','C31','C32','C33','C34','C35','C36','C37','C38','C39','C4','C40','C41','C42','C43','C5','C6','C7','C8','C9'];  
    var categories = [];
    for (var i = 0; i <43 ; i++) {
        categories[i] = {
            name: str[i] 
        };
   }

    graph.nodes.forEach(function (node) {
        node.itemStyle = null;
        node.value = node.symbolSize;
        node.symbolSize /= 1.5;
        node.label = {
            normal: {
                show: node.symbolSize > 30
            }
        };
        node.category = node.attributes.modularity_class;
    });
    option = {
        title: {
            text: 'Les Miserables',
            subtext: 'Default layout',
            top: 'bottom',
            left: 'right'
        },
        tooltip: {confine:false},
        legend: [{
           // selectedMode: 'single',
            data: categories.map(function (a) {
                return a.name;
            })
        }],
        animationDuration: 1500,
        animationEasingUpdate: 'quinticInOut',
        series : [
            {
                name: 'Les Miserables',
                type: 'graph',
                layout: 'none',/* circular */
                data: graph.nodes,
                links: graph.links,
                categories: categories,
                roam: true,
                label: {
                    normal: {
                        position: 'right',
                        formatter: '{b}'
                    }
                },
                lineStyle: {
                    normal: {
                        color: 'source',
                        curveness: 0.3
                    }
                }
            }
        ]
    };

    myChart.setOption(option);
}, 'xml');

</script>
  </body>
</html>