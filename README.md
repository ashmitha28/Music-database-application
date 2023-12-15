Music Database Application

This application connects to a MySQL database containing music data, allowing users to query and retrieve information based on music genres.
Setup

* 		Database Configuration:
  
    * Ensure you have a MySQL server running.
      
    * Use the provided database dump (musicdbappandarajuA.sql) to set up the required database and tables.
      
        * Update the Java files (JavaApplication.java) with your database connection details:
          
        * Set your MySQL username, password, jdbc url when prompted.
          
* 		Project Dependencies:
  
    * This project uses JDBC for database connectivity. Ensure you have the MySQL Connector/J library added to your project's classpath.

Running the Application
* 		Compile and Run:
  
    * Compile the Java file JavaApplication.java .
      
    * Run the compiled file to launch the application.
      
* 		Usage:
  
    * The program will prompt you to enter your MySQL username and password.

    * You will be presented with a list of available music genres.

    * Choose a music genre by entering its name. The program will display the songs associated with that genre.

    * After displaying the songs, the program will ask if you want to select another genre. You can enter "yes" to continue or "no" to exit the application.

    * If you continue, you can select another genre and repeat the process.

    * To exit the program, enter "no" when prompted to select another genre.
      
* 		Handling Invalid Input:
  
    * If you provide an invalid music genre, the application will prompt you to enter a valid one.

Additional Notes

* This application uses Java as the host language to interact with the MySQL database.
  
* Make sure you have appropriate permissions and the necessary MySQL access to the configured database.

Files Included

* JavaApplication.java: Main Java file for the application.
  
* musicdbappandarajuA.sql: Database dump for the music database.
  
* Java Hw8AppandarajuA.java.txt: Information on running the application.

**Host Language for Music Database Application**

This submission contains an application coded in Java to connect to a MySQL database, execute queries based on user input, and display details related to music genres. Please note that the host language for this assignment is Java.

Thank you!

