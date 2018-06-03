<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.FileOutputStream"%>
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
	String answer = request.getParameter("answer");
	String number = request.getParameter("number");
    String fileName = "add"+number+".txt"; //생성할 파일명
	String dir = application.getRealPath("/WEB-INF/text/");
	String filePath = dir+"/"+fileName;
    try{
    	FileOutputStream output = new FileOutputStream(filePath,true);
    	OutputStreamWriter writer = new OutputStreamWriter(output,"UTF-8");
		BufferedWriter fw = new BufferedWriter(writer);
		fw.write(session.getAttribute("s_Id")+"\r\n");
		fw.write(answer+"\r\n");
	   	fw.flush();
	   	fw.close();
    } catch (IOException e) { 
    	out.println("쓰기 오류 발생");
    }
%>
<%
	response.sendRedirect("look_question.jsp?number="+number);
%>
</body>
</html>