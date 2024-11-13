<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Chủ đề: ${topic.title}</title>
<style>
.message {
	border: 1px solid #ddd;
	padding: 10px;
	margin: 10px 0;
}

.header {
	text-align: right;
}

.header a {
	margin-left: 10px;
}

.post-container {
	width: 60%;
	border: 1px solid #c0c0c0;
	background-color: #ffffff;
	margin-bottom: 10px;
}

.post-header {
	background-color: #abb1b1;
	padding: 10px;
	font-size: 14px;
	color: #555;
	display: flex;
	justify-content: space-between;
}

.post-header a {
	color: #0066cc;
	text-decoration: none;
	font-weight: bold;
}

.post-body {
	font-size: 14px;
	line-height: 1.6;
	display: flex;
}

.username {
	color: #333;
	font-weight: bold;
}

.signature {
	margin-top: 10px;
	color: #666;
	font-style: italic;
}

.post-body>div:first-child {
	background-color: #66ffcb4f;
	padding: 10px;
	border-radius: 5px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

/* Flex cho tiêu đề */
.title {
	display: flex;
	align-items: center;
	gap: 10px;
	font-weight: bold;
	justify-content: space-between;
	padding: 10px;
	background-color: #e6f7ff;
}
</style>
</head>
<body>
	<div class="header">
		Chào ${user.username} | <a href="logout">Thoát</a>
	</div>
	<h2>Chủ đề: ${topic.title}</h2>
	<p>
		<c:if test="${not empty topic.getMessages()}">
    ${topic.getNewMessage().getCreatedTime().time}, do <strong>${topic.getNewMessage().creator.username}</strong> gửi. ${topic.getMessages().size()} hồi âm  
</c:if>

	</p>

	<div class="post-container">
		<div class="post-header">
			<span>${topic.createdTime.time}</span>
		</div>
		<div class="post-body">
			<div>
				<p class="username">${topic.creator.username}</p>
				<p class="time">
					tham gia
					<fmt:formatDate value="${topic.creator.joinDate}"
						pattern="MM-dd-yyyy " />
				</p>
			</div>
			<div>
				<div class="title">
					<p>${topic.title}</p>
					<a href="replyTopic.jsp">Trả lời</a>
				</div>
				<p>${topic.content}</p>
			</div>

		</div>
	</div>

	<c:forEach var="message" items="${topic.getMessages()}">
		<div class="post-container">
			<div class="post-header">
				<span>${topic.createdTime.time}</span>
			</div>
			<div class="post-body">
				<div >
					<p class="username">${message.creator.username}</p>
					<p class="time">
						tham gia
						<fmt:formatDate value="${message.creator.joinDate}"
							pattern="MM-dd-yyyy " />
					</p>
				</div>
				<div>
					<div class="title">
						<p>${message.title}</p>
						<a href="replyTopic.jsp">Trả lời</a>
					</div>
					<p>${message.content }</p>
				</div>
			</div>
		</div>
	</c:forEach>
	<a href="listTopic">Danh sách chủ đề</a>
</body>
</html>