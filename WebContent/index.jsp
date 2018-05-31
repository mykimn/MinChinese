<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="basic_style.css">
</head>
<body>
    <header><a href="index.jsp"><h1 style="text-align: center">MIN'S CHINESE</h1></a></header>
    <nav>
        <ul>
            <li><a href="index.jsp">한자</a></li>
            <li><a href="introduction.html">한자 퀴즈</a></li>
            <li><a href="news.html" target="main">노래로 연습</a></li>
            <li><a href="support.html" target="main">책 추천</a></li>
        </ul>
    </nav>
    <aside id = "leftmenu">
        <div id="login">
            <h3>로그인</h3>
            <form action="login.jsp" method="post">
                아이디 : <input type="text" size="10" name="id"><br /></style>
                패스워드 : <input type="password" size="15" name="pw"><br />
                <input type="submit" value="로그인">
                <input type="reset" value="취소">
            </form>
            <a href="join.jsp" target="main">회원가입</a><br>
        </div>
    </aside>
    <section>
        <article style="width:80%; background-color:white;">
            <iframe name="main" width="100%" height="800" style="border:none" src="main.jsp"></iframe>
        </article>
    </section>
</body>
</html>
