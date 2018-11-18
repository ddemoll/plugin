package plugIn;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Member {
	private String username;
	private String email;
	private String password;
	private String firstName;
	private String lastName;
	private String phone;
	private String favoriteGenre;
	private String levelName;
	private String billingAddress1;
	private String billingAddress2;
	private String billingCity;
	private String billingState;
	private String billingZip;
	private String shippingAddress1;
	private String shippingAddress2;
	private String shippingCity;
	private String shippingState;
	private String shippingZip;
	private String ccFirstName;
	private String ccLastName;
	private String ccType;
	private String ccNumber;
	private String expDate;
	private int expYear;
	private int expMonth;
	private int ccv;

	private int memberID;
	private Date memberSince;
	private int activeStatus;

	public Member() {
		this.memberID = 0;
		this.memberSince = new Date(System.currentTimeMillis());
		this.activeStatus = 1;
	}

	public void register() {

		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(
					"insert into member (levelName, userName, firstName, lastName, billAddressLine1, billAddressLine2,"
							+ "billCity, billState, billZipCode, shipAddressLine1, shipAddressLine2, shipCity, shipState, shipZipCode, phoneNumber, emailAddress, "
							+ "memberPassword, memberSince, activeStatus, genrePreference, creditCardCCV, creditCardNumber, cardHolderFirstName, cardHolderLastName, expYear, expMonth, ccType) "
							+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);",
					Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, levelName);
			ps.setString(2, username);
			ps.setString(3, firstName);
			ps.setString(4, lastName);
			ps.setString(5, billingAddress1);
			ps.setString(6, billingAddress2);
			ps.setString(7, billingCity);
			ps.setString(8, billingState);
			ps.setString(9, billingZip);
			ps.setString(10, shippingAddress1);
			ps.setString(11, shippingAddress2);
			ps.setString(12, shippingCity);
			ps.setString(13, shippingState);
			ps.setString(14, shippingZip);
			ps.setString(15, phone);
			ps.setString(16, email);
			ps.setString(17, Hash.generateHash(password));
			ps.setDate(18, memberSince);
			ps.setInt(19, activeStatus);
			ps.setString(20, favoriteGenre);
			ps.setInt(21, ccv);
			ps.setString(22, ccNumber);
			ps.setString(23, ccFirstName);
			ps.setString(24, ccLastName);
			ps.setInt(25, getExpYear());
			ps.setInt(26, getExpMonth());
			ps.setString(27, ccType);

			ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next())
				memberID = rs.getInt(1);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}

	}

	public void updateProfile() {

		Connection con = DBConnection.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(
					"update member set levelName=?, firstName=?, lastName=?, billAddressLine1=?, billAddressLine2=?,"
							+ "billCity=?, billState=?, billZipCode=?, shipAddressLine1=?, shipAddressLine2=?, shipCity=?, shipState=?, shipZipCode=?, phoneNumber=?, "
							+ "memberPassword=?, memberSince=?, activeStatus=?, genrePreference=?, creditCardCCV=?, creditCardNumber=?, cardHolderFirstName=?, cardHolderLastName=?, expYear=?, expMonth=?, ccType=? where memberID = ?");
			ps.setString(1, levelName);
			ps.setString(2, firstName);
			ps.setString(3, lastName);
			ps.setString(4, billingAddress1);
			ps.setString(5, billingAddress2);
			ps.setString(6, billingCity);
			ps.setString(7, billingState);
			ps.setString(8, billingZip);
			ps.setString(9, shippingAddress1);
			ps.setString(10, shippingAddress2);
			ps.setString(11, shippingCity);
			ps.setString(12, shippingState);
			ps.setString(13, shippingZip);
			ps.setString(14, phone);
			ps.setString(15, Hash.generateHash(password));
			ps.setDate(16, memberSince);
			ps.setInt(17, activeStatus);
			ps.setString(18, favoriteGenre);
			ps.setInt(19, ccv);
			ps.setString(20, ccNumber);
			ps.setString(21, ccFirstName);
			ps.setString(22, ccLastName);
			ps.setInt(23, getExpYear());
			ps.setInt(24, getExpMonth());
			ps.setString(25, ccType);
			ps.setInt(26, memberID);
			ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}

	}

	public Date getNextBillingCycleStartDate() {
		Calendar cal = new GregorianCalendar();
		cal.setTime(memberSince);
		int billingCycleStartDay = cal.get(Calendar.DAY_OF_MONTH);

		Calendar current = Calendar.getInstance();
		int dayOfMonth = current.get(Calendar.DAY_OF_MONTH);

		if (dayOfMonth >= billingCycleStartDay)
			current.add(Calendar.MONTH, 1);
		current.set(Calendar.DAY_OF_MONTH, billingCycleStartDay);
		return new Date(current.getTimeInMillis());
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param username
	 *            the username to set
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param firstName
	 *            the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName
	 *            the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone
	 *            the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @return the favoriteGenre
	 */
	public String getFavoriteGenre() {
		return favoriteGenre;
	}

	/**
	 * @param favoriteGenre
	 *            the favoriteGenre to set
	 */
	public void setFavoriteGenre(String favoriteGenre) {
		this.favoriteGenre = favoriteGenre;
	}

	/**
	 * @return the levelName
	 */
	public String getLevelName() {
		return levelName;
	}

	/**
	 * @param levelName
	 *            the levelName to set
	 */
	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}

	/**
	 * @return the billingAddress1
	 */
	public String getBillingAddress1() {
		return billingAddress1;
	}

	/**
	 * @param billingAddress1
	 *            the billingAddress1 to set
	 */
	public void setBillingAddress1(String billingAddress1) {
		this.billingAddress1 = billingAddress1;
	}

	/**
	 * @return the billingAddress2
	 */
	public String getBillingAddress2() {
		return billingAddress2;
	}

	/**
	 * @param billingAddress2
	 *            the billingAddress2 to set
	 */
	public void setBillingAddress2(String billingAddress2) {
		this.billingAddress2 = billingAddress2;
	}

	/**
	 * @return the billingCity
	 */
	public String getBillingCity() {
		return billingCity;
	}

	/**
	 * @param billingCity
	 *            the billingCity to set
	 */
	public void setBillingCity(String billingCity) {
		this.billingCity = billingCity;
	}

	/**
	 * @return the billingState
	 */
	public String getBillingState() {
		return billingState;
	}

	/**
	 * @param billingState
	 *            the billingState to set
	 */
	public void setBillingState(String billingState) {
		this.billingState = billingState;
	}

	/**
	 * @return the billingZip
	 */
	public String getBillingZip() {
		return billingZip;
	}

	/**
	 * @param billingZip
	 *            the billingZip to set
	 */
	public void setBillingZip(String billingZip) {
		this.billingZip = billingZip;
	}

	/**
	 * @return the shippingAddress1
	 */
	public String getShippingAddress1() {
		return shippingAddress1;
	}

	/**
	 * @param shippingAddress1
	 *            the shippingAddress1 to set
	 */
	public void setShippingAddress1(String shippingAddress1) {
		this.shippingAddress1 = shippingAddress1;
	}

	/**
	 * @return the shippingAddress2
	 */
	public String getShippingAddress2() {
		return shippingAddress2;
	}

	/**
	 * @param shippingAddress2
	 *            the shippingAddress2 to set
	 */
	public void setShippingAddress2(String shippingAddress2) {
		this.shippingAddress2 = shippingAddress2;
	}

	/**
	 * @return the shippingCity
	 */
	public String getShippingCity() {
		return shippingCity;
	}

	/**
	 * @param shippingCity
	 *            the shippingCity to set
	 */
	public void setShippingCity(String shippingCity) {
		this.shippingCity = shippingCity;
	}

	/**
	 * @return the shippingState
	 */
	public String getShippingState() {
		return shippingState;
	}

	/**
	 * @param shippingState
	 *            the shippingState to set
	 */
	public void setShippingState(String shippingState) {
		this.shippingState = shippingState;
	}

	/**
	 * @return the shippingZip
	 */
	public String getShippingZip() {
		return shippingZip;
	}

	/**
	 * @param shippingZip
	 *            the shippingZip to set
	 */
	public void setShippingZip(String shippingZip) {
		this.shippingZip = shippingZip;
	}

	/**
	 * @return the ccFirstName
	 */
	public String getCcFirstName() {
		return ccFirstName;
	}

	/**
	 * @param ccFirstName
	 *            the ccFirstName to set
	 */
	public void setCcFirstName(String ccFirstName) {
		this.ccFirstName = ccFirstName;
	}

	/**
	 * @return the ccLastName
	 */
	public String getCcLastName() {
		return ccLastName;
	}

	/**
	 * @param ccLastName
	 *            the ccLastName to set
	 */
	public void setCcLastName(String ccLastName) {
		this.ccLastName = ccLastName;
	}

	/**
	 * @return the ccType
	 */
	public String getCcType() {
		return ccType;
	}

	/**
	 * @param ccType
	 *            the ccType to set
	 */
	public void setCcType(String ccType) {
		this.ccType = ccType;
	}

	/**
	 * @return the ccNumber
	 */
	public String getCcNumber() {
		return ccNumber;
	}

	/**
	 * @param ccNumber
	 *            the ccNumber to set
	 */
	public void setCcNumber(String ccNumber) {
		this.ccNumber = ccNumber;
	}

	/**
	 * @return the expDate
	 */
	public String getExpDate() {
		return expDate;
	}

	/**
	 * @param expDate
	 *            the expDate to set
	 */
	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}

	/**
	 * @return the ccv
	 */
	public int getCcv() {
		return ccv;
	}

	/**
	 * @param ccv
	 *            the ccv to set
	 */
	public void setCcv(int ccv) {
		this.ccv = ccv;
	}

	/**
	 * @return the memberID
	 */
	public int getMemberID() {
		return memberID;
	}

	/**
	 * @param memberID
	 *            the memberID to set
	 */
	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}

	/**
	 * @return the memberSince
	 */
	public Date getMemberSince() {
		return memberSince;
	}

	/**
	 * @param memberSince
	 *            the memberSince to set
	 */
	public void setMemberSince(Date memberSince) {
		this.memberSince = memberSince;
	}

	/**
	 * @return the activeStatus
	 */
	public int getActiveStatus() {
		return activeStatus;
	}

	/**
	 * @param activeStatus
	 *            the activeStatus to set
	 */
	public void setActiveStatus(int activeStatus) {
		this.activeStatus = activeStatus;
	}

	public int getExpYear() {
		return expYear;
	}

	public void setExpYear(int expYear) {
		this.expYear = expYear;
	}

	public int getExpMonth() {
		return expMonth;
	}

	public void setExpMonth(int expMonth) {
		this.expMonth = expMonth;
	}

}
