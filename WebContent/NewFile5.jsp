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
					<li class="active">
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
				
					


				<div class="widget" style="height: 600px; width: 900px; border: 1px solid #ccc; padding: 10px;"> 

					<div class="widget-header">
						<h3>文件导出位置为/usr/local/hadoop/yuce2.cvs</h3>
					</div> <!-- /widget-header -->

					<div class="widget-content">

						<!-- <div id="main" class="chart-holder" style="height: 500px; width: 800px; border: 1px solid #ccc; padding: 5px;"></div> -->
                           <form> <br>
                   <input type="text" name="agentID" id="agentID" placeholder="代理人id" /> 
                   <br>
                   <input type="submit" name="btn" value="确定" id="btn" style="width:100px;height:30px;"/>
					
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

			</div> <!-- /span9 -->


		</div> <!-- /row -->

	</div> <!-- /container -->

</div> <!-- /content -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="./js/jquery-1.7.2.min.js"></script>
<script src="./js/bootstrap.js"></script>
<script type="text/javascript">
$("#btn").click(function(agentID){
    var agentID = $("#agentID").val();
  
    $.ajax({
        type: 'post', //post方式
        async: false, //是否异步，默认为true
        url: "/work/Yuce", //发送的接收地址。
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