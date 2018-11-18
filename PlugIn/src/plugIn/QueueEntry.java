package plugIn;

public class QueueEntry {
	private int movieID;
	private int queueSequence;
	private String movieTitle;
	
	public QueueEntry(int queueSequence, int movieID, String movieTitle) {
		this.queueSequence = queueSequence;
		this.movieID = movieID;
		this.movieTitle = movieTitle;
		
	}

	/**
	 * @return the movieID
	 */
	public int getMovieID() {
		return movieID;
	}
	/**
	 * @param movieID the movieID to set
	 */
	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}
	/**
	 * @return the queueSequence
	 */
	public int getQueueSequence() {
		return queueSequence;
	}
	/**
	 * @param queueSequence the queueSequence to set
	 */
	public void setQueueSequence(int queueSequence) {
		this.queueSequence = queueSequence;
	}
	/**
	 * @return the movieTitle
	 */
	public String getMovieTitle() {
		return movieTitle;
	}
	/**
	 * @param movieTitle the movieTitle to set
	 */
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	
}
