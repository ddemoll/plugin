# Plug IN

Plug IN is an application that allows users to stream movie trailers to their devices. Users can set up an account by entering their name, email address, phone number, password billing information, shipping information, and payment information. The user must also select their favorite genre so movie recommendations can be generated. The user must select a subscription level when they register for an account. The available levels are Bronze, 5 movies per month at $2.00 per month, Silver, 10 movies per month at $5.00 per month, Gold, 15 movies per month at $10.00 per month, and Platinum, unlimited movies at $15.00 per month. The billing month starts on the day of the month that the user registered. After a user views a movie, they can watch it as many times as they want in the current billing period.

There is a search page where users are able to search for movies. They can do this by filtering by specific categories, such as actor, year, or genre. They can also do this by looking through a suggested category or looking through their queue which is where a user is able to save any movies they want for later. They can click watch now to go the details page to watch the trailer and view for information about the movie such as the rating, release date, description, and view count. Users also have the option to “like” a movie.

Upon registering for an account with Plug IN the users information is saved to Plug IN's database. If the user decides they wish to update their information there is an "Edit Profile" button that the user can click on and subsequently update their information. Any of the user’s information can be updated except for their username and email. There is also a "log out" button available so that the user an safely log out of Plug IN.

There is also a profile page which displays the user’s name, email address, phone number, billing information, shipping information, and payment information. This page also includes the history of all the movie trailers they have viewed sorted by billing month.


## Project Features

1) Ability to watch trailers for a specific movie
2) Queue to hold movies the user wishes to watch later
3) Ability to search/filter through movies
4) Browse page that displays recommended movies and movies sorted by genre
4) Log In/Log Out functionality
5) Ability for user to sign up for a subscription
6) A brief description of what each movie is about
7) A profile page to view user information
7) An edit profile page to edit user information

## Development Environment

Apache Tomcat Java web server running Servlets and JSPs to display dynamic content from a MySQL database and HTML/CSS for the front end

## Usage examples

One example of user interaction with the system: A user decides to create an account with Plug IN. They register with Plug in by going to the web page and clicking the register button. They then provide their name, email address, and password, genre preference, subscription level, billing information, shipping information, and credit card information which is saved to the database after the submit button is pressed. Once a user has created an account they will then be brought to the home page. From here they can browse through suggested movies, search specific movies, or filter movies. Once they find something that they might want to watch, they can watch the trailer. If the user decides they want to watch the movie, they can press the play button. After their session is over they can choose to press the "log out" button to safely log off of the site.

Another example of a user interaction with the system: A user decides to create an account with Plug IN. They register with Plug in by going to the web page and clicking the register button. They then provide their name, email address, and password which is saved to the database after the submit button is pressed. Once a user has created an account they will then be brought to the home page. This time, they do not start browsing right away but notice that they did spelled their name incorrectly as is displayed on the home page. They then press the "edit profile" button, and are brought to a page where they can update their information. After this the customer decides they do not wish to browse movies at this time, and they press the "log out" button to safely log off of the site.
