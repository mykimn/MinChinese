<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
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
	int i = 0;
	int j = 0;
	int count = 0;
	String infor[][] = new String[50][4];
	String dir = application.getRealPath("/WEB-INF/text/");
	String filePath = dir+"/join.txt";
	try{
		FileReader fr = new FileReader(filePath); //파일읽기객체생성
		BufferedReader br = new BufferedReader(fr); //버퍼리더객체생성
		
		String line = null;
		while((line = br.readLine())!=null){ //라인단위 읽기
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
	// 로그인 정보 설정
//	String userID="id";
//	String userPWD="pw";
	
	// login.jsp로부터 form data를 받는다
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// id, pwd가 맞을 경우 실
	int tmp = 0;
	if(id.equals("svt")&& pw.equals("0526")){
		session.setAttribute("s_Id", "svt");
	    session.setAttribute("s_Pwd", "0526");
	    ++tmp;
	    response.sendRedirect("admin.jsp");
	}
	if(tmp==0)
	{ %>
		<script>alert('관리자가 아닙니다.')
		history.go(-1);
		</script>
<%	}
%>
</body>
</html>