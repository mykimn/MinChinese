<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
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
	String pa = request.getParameter("page");
	String num = request.getParameter("number");
	
	int i = 0;
	int j = 0;
	int count = 0;
	String infor[][] = new String[50][15];
	String dir = application.getRealPath("/WEB-INF/text/");
	String filePath = dir+"/practice"+ pa +".txt";
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
	
	int co = 0;
	int n = Integer.parseInt(num);
    String fileName = "word"+session.getAttribute("s_Id")+".txt"; //생성할 파일명
	String dir1 = application.getRealPath("/WEB-INF/text/");
	String filePath1 = dir1+"/"+fileName;
    try{
    	FileOutputStream output = new FileOutputStream(filePath1,true);
    	OutputStreamWriter writer = new OutputStreamWriter(output,"UTF-8");
		BufferedWriter fw = new BufferedWriter(writer);
		
		fw.write(infor[n][0]+"\r\n");
		fw.write(infor[n][1]+"\r\n");
		fw.write(pa+"\r\n");
		fw.write(n+"\r\n");
	   	fw.flush();
	   	fw.close();
    } catch (IOException e) { 
    	out.println("쓰기 오류 발생");
    }
%>
<%
	response.sendRedirect("mysaveword.jsp");
%>
</body>
</html>