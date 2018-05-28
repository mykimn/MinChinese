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
    <header><a href="index.html"><h1 style="text-align: center">CHILD PROTECTION</h1></a></header>
    <nav>
        <ul>
            <li><a href="index.html">홈</a></li>
            <li><a href="introduction.html">소개</a></li>
            <li><a href="news.html" target="main">소식</a></li>
            <li><a href="support.html" target="main">후원</a></li>
            <li><a href="counsel.html" target="main">상담</a></li>
        </ul>
    </nav>
    <aside id = "leftmenu">
        <div id="login">
            <h3>로그인</h3>
            <form action="login.jsp" method="post">
                아이디 : <input type="text" size="10"><br /></style>
                패스워드 : <input type="password" size="15"><br />
                <input type="submit" value="로그인">
                <input type="reset" value="취소">
            </form>
            <a href="join.html" target="main">회원가입</a><br>
            <a href="lookup_info.html" target="main">아이디/비밀번호 찾기</a>
        </div>
    </aside>
    <section>
        <article>
            <iframe name="main" width="100%" height="700" style="border:none" src="main.html"></iframe>
        </article>
    </section>
    <aside id = "right">
        <div id="contact">
			<h3>CONTACT</h3>
			<a href="contact.html" target="main">언제든 당신의 연락을 기다리고 있습니다.</a>
		</div>    
    </aside>
    <footer>
        <small style="line-height: 50px; color: burlywood; margin-left: -50px; margin-top: 20px;">Copyright (c) 2018 CHILD PROTECTION / 3203 김민영</small>
        <address style="line-height: 50px; color: burlywood; margin-left: -50px;">동대문구 천호대로89길 52 아동 보호 상담 서비스센터 / 3203 김민영</address>
    </footer>
</body>
</html>
