package controller;

import java.io.IOException;
import java.util.Collection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Message;
import model.Topic;
import model.User;
import service.ForumService;

@WebServlet("/replyTopic")
public class Reply extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int topicId = Integer.parseInt(req.getParameter("topicId"));
		String title = req.getParameter("title");
		String content = req.getParameter("content");

		Collection<Topic> topics = ForumService.getInstance().getTopics();
		Topic currentTopic = topics.stream().filter(topic -> topic.getId().equals(topicId)).findFirst().get();
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		currentTopic.addMessage(new Message(title, content, user));
		
		resp.sendRedirect("showTopic?topicId=" + topicId);

	}
}