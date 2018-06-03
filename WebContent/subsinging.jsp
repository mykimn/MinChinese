<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PROFILE</title>
<style>
<link rel="stylesheet" href="svtIndex.css">
@import url('https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Nanum+Gothic|Song+Myung|Anton|Passion+One|Archivo+Black');
* {
	letter-spacing:2px;
	font-family:"Nanum Gothic";
	font-size:large;
}
.profile{
	margin-top:-17.8px;
	width:100%;
	height:500px;
	margin-left:0px;
	background-image:url(media/to1.png);
	background-size:100% 100%;
}
.content{
	margin-top:10px;
	font-size:20px;
	width:100%;
	height:400px;
}
h1.title {
	letter-spacing:1px;
	margin-top:15px;
	text-shadow:1px 1px 2px #666666; color:white; padding-top:7%; text-align:center;
	font-size:100px;
}
h3.title {
	margin-top:-50px;
	text-shadow:1px 1px 2px #666666; color:white; text-align:center;
	font-size:22px;
}
footer{
	margin-top:70%;
	clear:both;
	height:140px;
	width:100%;
	background-color:#282828;
	color:white;
	text-shadow:2px 2px 3px gray;
}
.class1{
	font-family:"Nanum Gothic";
	width:37%;
	height:470px;
	margin-left:47.5%;
	font-weight:bold;
}
.class2{
	font-family:"Nanum Gothic";
	font-weight:normal;
	width:37%;
	height:470px;
	margin-left:47.5%;
}
.svt{
	margin-top:80px;
}
.svt1{
	margin-top: -10px;
	font-size:30px;
}
pre{
	font-family:"Nanum Gothic";
	font-size:15px;
	margin-left:20%;
	line-height:15px;
	margin-bottom:-0.5%;
}
.hr1{
	width:24%;
	margin-left:20%;
	margin-top:2%;
	border:1px solid;
}
.hr2{
	width:37%;
	margin-left:47.5%;
	margin-top:-25%;
	border:0.5px solid;
}
.table1{
	font-family:"Nanum Gothic";
	width:28%;
	margin-left:20%;
	margin-top:2%;
	line-height:180%;
}
.table2{
	font-family:"Nanum Gothic";
	width:24.5%;
	margin-left:20%;
	margin-top:-16%;
	font-size:l5px;
	font-weight:bold;
	align:center;
}
.table2 tr td{
	height:30px;
}
.btn1{
	font-family:"Nanum Gothic";
	font-size:large;
	font-weight:bold;
	color: red;
	background-color:transparent;
	border:2px solid red;
	width:24%;
	height:70px;
	margin-left:20%;
	margin-top:1.5%;
	cursor: pointer;
}
.title1{
	margin-top:-8%;
	letter-spacing:5px;
	margin-left:34.7%;
	color:black;
	font-size:50px;
}
table tr td{
	margin-left:-15%;
}
object{
	margin-left:10%;
}
#hanjabox{
	text-align:center;
	valign:center;
	width:330px;
	height:330px;
	display:inline-block;
	border:3px solid #92a8d1;
}
#hanjabox1{
	text-align:center;
	valign:center;
	width:330px;
	height:330px;
	display:inline-block;
	border:3px solid #92a8d1;
	margin-left:7%;
}
</style>
</head>
<body>
<div class="video1">
<%
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("number");
	
	int i = 0;
	int j = 0;
	int count = 0;
	String infor[][] = new String[50][7];
	String dir = application.getRealPath("/WEB-INF/text/");
	String filePath = dir+"/story"+num+".txt";
	try{
		File file = new File(filePath);
		   
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file),"UTF-8"));
		String line = null;
		while((line=br.readLine())!=null){ //라인단위 읽기
			infor[i][j] = line;
			++count;
			++j;
			if(count%7==0){
				++i;
				j=0;
			}
		}
	} catch (IOException e) { 
	  System.out.println(e.toString()); //에러 발생시 메시지 출력
	}
	
	
	
	
	if(num.equals("1")){%>
		<object type="text/html"  width="1280" height="720"  data="//www.youtube.com/embed/XaqWyrZxAC4?autoplay=1" allowFullScreen></object>
		<h1 style="margin-left:10%; margin-top:1%; font-size:x-large;">괴물이 나타났어요! - 토지 </h1>
<% 	}
	else if(num.equals("2")){ %>
		<object type="text/html"  width="1280" height="720"  data="//www.youtube.com/embed/RHXAjvmXmQ4?autoplay=1" allowFullScreen></object>
		<h1 style="margin-left:10%; margin-top:1%; font-size:x-large;">강으로 바다로! - 강</h1>
<% 	}
	else if(num.equals("3")){ %>
		<object type="text/html"  width="1280" height="720"  data="//www.youtube.com/embed/u4rgct6fS9Y?autoplay=1" allowFullScreen></object>
		<h1 style="margin-left:10%; margin-top:1%; font-size:x-large;">바빠요 바빠  - 신체</h1>
<% 	}
	else{ %>
		<object type="text/html"  width="1280" height="720"  data="//www.youtube.com/embed/90ndThJws2A?autoplay=1" allowFullScreen></object>
		<h1 style="margin-left:10%; margin-top:1%; font-size:x-large;">내 친구 해님과 달님 - 하늘</h1>
<%  }
	for(int k = 0; k<i;k++){ %>
<% 		if(k==0){%>
			<div id="hanjabox1">
<% 		}else{%>
			<div id="hanjabox">
<% 		}%>
			<span style="font-size:90px;"><%=infor[k][0]+"<br>"%></span>
			<span style="font-size:35px;"><%=infor[k][1]%></span><br><br>
		<%	for(int w = 2;w<7;w++){ %>
				<span style="font-size:large;"><%=infor[k][w]%></span><br>
		<%	}%>
		</div>
<%  } %>
</div>
</body>
</html>