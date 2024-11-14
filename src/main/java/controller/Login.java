package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import service.ForumService;

@WebServlet("/login")
public class Login extends HttpServlet {
	private ForumService forumService = ForumService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		 req.getRequestDispatcher("login.jsp").forward(req, resp);
		
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		User user =ForumService.getInstance().checkUser(username, password);

		if (user != null) {
			HttpSession session = req.getSession();
			session.setAttribute("user", user);
			resp.sendRedirect("listTopic");
		} else {
			req.setAttribute("errorMessage", "Tài khoản đăng nhập không chính xác");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}


}