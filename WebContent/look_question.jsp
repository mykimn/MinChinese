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
@import url('https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Nanum+Gothic|Song+Myung|Anton|Passion+One|Archivo+Black');
* {
	font-family:"Nanum Gothic";
}
#table1{
	border-radius:5px;
	border:4px solid #f7cac9;
	margin-left:13%;
	margin-top:1%;
}
#table2{
	border:2px solid #f7cac9;
	width:1190px;
	margin-left:13%;
	margin-top:1%;
}
th{
	height:40px;
	text-align:center;
	border:3px solid #f7cac9;
	font-size:large;
}
td{
	width:1100px;
	height:40px;
	text-align:center;
	border:3px solid #f7cac9;
	font-size:large;
}
input[type=button],input[type=submit]{
    width: 6%;
    background-color: #f7cac9;
    color: black;
    padding: 6px 6px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top:1%;
    font-size:medium;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("number");

	int i = 0;
	int j = 0;
	int count = 0;
	String infor[][] = new String[50][4];
	String dir = application.getRealPath("/WEB-INF/text/");
	String filePath = dir+"/questionboard.txt";
	try{
		File file = new File(filePath);
		   
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file),"UTF-8"));
		String line = null;
		while((line=br.readLine())!=null){ //라인단위 읽기
			infor[i][j] = line;
			++count;
			++j;
			if(count%4==0){
				++i;
				j=0;
			}
		}
	} catch (IOException e) { 
	  System.out.println(e.toString()); //에러 발생시 메시지 출력
	}
	int number = Integer.parseInt(num);
	
	int e = 0;
	int r = 0;
	int co = 0;
	String add[][] = new String[50][2];
	String dir1 = application.getRealPath("/WEB-INF/text/");
	String filePath1 = dir+"/add"+number+".txt";
	try{
		File file = new File(filePath1);
		   
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file),"UTF-8"));
		String line = null;
		while((line=br.readLine())!=null){ //라인단위 읽기
			add[e][r] = line;
			++co;
			++r;
			if(co%2==0){
				++e;
				r=0;
			}
		}
	} catch (IOException e1) {%>
	  <span></span>
<% 	}
%>
  <table id ="table1" border="1" cellspacing=0 cellpadding=0>
     <tr>
      <th align="center" width="70">제목</th>
      <td width="500"><%=infor[number][0] %></td>
     </tr>
     <tr>
       <th align="center">닉네임</th>
       <td width="500"><%=infor[number][1] %></td>
     </tr>
     <tr>
       <th align="center">작성일</th>
       <td width="500"><%=infor[number][2] %></td>
     </tr>
     <tr>
      <th align="center">내용</th>
      <%
      String content = infor[number][3].replace(">", "<br>");
      %>
      <td style="height:500px; font-size:20px;"><%=content%></td>
     </tr>
    </table>
    <input type="button" onclick="location.href='question.jsp'" value="목록으로" style="margin-left:71.5%;">
    <input type="button" onclick="location.href='write_question.jsp'" value="질문하기">
    <%
    	if(session.getAttribute("s_Id")!=null && session.getAttribute("s_Pwd")!=null){%>
    		<form action="addtext.jsp" method="post">
    	    <input type="text" name="answer" style="width:1080px; height:30px; border:4px solid #f7cac9; margin-left:13%; margin-top:2%; font-size:large;">
    	    <input type="hidden" name="number" value=<%=number %>>
    	    <input type="submit" value="답글 달기">
    	    </form>
    <% 	}%>
    <table id="table2" cellspacing=0 cellpadding=0>
    	<%
    		for(int n = 0; n<e;n++){%>
    			<tr>
    	<% 		for(int m=0;m<1;m++){%>
    				<td style="text-align:left; font-size:large; height="20px";">&nbsp;&nbsp;<%=add[n][m]%>님 : <%=add[n][m+1] %></td>
    	<%		}%>
    			</tr>
    	<% 	}
    	%>
    </table>
</body>
</html>