package br.edu.ifsp.dsw1.controller.Admin;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import br.edu.ifsp.dsw1.model.entity.FlightData;
import br.edu.ifsp.dsw1.model.entity.FlightDataCollection;
import br.edu.ifsp.dsw1.model.entity.FlightDataCollectionSingleton;
import br.edu.ifsp.dsw1.model.flightstates.*;

@WebServlet("/admin.do")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminServlet() {
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
		
		if(action.equals("getCadastroVoo")) {
			view = handleCadastroVoo(request, response);
		}else if(action.equals("getAtualizarVoo")) {
			view = handleAtualizarVoo(request, response);
		}else if(action.equals("getCadastrarVoo")) {
			view = handleCadastrarVoo(request, response);
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
	}
	
	protected String handleCadastroVoo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "cadastroVoo.jsp";
	}
	
	protected String handleAtualizarVoo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "atualizarVoo.jsp";
	}
	
	protected String handleCadastrarVoo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//pegando parâmetros
		Long numeroVoo = Long.parseLong(request.getParameter("text_numero_voo"));
		String companhia = request.getParameter("text_companhia");
		String dataHora = request.getParameter("text_data_hora");
		State estadoVoo = Arriving.getIntance();
		
		//pegando uma instância singleton
		FlightDataCollection flightCollection = FlightDataCollectionSingleton.getInstance();
		
		//criando um objeto flightdata, setando o seu estado inicial padrão e inserindo no array.
		FlightData flight = new FlightData(numeroVoo, companhia, dataHora);
		flight.setState(estadoVoo);
		
		flightCollection.insertFlight(flight);
		
		return "vooCadastrado.jsp";
	}
	
	
}
