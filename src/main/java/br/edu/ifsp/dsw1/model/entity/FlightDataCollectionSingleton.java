package br.edu.ifsp.dsw1.model.entity;

public class FlightDataCollectionSingleton {
	
	private static FlightDataCollection instance;
	
	private FlightDataCollectionSingleton() {}
	
	public static FlightDataCollection getInstance() {
		if(instance == null) {
			instance = new FlightDataCollection();
		}
		
		return instance;
	}

}
