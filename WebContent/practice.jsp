<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
@import url('https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Nanum+Gothic|Song+Myung|Gaegu|Poor+Story|Nanum+Myeongjo');
#hanjabox{
	margin-left:15px;
	margin-right:3.5px;
	margin-bottom:30px;
	text-align:center;
	valign:center;
	width:170px;
	height:170px;
	display:inline-block;
	border:3px solid #92a8d1;
}

</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String number = request.getParameter("page");
	
	int i = 0;
	int j = 0;
	int count = 0;
	String infor[][] = new String[50][15];
	String dir = application.getRealPath("/WEB-INF/text/");
	String filePath = dir+"/practice"+ number +".txt";
	try{
		File file = new File(filePath);
		   
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file),"UTF-8"));
		String line = null;
		while((line=br.readLine())!=null){ //라인단위 읽기
			infor[i][j] = line;
			++count;
			++j;
			if(count%15==0){
				++i;
				j=0;
			}
		}
	} catch (IOException e) { 
	  System.out.println(e.toString()); //에러 발생시 메시지 출력
	}
	if(number.equals("8")){%>
		<h1 style="margin-left:25px; margin-bottom:50px; margin-top:50px; font-family:'Nanum Gothic'; font-size:40px;">8급 한자 공부</h1>
<% 	}
	else if(number.equals("5")){ %>
		<h1 style="margin-left:25px; margin-bottom:50px; margin-top:50px; font-family:'Nanum Gothic'; font-size:40px;">5급 한자 공부</h1>
<% 	}
	else{%>
		<h1 style="margin-left:25px; margin-bottom:50px; margin-top:50px; font-family:'Nanum Gothic'; font-size:40px;">2급 한자 공부</h1>
<% 	}
 	for(int k = 0; k<i;k++){ %>
		<div id="hanjabox">
			<span style="font-size:90px;"><a href="subpractice.jsp?number=<%=number%>&page=<%=k%>" style="text-decoration:none; color:black;"><%=infor[k][0]+"<br>"%></a></span>
			<span style="font-size:large;"><a href="subpractice.jsp?number=<%=number%>&page=<%=k%>" style="text-decoration:none; color:black;"><%=infor[k][1]%></a></span>
		</div>
<%  } %>

</body>
</html>