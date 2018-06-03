<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta>
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Nanum+Gothic|Song+Myung|Gaegu|Poor+Story|Nanum+Myeongjo');
#hanjabox{
	margin-top:40px;
	margin-left:40px;
	margin-right:50px;
	margin-bottom:30px;
	text-align:center;
	valign:center;
	width:700px;
	height:690px;
	float:left;
	display:inline-block;
	border:3px solid #92a8d1;
}
input[type=button]{
    width: 10%;
    background-color: #92a8d1;
    color: black;
    padding: 10px 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-left:0%;
    font-size:large;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String number = request.getParameter("page");
	String pa = request.getParameter("number");
	
	int i = 0;
	int j = 0;
	int count = 0;
	String infor[][] = new String[50][15];
	String dir = application.getRealPath("/WEB-INF/text/");
	String filePath = dir+"/practice"+pa+".txt";
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
	int num = Integer.parseInt(number);
	%>
	<div id="hanjabox">
	<span style="font-size:430px;"><%=infor[num][0]+"<br>"%></span>
	<span style="font-size:xx-large;"><%=infor[num][1]%></span>
	</div><br><br>
<% 	for(int k=2;k<15;k++){ %>
		<p style="margin-left:10px; font-size:21px;"><%=infor[num][k]+"<br>"%></p>
<% 	}
	if(session.getAttribute("s_Id")!=null && session.getAttribute("s_Pwd")!=null){ %>
		<input type="button" value="한자방에 넣기" onclick="alert('한자방에 추가되었습니다!'); location.href='myword.jsp?page=<%=pa %>&number=<%=num %>'">
<%	}%>
</body>
</html>