<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
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
label#label1{
	font-size:27px;
}
label#label2{
	font-size:23px;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String number = request.getParameter("quizpage");
	String question[][] = new String[10][4];
	int count = 0;
	for(int i = 0;i<10;i++){
		question[i][0] = request.getParameter("quiz"+i+"que");
		question[i][1] = request.getParameter("quiz"+i);
		question[i][2] = request.getParameter("quiz"+i+"ans");
		if(question[i][1].equals(question[i][2])){
			question[i][3] = "정답";
			++count;
		}
		else{
			question[i][3] = "오답";
		}
	}
	for(int i=0;i<10;i++){%>
		<br>
		<label id="label1"><%=(i+1)+". "+question[i][0]%></label>&nbsp;&nbsp;
		<label id="label2">
			<%
				if(question[i][3].equals("정답")){%>
					<font color="blue"><%=question[i][3]%></font>
			<%	}
				else{ %>
					<font color="red"><%=question[i][3]%></font>
			<%	}
			%>
		</label><br>
		<label id="label2">내가 고른 답 : <%=question[i][1]%></label><br>
		<label id="label2">정답 : <%=question[i][2]%></label><br>
<%	} %>
	<br>
	<label id="label1">총 맞힌 개수 : <%=count%>/10</label>
	
 <%
    	request.setCharacterEncoding("UTF-8");
    	if(session.getAttribute("s_Id")!=null && session.getAttribute("s_Pwd")!=null){ 
    		
 	  		Calendar cal = Calendar.getInstance();
    		Date da = new Date();
    		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
    		//현재 년도, 월, 일
    		int date = cal.get ( cal.DATE ) ;
    		int co = 0;
    	    String fileName = "quiz"+session.getAttribute("s_Id")+".txt"; //생성할 파일명
    		String dir = application.getRealPath("/WEB-INF/text/");
    		String filePath = dir+"/"+fileName;
    	    	try{
    	    		FileOutputStream output = new FileOutputStream(filePath,true);
    	    		OutputStreamWriter writer = new OutputStreamWriter(output,"UTF-8");
    				BufferedWriter fw = new BufferedWriter(writer);
    		   		fw.write(sd.format(da)+"\r\n");
    		   		fw.write(number+"급 한자 퀴즈노트"+"\r\n");
    				for(int i = 0;i<10;i++){
    					if(question[i][3].equals("오답")){
    						++co;
    						fw.write(co+". "+question[i][0]+"\r\n");
    						fw.write("내가 고른 답 : "+question[i][1]+"\r\n");
    						fw.write("정답 : "+question[i][2]+"\r\n");
    					}
    				}
    				if(co==0){
    					fw.write("오답이 없습니다!");
    				}
    		   		fw.flush();
    		   		fw.close();
    	    	} catch (IOException e) { 
    	    		out.println("쓰기 오류 발생");
    	    	}
    	}
%>
</body>
</html>