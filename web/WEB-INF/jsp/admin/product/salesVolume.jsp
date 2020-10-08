<%
    String path = request.getContextPath();
    String baseurl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="<%=baseurl%>">
    <link href="favicon.ico" rel="shortcut icon"/><!--这个是标题图片-->
    <script src="https://cdn.bootcss.com/echarts/4.2.1-rc1/echarts.min.js"></script>
    <style>
        #main{
            margin: 100px auto;
        }
    </style>
</head>
<body>
    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="width: 600px;height:400px;"></div>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/network.js"></script>
    <script>
        $(function () {
            new network('ProductServlet',{'action':'salesVolume','row':3}).then(function (res) {
                console.log(res);
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));
                // 指定图表的配置项和数据
                var xAxis={//用来显示商品的销量的数据
                    data:[]
                }
                var series=[{
                    name: '销量',
                    type: 'bar',
                    data: []
                }]
                for (var i=0;i<res.length;i++)
                {
                    xAxis.data[i]=res[i].pname;
                    series[0].data[i]=res[i].xiao_liang;
                }

                console.log(xAxis)
                var option = {
                    title: {
                        text: '商品销量排行榜'
                    },
                    tooltip: {},
                    legend: {
                        data:['销量']
                    },
                    xAxis,
                    yAxis: {},
                    series
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            })
        });
    </script>

</body>
</html>
