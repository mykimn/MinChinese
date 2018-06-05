<%@page import="java.util.Random"%>
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
h1{
	font-size:60px;
	margin-left:3%;
}
#hanjabox{
	margin-top:5%;
	margin-left:3%;
	margin-right:3.5px;
	margin-bottom:30px;
	text-align:center;
	valign:center;
	width:1200px;
	height:500px;
	display:inline-block;
	border:3px solid #92a8d1;
}

</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	int i = 0;
	int j = 0;
	int count = 0;
	String infor[][] = new String[50][3];
	String dir = application.getRealPath("/WEB-INF/text/");
	String filePath = dir+"/phrase.txt";
	try{
		File file = new File(filePath);
		   
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file),"UTF-8"));
		String line = null;
		while((line=br.readLine())!=null){ //라인단위 읽기
			infor[i][j] = line;
			++count;
			++j;
			if(count%3==0){
				++i;
				j=0;
			}
		}
	} catch (IOException e) { 
	  System.out.println(e.toString()); //에러 발생시 메시지 출력
	}
	
	int arr = 0;  //1차원배열 방 10개를 만듭니다.
    int ran = 0;    //랜덤값을 받을 변수를 만듭니다.
    boolean cheak;    // 비교하기 위해 boolean형 변수를 만듭니다.
    Random r = new Random();    // Random형 객체를 만듭니다.
  // 배열의 크기만큼 for문을 돌립니다.
    ran = r.nextInt(i);    // nextInt(10)하면 0-9까지 나오므로  +1을 시켜 1-10까지로 만듭니다.
    String content = infor[ran][2].replace(",","<br>");
%>
<h1>MIN'S <font color="#92a8d1">사자성어</font></h1>
<div id="hanjabox">
			<span style="font-size:150px;"><%=infor[ran][0]+"<br>"%></span>
			<span style="font-size:70px;"><font color="#92a8d1"><%=infor[ran][1]%></font></span><br><br>
			<span style="font-size:50px;"><%=content%></span>
</div>
</body>
</html>