package br.edu.ifsp.dsw1.controller.Login;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import br.edu.ifsp.dsw1.controller.command.Command;


@WebServlet("/login.do")
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
       

    public LoginServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		String view = null;
		
		if(action.equals("getLogin")) {
			view = handleLogin(request, response);
		}else if(action.equals("getIndex")) {
			view = handleIndex(request, response);
		}else if(action.equals("getLogar")) {
			view = handleLogar(request, response);
		}else if(action.equals("getAdm")) {
			view = handleAdm(request, response);
		}else if(action.equals("getLogout")) {
			view = handleLogout(request, response);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
	}

	protected String handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "login.jsp";
	}
	
	protected String handleIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "index.jsp";
	}
	
	protected String handleLogar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		var user = request.getParameter("text_user");
		var senha = request.getParameter("text_senha");
		boolean logado;
		
		if(user.equals("admin") && senha.equals("admin")) {
			//cria uma nova sessão e seta seu atributo como a variável booleana true
			logado = true;
			HttpSession session = request.getSession();
			session.setAttribute("logado", logado);
		}else {
			logado = false;
		}
		
		//request também recebe como atributo o nome de usuário e status do login
		request.setAttribute("user", user);
		request.setAttribute("logado", logado);
		
		return "logado.jsp";
	}
	
	protected String handleAdm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "adm.jsp";
	}
	
	protected String handleLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//pega e encerra a sessão já existente.
		HttpSession session = request.getSession(false);
		session.invalidate();
		return "logout.jsp";
	}

}
