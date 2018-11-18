package plugIn;

import java.sql.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

public class DbBean {
	private Connection con;

	public DbBean() {
		con = DBConnection.getConnection();
	}

	public Connection getCon() {
		return con;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	// QEUEUE
	public int addToQueue(int memberID, int movieID, String movieTitle) {
		try {
			PreparedStatement stmt = con.prepareStatement(
					"SELECT queueSequence FROM queue WHERE memberID = ? ORDER BY queueSequence DESC limit 1;");
			stmt.setInt(1, memberID);
			ResultSet rs = stmt.executeQuery();
			int nextQueueSequence = 0;
			if (rs.next()) {
				nextQueueSequence = rs.getInt(1) + 1;
			}

			stmt = con.prepareStatement("INSERT INTO queue VALUES (?, ?, ?, ?);");

			stmt.setInt(1, memberID);
			stmt.setInt(2, movieID);
			stmt.setInt(3, nextQueueSequence);
			stmt.setString(4, movieTitle);
			stmt.executeUpdate();

			return nextQueueSequence;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}

	public void deleteFromQueue(int memberID, int movieID) {
		try {

			PreparedStatement stmt = con.prepareStatement("DELETE FROM queue WHERE memberID = ? and movieID = ?;");
			stmt.setInt(1, memberID);
			stmt.setInt(2, movieID);
			stmt.execute();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param user
	 * @param movieID
	 * @return number of distinct movies user can watch in current billing cycle
	 * 		-1 = already bought this movie for month. Dont show notification
	 */
	public int updateHistory(Member user, int movieID) {
		int numMoviesRemaining = 0;
		int memberID = user.getMemberID();
		Date nextbillingCycleStartDate = user.getNextBillingCycleStartDate();
		try {
			PreparedStatement stmt3 = con
					.prepareStatement("SELECT * FROM history WHERE memberID = ? AND movieID = ? AND watchTime >= DATE_SUB(?, INTERVAL 1 MONTH)");
			stmt3.setInt(1, memberID);
			stmt3.setInt(2, movieID);
			stmt3.setDate(3, nextbillingCycleStartDate);
			stmt3.execute();
			ResultSet rs3 = stmt3.executeQuery();
			//user already watched this movie this month
			if(rs3.next()) numMoviesRemaining = -1;
			PreparedStatement stmt = con
					.prepareStatement("INSERT INTO history (memberID, movieID, watchTime) VALUES(?, ?, NOW())");
			stmt.setInt(1, memberID);
			stmt.setInt(2, movieID);
			stmt.execute();
			PreparedStatement stmt2 = con.prepareStatement("SELECT Y.movieLimit-Z.moviesWatched " + "FROM "
					+ "(SELECT level.levelNoDvdPerMonth AS movieLimit FROM level "
					+ "INNER JOIN  member ON level.levelName = member.levelName WHERE member.memberID = ?) Y, "
					+ "(SELECT COUNT(DISTINCT(movieID)) as moviesWatched FROM history "
					+ "WHERE memberID = ? AND watchTime >= DATE_SUB(?, INTERVAL 1 MONTH)) Z");
			stmt2.setInt(1, memberID);
			stmt2.setInt(2, memberID);
			stmt2.setDate(3, nextbillingCycleStartDate);
			ResultSet rs = stmt2.executeQuery();
			if (numMoviesRemaining != -1 && rs.next()) {
				numMoviesRemaining = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.out.println(e);
		}
		return numMoviesRemaining;
	}

	public ArrayList<Movie> getHistory(int memberID) {
		ArrayList<Movie> movies = new ArrayList<Movie>();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("SELECT movie.*, history.watchTime FROM history JOIN movie ON movie.movieID = "
					+ "history.movieID WHERE history.memberID = ? ORDER BY history.watchTime DESC;");

			stmt.setInt(1, memberID);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Movie m = new Movie();
				m.setId(rs.getInt(1));
				m.setGenre(rs.getString(2));
				m.setTitle(rs.getString(3));
				m.setDesc(rs.getString(4));
				m.setYearReleased(rs.getInt(5));
				m.setThumbnail(rs.getString(6));
				m.setTrailer(rs.getString(7));
				m.setReleaseDate(rs.getDate(8));
				m.setRating(rs.getString(9));
				m.setDirector(rs.getString(10));
				m.setActor1(rs.getString(11));
				m.setActor2(rs.getString(12));
				m.setImdbKey(rs.getString(13));
				m.setViewCount(rs.getInt(14));
				m.setLikeCount(rs.getInt(15));
				m.setReleaseDate(rs.getDate(16));
				movies.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return movies;
	}

	public boolean canWatchMovie(Member user, int movieID) {
		boolean canWatchMovie = false;
		try {
			int memberID = user.getMemberID();
			Date nextbillingCycleStartDate = user.getNextBillingCycleStartDate();
			PreparedStatement stmt = con.prepareStatement("SELECT "
					+ "(SELECT COUNT(*) FROM history WHERE memberID = ? AND movieID = ? AND watchTime >= DATE_SUB(?, INTERVAL 1 MONTH)), "
					+ "(SELECT Y.movieLimit-Z.moviesWatched " + "FROM "
					+ "(SELECT level.levelNoDvdPerMonth AS movieLimit FROM level "
					+ "INNER JOIN  member ON level.levelName = member.levelName WHERE member.memberID = ?) Y, "
					+ "(SELECT COUNT(DISTINCT(movieID)) as moviesWatched FROM history "
					+ "WHERE memberID = ? AND watchTime >= DATE_SUB(?, INTERVAL 1 MONTH)) Z)");
			int i = 1;
			stmt.setInt(i++, memberID);
			stmt.setInt(i++, movieID);
			stmt.setDate(i++, nextbillingCycleStartDate);
			stmt.setInt(i++, memberID);
			stmt.setInt(i++, memberID);
			stmt.setDate(i++, nextbillingCycleStartDate);
			ResultSet rs = stmt.executeQuery();

			if (rs.next())
				canWatchMovie = (rs.getInt(1) > 0 || rs.getInt(2) != 0);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return canWatchMovie;
	}

	public void incrementWatchCount(int movieID) {
		try {
			PreparedStatement stmt = con
					.prepareStatement("UPDATE movie SET viewCount = viewCount + 1 WHERE movieID = ?;");
			stmt.setInt(1, movieID);
			stmt.execute();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	public void likeMovie(int movieID, int memberID) {
		try {
			PreparedStatement stmt = con.prepareStatement("INSERT IGNORE INTO likes (movieID, memberID) VALUES(?, ?)");
			stmt.setInt(1, movieID);
			stmt.setInt(2, memberID);
			stmt.execute();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}
	
	public void unlikeMovie(int movieID, int memberID) {
		try {
			PreparedStatement stmt = con.prepareStatement("DELETE FROM likes WHERE movieID = ? AND memberID = ?");
			stmt.setInt(1, movieID);
			stmt.setInt(2, memberID);
			stmt.execute();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	public boolean didLikeMovie(int movieID, int memberID) {
		try {
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM likes WHERE movieID = ? AND memberID = ?");
			stmt.setInt(1, movieID);
			stmt.setInt(2, memberID);
			ResultSet rs = stmt.executeQuery();
			if (rs.next())
				return true;
		} catch (SQLException e) {
			System.out.println(e);
		}
		return false;
	}

	/*
	 * Allows checking for if a values appears inside a comma separated list in a
	 * column.
	 */
	private void appendInStatement(StringBuilder query, ArrayList<Object> valsToAdd, Object[] arr, String column) {
		query.append(" " + column + " IN (");
		for (int i = 0; i < arr.length; i++) {
			valsToAdd.add(arr[i]);
			query.append("?");
			if (i != arr.length - 1) {
				query.append(",");
			}
		}
		query.append(")");
	}

	/*
	 * Gets a movie based on its id.
	 */
	public Movie getMovie(int id) {
		try {
			PreparedStatement stmt = con.prepareStatement(
					"SELECT movie.movieID, movie.movieGenre, movie.movieTitle, movie.movieDescription, movie.movieYearReleased, "
							+ "movie.movieImage, movie.movieTrailer, movie.movieReleaseDate, movie.movieMPAARating, movie.director, "
							+ "movie.actor1, movie.actor2, movie.imdbKey, movie.viewCount, COUNT(likes.movieID) FROM movie "
							+ "LEFT JOIN likes on movie.movieID = likes.movieID WHERE movie.movieID = ?");
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			rs.next();
			Movie m = new Movie();
			m.setId(rs.getInt(1));
			m.setGenre(rs.getString(2));
			m.setTitle(rs.getString(3));
			m.setDesc(rs.getString(4));
			m.setYearReleased(rs.getInt(5));
			m.setThumbnail(rs.getString(6));
			m.setTrailer(rs.getString(7));
			m.setReleaseDate(rs.getDate(8));
			m.setRating(rs.getString(9));
			m.setDirector(rs.getString(10));
			m.setActor1(rs.getString(11));
			m.setActor2(rs.getString(12));
			m.setImdbKey(rs.getString(13));
			m.setViewCount(rs.getInt(14));
			m.setLikeCount(rs.getInt(15));
			return m;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}

	public Map<String, SortedSet<String>> getAutocompleteData() {

		Map<String, SortedSet<String>> data = new TreeMap<String, SortedSet<String>>();
		data.put("movieTitle", new TreeSet<String>());
		data.put("director", new TreeSet<String>());
		data.put("actor", new TreeSet<String>());
		try {
			PreparedStatement stmt = con.prepareStatement("SELECT movieTitle, director, actor1, actor2 FROM movie;");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				data.get("movieTitle").add(rs.getString(1));
				data.get("director").add(rs.getString(2));
				data.get("actor").add(rs.getString(3));
				data.get("actor").add(rs.getString(4));

			}

		} catch (SQLException e) {
			System.out.println(e);

		}
		return data;
	}

	public ArrayList<SubscriptionLevel> getLevels() {
		try {
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM level ORDER BY levelNoDvdPerMonth ASC;");
			ResultSet rs = stmt.executeQuery();
			ArrayList<SubscriptionLevel> levels = new ArrayList<SubscriptionLevel>();
			while (rs.next()) {
				levels.add(new SubscriptionLevel(rs.getString(1), rs.getInt(2), rs.getString(3)));
			}
			return levels;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}

	}

	/*
	 * Gets all ratings that movies have.
	 */
	public ArrayList<String> getRatings() {
		try {
			PreparedStatement stmt = con
					.prepareStatement("SELECT movieMPAARating FROM movie GROUP BY (movieMPAARating);");
			ResultSet rs = stmt.executeQuery();
			ArrayList<String> ratings = new ArrayList<>();
			while (rs.next()) {
				ratings.add(rs.getString(1));
			}
			return ratings;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}
	}

	/*
	 * Get all genres that movies have
	 */
	public ArrayList<String> getGenres() {
		try {
			PreparedStatement stmt = con.prepareStatement("SELECT movieGenre FROM movie GROUP BY (movieGenre);");
			ResultSet rs = stmt.executeQuery();
			ArrayList<String> genres = new ArrayList<>();
			while (rs.next()) {
				genres.add(rs.getString(1));
			}
			return genres;
		} catch (SQLException e) {
			System.out.println(e);
			return null;
		}

	}

	/*
	 * Gets all movies of a specified genre
	 */
	public ArrayList<Movie> getMoviesByGenre(String genre) throws SQLException {
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM movie WHERE movieGenre = ?;");
		stmt.setString(1, genre);
		ResultSet rs = stmt.executeQuery();
		ArrayList<Movie> movies = new ArrayList<>();
		while (rs.next()) {
			Movie m = new Movie();
			m.setId(rs.getInt(1));
			m.setGenre(rs.getString(2));
			m.setTitle(rs.getString(3));
			m.setDesc(rs.getString(4));
			m.setYearReleased(rs.getInt(5));
			m.setThumbnail(rs.getString(6));
			m.setTrailer(rs.getString(7));
			m.setReleaseDate(rs.getDate(8));
			m.setRating(rs.getString(9));
			m.setDirector(rs.getString(10));
			m.setActor1(rs.getString(11));
			m.setActor2(rs.getString(12));
			movies.add(m);
		}
		Collections.shuffle(movies);
		return movies;
	}

	/*
	 * Performs a search based upon values given inside parameters of a request.
	 */
	public ArrayList<Movie> search(HttpServletRequest request) {

		try {
			String title = request.getParameter("title");
			String actor = request.getParameter("actor");
			String director = request.getParameter("director");
			String[] genres = request.getParameterValues("genre");
			String[] ratings = request.getParameterValues("rating");
			String startYear = request.getParameter("startYear");
			String endYear = request.getParameter("endYear");

			Enumeration<String> en = request.getParameterNames();

			while (en.hasMoreElements()) {
				String name = en.nextElement();
				String val = request.getParameter(name);
				System.out.println(name + ": " + val);
			}
			StringBuilder query = new StringBuilder();
			// TODO: Find out what we need to pull in from the database.
			query.append("SELECT movieTitle, movieDescription, movieMPAARating, movieId, director, movieTrailer, "
					+ "movieImage FROM movie WHERE");
			int originalLength = query.length();
			boolean first = true;
			ArrayList<Object> valsToAdd = new ArrayList<>();
			if (title != null && title != "") {
				query.append(" movieTitle LIKE ?");
				first = false;
				valsToAdd.add("%" + title + "%");
			}
			if (actor != null && actor != "") {
				if (!first) {
					query.append(" AND ");
				}
				query.append(" ( actor1 LIKE ? OR actor2 LIKE ? ) ");
				valsToAdd.add("%" + actor + "%");
				valsToAdd.add("%" + actor + "%");
				first = false;
			}
			if (director != null && director != "") {
				if (!first) {
					query.append(" AND ");
				}
				query.append(" director LIKE ? ");
				valsToAdd.add("%" + director + "%");
				first = false;
			}
			if (ratings != null) {
				if (!first) {
					query.append(" AND ");
				}
				appendInStatement(query, valsToAdd, ratings, "movieMPAARating");
				first = false;
			}
			if (genres != null) {
				if (!first) {
					query.append(" AND ");
				}
				appendInStatement(query, valsToAdd, genres, "movieGenre");
				first = false;
			}
			if (startYear != null && startYear != "") {
				if (!first) {
					query.append(" AND ");
				}
				query.append(" movieYearReleased >= ? ");
				first = false;
				valsToAdd.add(new Integer(startYear));
			}
			if (endYear != null && endYear != "") {
				if (!first) {
					query.append(" AND ");
				}
				query.append(" movieYearReleased <= ? ");
				first = false;
				valsToAdd.add(new Integer(endYear));
			}
			System.out.println("len = " + query.length() + " original = " + originalLength);
			if (query.length() == originalLength) {
				return null;
			}
			query.append(";");
			System.out.println("Query = " + query.toString());
			System.out.println("valsToAdd ");

			for (int i = 0; i < valsToAdd.size(); i++) {
				System.out.print(valsToAdd.get(i) + " ");
			}
			Class.forName("com.mysql.jdbc.Driver");
			PreparedStatement stmt = con.prepareStatement(query.toString());
			System.out.println(stmt.toString());

			for (int i = 0; i < valsToAdd.size(); i++) {
				stmt.setObject(i + 1, valsToAdd.get(i));
			}
			System.out.println(stmt.toString());
			ResultSet rs = stmt.executeQuery();

			ArrayList<Movie> movies = new ArrayList<>();

			while (rs.next()) {
				Movie m = new Movie();
				m.setTitle(rs.getString(1));
				m.setDesc(rs.getString(2));
				m.setRating(rs.getString(3));
				m.setId(rs.getInt(4));
				m.setDirector(rs.getString(5));
				m.setTrailer(rs.getString(6));
				m.setThumbnail(rs.getString(7));
				movies.add(m);
			}

			return movies;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	/*
	 * Gets movies inside a queue The objects inside the arraylist will only have
	 * the id and thumbnail attributes set. This is because we're only displaying a
	 * thumbnail. id will be used to go to detail page. Might be changed later.
	 */
	public ArrayList<Movie> getQueue(int id) {
		try {
			PreparedStatement stmt = con.prepareStatement("SELECT movie.movieId, movieImage FROM "
					+ "queue JOIN movie ON queue.movieID = movie.movieID " + "WHERE queue.memberId = ?;");
			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();
			ArrayList<Movie> movies = new ArrayList<>();
			while (rs.next()) {
				Movie m = new Movie();
				m.setId(rs.getInt(1));
				m.setThumbnail(rs.getString(2));
				movies.add(m);
			}
			return movies;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	/*
	 * Gets all recommended movies. This just gets all movies that is the same genre
	 * as the member's genrePreference.
	 */
	public ArrayList<Movie> getRecommendations(String id) {
		try {
			PreparedStatement stmt = con.prepareStatement("SELECT movie.movieId, movieImage "
					+ "FROM movie WHERE movie.movieGenre = (SELECT member.genrePreference FROM "
					+ "member WHERE member.memberID = ?);");
			stmt.setString(1, id);

			ResultSet rs = stmt.executeQuery();
			ArrayList<Movie> movies = new ArrayList<>();
			while (rs.next()) {
				Movie m = new Movie();
				m.setId(rs.getInt(1));
				m.setThumbnail(rs.getString(2));
				movies.add(m);
			}
			stmt = con.prepareStatement("SELECT member.genrePreference FROM member WHERE memberId = ?;");
			stmt.setInt(1, new Integer(id));
			rs = stmt.executeQuery();
			rs.next();
			String favorite = rs.getString(1);
			ArrayList<Movie> history = getHistory(new Integer(id));
			if(history.size() != 0) {
				for(Movie m : history) {
					if(!m.getGenre().equals(favorite)) {
						ArrayList<Movie> moreMovies = getMoviesByGenre(m.getGenre());
						for(Movie movie : moreMovies) {
							movies.add(movie);
						}
						break;
					}
				}
			}
			Collections.shuffle(movies);
			while(movies.size() > 20) {
				movies.remove(movies.size() - 1);
			}
			return movies;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
