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
th{
	height:40px;
	text-align:center;
	border:1px solid #f7cac9;
}
table{
	border-radius:5px;
	border:2px solid #f7cac9;
	margin-left:6%;
	margin-top:1%;
}
td{
	height:40px;
	text-align:center;
	border:1px solid #f7cac9;
}
input[type=button]{
    width: 6%;
    background-color: #f7cac9;
    color: black;
    padding: 6px 6px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-left:87%;
    margin-top:1%;
    font-size:medium;
}
a{
	text-decoration:none;
	color:black;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String check = request.getParameter("check");
	
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
%>
<table border="1" cellspacing=0 cellpadding=0>
	<tr>
		<th width="150">번호</th>
		<th width="700">제목</th>
		<th width="250">게시자</th>
		<th width="350">날짜</th>
	</tr>
	<%	if(i>0){
			for(int k=0;k<i;k++){%>
				<tr>
				<td><a href="look_question.jsp?number=<%=k%>"><%=k+1 %></a></td>
<% 				for(int r = 0;r<3;r++){%>
					<td><a href="look_question.jsp?number=<%=k%>"><%=infor[k][r]%></a></td>
<%				}%>
				</tr>
<%			}
		}
		else{%>
			<tr>
			<td colspan="5">에에엑? 아직 글이 없습니다~!</td>
			</tr>
<%  	}%>
	</tr>
</table>
<input type="button" onclick="location.href='write_question.jsp'" value="질문하기">
</body>
</html>