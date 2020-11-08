import java.io.File;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;
import java.sql.SQLException;

public class Oswestry {
    public static void main(String[] args) throws Exception {
        if (!checkArgs(args)) { return; }
        Connection conn = null;
        Statement stmt = null;
        PreparedStatement temp = null;
        try {
            SimpleDataSource.init(args[0]);
            conn = SimpleDataSource.getConnection();

            //SET UP:
            showTables(conn);

            //NORMAL OPERATION:
            //MENU:
            //ENTER USER
            //ENTER BOOK
            //UPDATE PROGRESS
            //DISPLAY PROGRESS
            menu(conn, stmt, temp);

        } catch (Exception e) {
            System.out.println(e.getMessage());
            //e.printStackTrace();
        }
    }

    //PRINT RESULT SET
    public static void printResultSet (ResultSet rs) throws SQLException {
        int i = 1;
        while (rs.next()) {
            //System.out.print(i + ": ");
            printTuple(rs);
            System.out.println();
            i++;
        }
    }

    //HELPER FUNCTION OF PRINT RESULT SET
    public static void printTuple (ResultSet rs) throws SQLException {
        for ( int i = 1; i <= rs.getMetaData().getColumnCount(); i++ ){
            System.out.print("[" + rs.getMetaData().getColumnName(i) + "]: " + rs.getString(rs.getMetaData().getColumnName(i)) + "\t" );
        }
    }

    public static void menu(Connection conn, Statement stmt, PreparedStatement temp) throws SQLException, Exception{
        int menuOption = 0;
        System.out.println(menuText());
        menuOption = getUserInt(1, 2, "Please select an option:");

        switch (menuOption) {
            case 1:
                oswestry(conn, stmt);
                menu(conn, stmt, temp);
                break;
            case 2:
                System.out.println("Exiting Menu.");
                break;
            default:
                System.out.println("Invalid option.");
                menu(conn, stmt, temp);        
        }
    }

    public static String menuText() {
        return "Menu:\n"
        + "Please select an option:\n"
        + "1. Complete oswestry questionnaire.\n"
        + "2. Exit.";
    }

    public static int oswestry(Connection conn, Statement stmt) throws SQLException { 
        int score = 0;
        for (int i = 1; i <= 10; i++) {
            score += presentQuestion(conn, stmt, i);
        }
        System.out.println("CONGRATULATIONS! YOU MADE IT!");
        System.out.println("Your score is: " + score);
        return score;
    }

    public static int presentQuestion(Connection conn, Statement stmt, int questionNumber) throws SQLException{
        System.out.println("This is question: " + questionNumber);
        System.out.println(getQuestion(conn, stmt, questionNumber));
        System.out.println(getAnswers(conn, stmt, questionNumber));
        int choice = getUserInt(0, 5, "Select an option: ");
        return choice;
    }

    public static String getQuestion(Connection conn, Statement stmt, int questionNumber) throws SQLException {
        stmt = conn.createStatement();
        String query = "SELECT question_text FROM Questions WHERE question_id = " + questionNumber;
        ResultSet rs = stmt.executeQuery(query);
        String question = rs.getString(rs.getMetaData().getColumnName(1));
        rs.close();
        return question;
    }

    public static String getAnswers(Connection conn, Statement stmt, int questionNumber) throws SQLException {
        stmt = conn.createStatement();
        String query = "SELECT answer_text FROM Answer_choices WHERE question_id = " + questionNumber;
        ResultSet rs = stmt.executeQuery(query);
        String answers = "";
        int i = 0;
        while (rs.next()) {
            answers += i + ": " + rs.getString(rs.getMetaData().getColumnName(1)) + "\n";
            i++;
        }
        rs.close();
        return answers;
    }

    public static boolean checkIfTableExists(Connection conn, String tableName) throws Exception {
        DatabaseMetaData dbm = conn.getMetaData();
        ResultSet tables = dbm.getTables(null, null, tableName, null);
        if (tables.next()) {
            return true;
        }
        return false;
    }

    public static void showTables(Connection conn) throws Exception {
        ResultSet rs = conn.getMetaData().getTables(null, null, null, null);
        while (rs.next()) {
            System.out.println(rs.getString("TABLE_NAME"));
        } 
    }

    public static boolean checkArgs(String[] args) {
        if (args.length == 0) {
            System.out.println(
            "Usage: java -classpath driver_class_path"
            + File.pathSeparator
            + ". TestDB propertiesFile");
            return false;
        }
        return true;
    }

    public static void createDb(Connection conn, String s) throws Exception {
        Statement stat = conn.createStatement();
        stat.execute("CREATE TABLE Test (Name VARCHAR(20))");
        stat.execute("INSERT INTO Test VALUES ('Romeo')");
        ResultSet result = stat.executeQuery("SELECT * FROM Test");
        result.next();
        System.out.println(result.getString("Name"));
        stat.execute("DROP TABLE Test");
    }
    // PROMPT USER TO ENTER A NUMBER WITHIN A RANGE. LOOPS UNTIL USER GETS IT RIGHT (ENTERS ANY INT).
    public static int getUserInt(int lowBound, int upBound, String message) {
        System.out.println( message + " ( " + lowBound + " - " + upBound + " ).");
        Scanner input = new Scanner(System.in);
        String line = input.nextLine();
        int choice = 0;
        try {
            choice = Integer.parseInt(line);
            if (choice >= lowBound && choice <= upBound) { //choice is within acceptable range
                return choice;
            } else {
                System.out.println("Number: " + choice + " outside of range. Try again.");
                choice = getUserInt(lowBound, upBound, message);
            }
        } catch (NumberFormatException e) {
            System.out.println("You've caused a number format exception. Try again.");
            choice = getUserInt(lowBound, upBound, message);
        }
        return choice;
    }

    public static String getUserString(String message) throws SQLException{
        Scanner input = new Scanner(System.in);
        System.out.println( message );
        String str = input.nextLine();
        return str;
    }
}