<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>ListTopic</title>
<style>
.table {
	width: 100%;
	border-collapse: collapse;
}

.table th, .table td {
	padding: 8px;
	text-align: left;
	border: 1px solid #ddd;
}

.table tr:nth-child(even) {
	background-color: #CDFFFF;
}

.header {
	text-align: right;
}

.header a {
	margin-left: 10px;
}

.table th {
	text-align: center;
}
/* Căn giữa nội dung của cột "Hỏi âm" */
.table td:nth-child(2) {
	text-align: center;
}
</style>
</head>
<body>
	<div class="header" style = "font-weight: bold;">
		Chào ${user.username} | <a href="logout" style = "color: blue;">Thoát</a>
	</div>
	<h2>Diễn đàn: Chuyện học phí và các chính sách hỗ trợ học tập</h2>
	<a href = "newTopic.jsp"><button>Gửi bài mới</button></a>
	<table class="table" style = "margin-top: 10px;">
		<tr>
			<th>Chủ đề</th>
			<th>Hỏi âm</th>
		</tr>
		<c:forEach var="topic" items="${list_topics}">
			<tr>
				<td><a href="showTopic?topicId=${topic.id}">${topic.title}</a><br>
					Bài mới nhất bởi 
					<c:if test="${not empty topic.getMessages()}">
               ${topic.getNewMessage().creator.username}, 
                ${topic.getNewMessage().getCreatedTime().time} 
            </c:if> <c:if test="${empty topic.getMessages()}">
                ${topic.creator.username} , ${topic.createdTime.time} 
            </c:if></td>

				<td>${topic.getMessages().size()}</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>