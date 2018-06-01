<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String choose = request.getParameter("color");
	String name = request.getParameter("name");	
	String pw = request.getParameter("pw");
	String birth = request.getParameter("birth");	
	String id = request.getParameter("id");
	
	String fileName = "join.txt";
	String dir = application.getRealPath("/WEB-INF/text/");
	String filePath = dir+"/"+fileName;
		try{
	
			BufferedWriter fw = new BufferedWriter(new FileWriter(filePath,true));
		
			fw.write(id+"\r\n");
			fw.write(pw+"\r\n");
	   		fw.write(name+"\r\n");
	   		fw.write(birth+"\r\n");
	   		fw.flush();
	   		fw.close();
		} catch (IOException e) { 
			out.println("쓰기 오류 발생");
}%>
<center><h1 style="margin-top:17%;">회원가입이 완료되었습니다.</h1></center>
</body>
</html>