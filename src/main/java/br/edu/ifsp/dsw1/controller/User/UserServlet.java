package br.edu.ifsp.dsw1.controller.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import br.edu.ifsp.dsw1.controller.command.Command;
import br.edu.ifsp.dsw1.model.entity.FlightData;
import br.edu.ifsp.dsw1.model.entity.FlightDataCollection;
import br.edu.ifsp.dsw1.model.entity.FlightDataCollectionSingleton;
import br.edu.ifsp.dsw1.model.flightstates.Arriving;
import br.edu.ifsp.dsw1.model.flightstates.Boarding;
import br.edu.ifsp.dsw1.model.flightstates.TakingOff;
import br.edu.ifsp.dsw1.model.flightstates.TookOff;

@WebServlet("/user.do")
public class UserServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
       
    public UserServlet() {
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
		
		if(action.equals("getSalaDesembarque")) {
			view = handleSalaDesembarque(request, response);
		}else if(action.equals("getSalaEmbarque")) {
			view = handleSalaEmbarque(request, response);
		}else if(action.equals("getHall1")) {
			view = handleHall1(request, response);
		}else if(action.equals("getHall2")) {
			view = handleHall2(request, response);
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
		
	}
	
	protected String handleSalaDesembarque(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FlightDataCollection flightCollection = FlightDataCollectionSingleton.getInstance();
		
		//criando uma lista que recebe apenas objetos FlighData com estado Arriving
		List<FlightData> flightsArriving = flightCollection.getAllFligthts().stream()
													.filter(flight -> flight.getState() instanceof Arriving)
													.toList();
		
		request.setAttribute("flightsArriving", flightsArriving);
		
		return "salaDesembarque.jsp";
	}
	
	protected String handleSalaEmbarque(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FlightDataCollection flightCollection = FlightDataCollectionSingleton.getInstance();
		
		//criando uma lista que recebe apenas objetos FlighData com estado Boarding
		List<FlightData> flightsArriving = flightCollection.getAllFligthts().stream()
													.filter(flight -> flight.getState() instanceof Boarding)
													.toList();
		
		request.setAttribute("flightsArriving", flightsArriving);
		
		return "salaEmbarque.jsp";
	}
	
	protected String handleHall1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FlightDataCollection flightCollection = FlightDataCollectionSingleton.getInstance();
		
		//criando uma lista que recebe apenas objetos FlighData com estado TakingOff
		List<FlightData> flightsArriving = flightCollection.getAllFligthts().stream()
													.filter(flight -> flight.getState() instanceof TakingOff)
													.toList();
		
		request.setAttribute("flightsArriving", flightsArriving);
		
		return "hall1.jsp";
	}
	
	protected String handleHall2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FlightDataCollection flightCollection = FlightDataCollectionSingleton.getInstance();
		
		//criando uma lista que recebe apenas objetos FlighData com estado TookOff
		List<FlightData> flightsArriving = flightCollection.getAllFligthts().stream()
													.filter(flight -> flight.getState() instanceof TookOff)
													.toList();
		
		request.setAttribute("flightsArriving", flightsArriving);
		
		return "hall2.jsp";
	}
	
}
