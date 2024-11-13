package controller;

import java.io.IOException;
import java.util.Collection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Category;
import model.Topic;
import model.User;
import service.ForumService;

@WebServlet("/addTopic")
public class AddTopic extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");

		Collection<Topic> topics = ForumService.getInstance().getTopics();

		Category cate = new Category("Học hành");

		ForumService.addTopic(new Topic(topics.size() + 1, title, content, user, cate));
		resp.sendRedirect("listTopic");
	}
}