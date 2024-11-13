<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Reply</title>
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
		<form action="replyTopic" method="post" class="form">
			<!-- Lấy topic từ ServletContext -->
			<c:set var="topic" value="${applicationScope.topic}" />
			<input type="hidden" name="topicId" value="${topic.id}">
			<label for="title">Tiêu đề:</label><br> 
			<!-- Hiển thị Re:${topic.title} trong ô input -->
			<input type="text" id="title" name="title" value="Re:${topic.title}" required style="width: 100%;"><br>
			<br> 
			<label for="content">Nội dung:</label><br>
			<textarea id="content" name="content" rows="5" cols="50" required></textarea>
			<br><br>

			<button type="submit">Gởi</button>
			<a href = "listTopic"><button type="button" >Hủy bỏ</button></a>
		</form>
	</div>
</body>
</html>