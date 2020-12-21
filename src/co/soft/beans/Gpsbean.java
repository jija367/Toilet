package co.soft.beans;

public class Gpsbean {

	private double t_la;
	private double t_lo;
	public double getT_la() {
		return t_la;
	}
	
	public Gpsbean(double t_la, double t_lo){
		this.t_la=t_la;
		this.t_lo=t_lo;
	}
	
	public void setT_la(double t_la) {
		this.t_la = t_la;
	}
	public double getT_lo() {
		return t_lo;
	}
	public void setT_lo(double t_lo) {
		this.t_lo = t_lo;
	}
	
}
