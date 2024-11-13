<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Gởi bài mới</title>
<style>
.form {
	width: 50%;
	margin: 0 auto;
}

.header {
	text-align: right;
}

.header a {
	margin-left: 10px;
}

.container {
	display: flex;
	justify-content: center;
	align-items: center;
}

input[type="text"], textarea {
	width: 100%;
	box-sizing: border-box;
}
</style>
</head>
<body>
	<div class="header">
		Chào ${user.username} | <a href="logout">Thoát</a>
	</div>
	<div class="container">
		<form action="addTopic" method="post" class="form">
			<label for="title">Tiêu đề:</label><br> <input type="text"
				id="title" name="title" required style="width: 100%;"><br>
			<br> <label for="content">Nội dung:</label><br>
			<textarea id="content" name="content" rows="5" cols="50" required></textarea>
			<br> <br>

			<button type="submit">Gửi</button>
			<a href = "listTopic"><button type="button">Hủy
				bỏ</button></a>
		</form>
	</div>
</body>
</html>