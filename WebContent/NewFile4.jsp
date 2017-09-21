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
<script src="./js/jquery-1.7.2.min.js"></script>
<script src="./js/bootstrap.js"></script>
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
					</li>			  JSONObject jsonObject = new JSONObject();  
		        
	            jsonObject.put("data", json);

			  System.out.println(json);
          for(int i=1;i<92;i++)
          {
			  System.out.println("1:"+data[i]+"   2:"+data2[i]+"end");
        

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

					<li  class="active">
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
				
					

             
				<div class="widget" style="height: 900px; width: 1100px; border: 1px solid #ccc; padding: 10px;">

					<div class="widget-header" >
						<h3>统计图</h3>
					</div> <!-- /widget-header -->
                 <br>
                   <input type="text" name="agentID" id="agentID" placeholder="代理人id" /> 
                   <br>
                   <input type="button" name="查询" value="确定" id="01" style="width:100px;height:30px;"/>
					
					<div class="widget-content" >
                           
						<div id="main" class="chart-holder" style="height: 700px; width: 1000px; border: 1px solid #ccc; padding: 5px;"></div>

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
        alert("success");
        /* alert(str.data[1].item2); */
     
       	 for(var i=0;i<92;i++)
       		{
       			array[i]=str.data[i].item;
       			array2[i]=str.data[i].item2;
       		}       
        }
    });
    alert();
  /*   alert(array);
    alert(array2); */
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
   	            markLine : {
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