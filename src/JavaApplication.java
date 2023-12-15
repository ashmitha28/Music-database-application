import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class JavaApplication {

  public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);

    // Step 1: Prompt the user for MySQL username and password
    System.out.print("Enter MySQL username: ");
    String username = scanner.nextLine();
    System.out.print("Enter MySQL password: ");
    String password = scanner.nextLine();
    System.out.print("Enter JDBC URL: ");

    // Step 2: Establish a database connection
    String jdbcURL = scanner.nextLine();
    try {
      Connection connection = DriverManager.getConnection(jdbcURL, username, password);

      // Step 3: Retrieve the list of music genres from the database
      List<String> genres = getGenreListFromDatabase(connection);
      while (true) {
        // Step 4: Display the list of genres to the user
        System.out.println("Available music genres:");
        for (String genre : genres) {
          System.out.println(genre);
        }

        // Step 5: Prompt the user for a music genre and validate input
        String selectedGenre = promptForGenre(scanner, genres);

        // Step 6: Execute an SQL statement based on the user's input
        String sqlStatement = "SELECT * FROM genres WHERE genre_name=?";
        try {
          String callProcedure = "{CALL song_has_genre(?)}";
          CallableStatement callableStatement = connection.prepareCall(callProcedure);
          callableStatement.setString(1, selectedGenre);
          ResultSet resultSet = callableStatement.executeQuery();

          // Print the result set to standard output
          while (resultSet.next()) {
            int sid = resultSet.getInt("sid");
            String songName = resultSet.getString("song_name");
            String albumName = resultSet.getString("album_name");

            System.out.println("Song ID: " + sid);
            System.out.println("Song Name: " + songName);
            System.out.println("Album Name: " + albumName);
            System.out.println();
          }

          resultSet.close();
          callableStatement.close();
        } catch (SQLException e) {
          System.err.println("SQL Error: " + e.getMessage());
        }
        System.out.print("Do you want to select another genre? (yes/no): ");
        String continueChoice = scanner.nextLine().toLowerCase();
        if (!continueChoice.equals("yes")) {
          break;
        }
      }
      // Step 8: Close the connection
      connection.close();
    } catch (SQLException e) {
      System.err.println("Failed to connect to the database.");
    }
  }

  private static List<String> getGenreListFromDatabase(Connection connection) throws SQLException {
    List<String> genres = new ArrayList<>();
    String query = "SELECT genre_name FROM genres";
    PreparedStatement preparedStatement = connection.prepareStatement(query);
    ResultSet resultSet = preparedStatement.executeQuery();
    while (resultSet.next()) {
      genres.add(resultSet.getString("genre_name"));
    }
    resultSet.close();
    preparedStatement.close();
    return genres;
  }

  private static String promptForGenre(Scanner scanner, List<String> genres) {
    String selectedGenre;
    while (true) {
      System.out.print("Enter a music genre: ");
      selectedGenre = scanner.nextLine();
      if (genres.contains(selectedGenre)) {
        break; // Exit the loop if the input is valid
      } else {
        System.out.println("Invalid genre. Please choose from the list of available genres.");
      }
    }
    return selectedGenre;
  }
}
