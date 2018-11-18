package plugIn;

public class SubscriptionLevel {
	
	private String levelName;
	private int levelNoDvdPerMonth;
	private String levelChargePerMonth;
	
	/**
	 * @param levelName
	 * @param levelNoDvdPerMonth
	 * @param levelChargePerMonth
	 */
	public SubscriptionLevel(String levelName, int levelNoDvdPerMonth, String levelChargePerMonth) {
		super();
		this.levelName = levelName;
		this.levelNoDvdPerMonth = levelNoDvdPerMonth;
		this.levelChargePerMonth = levelChargePerMonth;
	}
	
	/**
	 * @return the levelName
	 */
	public String getLevelName() {
		return levelName;
	}
	/**
	 * @param levelName the levelName to set
	 */
	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}
	/**
	 * @return the levelNoDvdPerMonth
	 */
	public int getLevelNoDvdPerMonth() {
		return levelNoDvdPerMonth;
	}
	/**
	 * @param levelNoDvdPerMonth the levelNoDvdPerMonth to set
	 */
	public void setLevelNoDvdPerMonth(int levelNoDvdPerMonth) {
		this.levelNoDvdPerMonth = levelNoDvdPerMonth;
	}
	/**
	 * @return the levelChargePerMonth
	 */
	public String getLevelChargePerMonth() {
		return levelChargePerMonth;
	}
	/**
	 * @param levelChargePerMonth the levelChargePerMonth to set
	 */
	public void setLevelChargePerMonth(String levelChargePerMonth) {
		this.levelChargePerMonth = levelChargePerMonth;
	}

}
