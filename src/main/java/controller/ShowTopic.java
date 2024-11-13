package controller;

import java.io.IOException;
import java.util.Collection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Topic;
import service.ForumService;

@WebServlet("/showTopic")
public class ShowTopic extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int topicId = Integer.parseInt(req.getParameter("topicId"));
		Collection<Topic> topics = ForumService.getInstance().getTopics();

		Topic newTopic = null;

		for (Topic topic : topics) {
		    if (newTopic == null || topic.getId() > newTopic.getId()) { 
		    	newTopic = topic;
		    }
		}

		if (newTopic != null) {
		    req.setAttribute("topic", newTopic);
		    req.getRequestDispatcher("showTopic.jsp").forward(req, resp);
		} else {
		    resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Không có Topic nào");
		}


		if (getServletContext().getAttribute("topic") == null) {
			getServletContext().setAttribute("topic", newTopic);
		} else {
			getServletContext().setAttribute("topic", newTopic);
		}

		req.getRequestDispatcher("showTopic.jsp").forward(req, resp);
		
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}