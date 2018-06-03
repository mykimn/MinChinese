<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Nanum+Gothic|Song+Myung|Gaegu|Poor+Story|Nanum+Myeongjo');
*{
	font-family:'Nanum Gothic';
}
p{
	background-color:#f7cac9;
	line-height:180%;
	font-size:x-large;
	border-radius:7px;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String number = request.getParameter("page");
	
	int i = 0;
	String quiz[] = new String[200];
	String dir = application.getRealPath("/WEB-INF/text/");
	String filePath = dir+"/quiz"+session.getAttribute("s_Id")+".txt";
	try{
		File file = new File(filePath);
		   
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file),"UTF-8"));
		String line = null;
		while((line=br.readLine())!=null){ //라인단위 읽기
			quiz[i] = line;
			i++;
		}
	} catch (IOException e) { 
	  out.println("한자 퀴즈를 한번도 풀어보시지 않으셨습니다!");
	}%>
<%	for(int j = 0; j<i; j++){
		if(quiz[j].startsWith("2018")){ 
			if(j!=0){ %>
				</p>
<% 			}%>
			<p>
<% 		}%>
		<span><%=quiz[j]%></span><br>
<%	}%>
</body>
</html>