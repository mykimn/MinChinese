<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	String title = request.getParameter("title");
	String nick;
	if(session.getAttribute("s_Id")==null){
		nick = request.getParameter("nick");
	}
	else{
		nick = (String)session.getAttribute("s_Id");
	}
	String memo[] = request.getParameterValues("memo");
	String content = "";
	for(int w = 0;w<memo.length;w++){
		content+=memo[w];
	}
	content = content.replace("\r\n",">");
	Calendar cal = Calendar.getInstance();
	Date da = new Date();
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	//현재 년도, 월, 일
	int date = cal.get ( cal.DATE ) ;
	int co = 0;
    String fileName = "questionboard.txt"; //생성할 파일명
	String dir = application.getRealPath("/WEB-INF/text/");
	String filePath = dir+"/"+fileName;
    try{
    	FileOutputStream output = new FileOutputStream(filePath,true);
    	OutputStreamWriter writer = new OutputStreamWriter(output,"UTF-8");
		BufferedWriter fw = new BufferedWriter(writer);
		fw.write(title+"\r\n");
		fw.write(nick+"\r\n");
	   	fw.write(sd.format(da)+"\r\n");
	   	fw.write(content+"\r\n");
	   	fw.flush();
	   	fw.close();
    } catch (IOException e) { 
    	out.println("쓰기 오류 발생");
    }
%>
<%
	response.sendRedirect("question.jsp?check=1");
%>
</body>
</html>