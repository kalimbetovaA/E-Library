package kz.iitu.javaee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBConnection {
    private static String url = "jdbc:mysql://localhost/library";
    private static String driverName = "com.mysql.jdbc.Driver";
    private static String login = "root";
    private static String dbpassword = "root";
    Connection connection;
    Statement statement;


    public DBConnection() {
        connect();
    }

    public void connect() {
        try {
            Class.forName(driverName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try{
            connection = DriverManager.getConnection(url, login, dbpassword);
            statement = connection.createStatement();
        } catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User getUser(String username, String password){

        String sqlString = "SELECT * FROM users WHERE username='" + username +"' AND "+"password='" + password+"'";
        User user = new User();
        try {
            ResultSet resultSet = statement.executeQuery(sqlString);
            while (resultSet.next()) {
                user.setUserId(resultSet.getInt("user_id"));
                user.setUsername(resultSet.getString("username"));
                user.setFullname(resultSet.getString("fullname"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setRole(resultSet.getString("role"));
            }
            } catch (SQLException e) {
                System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
            } catch (Exception e) {
                e.printStackTrace();
            }

        return user;
    }

    public User getUserById(int userId){

        String sqlString = "SELECT * FROM users WHERE user_id=" + userId;
        User user = new User();
        try {
            ResultSet resultSet = statement.executeQuery(sqlString);
            while (resultSet.next()) {
                user.setUserId(resultSet.getInt("user_id"));
                user.setUsername(resultSet.getString("username"));
                user.setFullname(resultSet.getString("fullname"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setRole(resultSet.getString("role"));
            }
        } catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public int createUser(User user){

        String sqlString = "insert into users (fullname, email, username, password, role) values('"
                +user.getFullname()+"', '"
                +user.getEmail()+"', '"
                +user.getUsername()+"', '"
                +user.getPassword()+"', '"
                +user.getRole()+"')";

        int result=0;
        try{
            result = statement.executeUpdate(sqlString);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public List<Book> getBooks(){

        String sqlString = "SELECT * FROM books";
        List<Book> bookList = new ArrayList<Book>();
        try {
            ResultSet resultSet = statement.executeQuery(sqlString);
            while (resultSet.next()) {
                Book book=new Book();
                book.setBookId(resultSet.getInt("book_id"));
                book.setTitle(resultSet.getString("title"));
                book.setDescription(resultSet.getString("description"));
                book.setGenre(resultSet.getString("genre"));
                bookList.add(book);
            }
        } catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookList;
    }

    public int addBook(Book book){

        String sqlString = "insert into books (title, description, genre) values('"
                +book.getTitle()+"', '"
                +book.getDescription()+"', '"
                +book.getGenre()+"')";

        int result=0;
        try{
            result = statement.executeUpdate(sqlString);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    public List<User> getUsers(){

        String sqlString = "SELECT * FROM users";
        List<User> userList = new ArrayList<User>();
        try {
            ResultSet resultSet = statement.executeQuery(sqlString);
            while (resultSet.next()) {
                User user=new User();
                user.setUserId(resultSet.getInt("user_id"));
                user.setUsername(resultSet.getString("username"));
                user.setFullname(resultSet.getString("fullname"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setRole(resultSet.getString("role"));
                userList.add(user);
            }
        } catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }


    public Book getBookById(int id){

        String sqlString = "SELECT * FROM books WHERE book_id=" + id;
        Book book = new Book();
        try {
            ResultSet resultSet = statement.executeQuery(sqlString);
            while (resultSet.next()) {
                book.setBookId(resultSet.getInt("book_id"));
                book.setTitle(resultSet.getString("title"));
                book.setDescription(resultSet.getString("description"));
                book.setGenre(resultSet.getString("genre"));
            }
        } catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return book;
    }

    public int deleteBook(int id){

        String sqlString = "DELETE FROM books WHERE book_id=" + id;

        int result=0;
        try{
            result = statement.executeUpdate(sqlString);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public int borrowBook(int userId, Book book){

        int row = hasUserBook(userId, book.getBookId());
        String sqlString;
        if(row!=0){
            sqlString = "update users_book set status='borrowed' where book_id="+book.getBookId()+" and user_id="+userId;
        }else{
            sqlString = "insert into users_book (user_id, book_id, status) values("
                    +userId+", "
                    +book.getBookId()+", "
                    + "'borrowed' )";
        }

        int result=0;
        try{
            result = statement.executeUpdate(sqlString);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<Integer> getUserBooks(int userId, String status){

        String sqlString = "SELECT * FROM users_book where status='"+status+"' and user_id="+userId;
        List<Integer> bookIds = new ArrayList<Integer>();
        try {
            ResultSet resultSet = statement.executeQuery(sqlString);
            while (resultSet.next()) {
                bookIds.add(resultSet.getInt("book_id"));
            }
        } catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookIds;
    }

    public int hasUserBook(int userId, int bookId){

        String sqlString = "SELECT count(*) as row_count FROM users_book WHERE user_id=" + userId+" and book_id=" + bookId;
        int row_count=0;
        try {
            ResultSet resultSet = statement.executeQuery(sqlString);
            while (resultSet.next()) {
                row_count=resultSet.getInt("row_count");
            }
        } catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return row_count;
    }

    public List<UserAndBooks> getAllUsersBooks(String status){

        String sqlString = "SELECT * FROM users_book where status='"+status+"'";
        List<UserAndBooks> usersBooks = new ArrayList<UserAndBooks>();
        try {
            ResultSet resultSet = statement.executeQuery(sqlString);
            while (resultSet.next()) {
                UserAndBooks userBook=new UserAndBooks();
                userBook.setUserId(resultSet.getInt("user_id"));
                userBook.setBookId(resultSet.getInt("book_id"));
                userBook.setStatus(resultSet.getString("status"));
                usersBooks.add(userBook);
            }
        } catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return usersBooks;
    }


    public int returnBook(int userId, Book book){

        String sqlString = "update users_book set status='returned' where book_id="+book.getBookId()+" and user_id="+userId;

        int result=0;
        try{
            result = statement.executeUpdate(sqlString);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


}
