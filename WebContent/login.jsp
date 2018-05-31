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


	
	// 로그인 정보 설정
	String userID="id";
	String userPWD="pw";
	
	// login.jsp로부터 form data를 받는다
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// id, pwd가 맞을 경우 실행
	if(userID.equals(id) && userPWD.equals(pw)) 
	{
	    session.setAttribute("s_Id", userID);
	    session.setAttribute("s_Pwd", userPWD);
	    response.sendRedirect("index.jsp");
	}
	else 
	{ %>
		<script>alert('회원정보가 없습니다.')
		history.go(-1);
		</script>
<%	}

%>
</body>
</html>
