package kz.bitlab.models;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;

    static {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/bitlab_news?useUnicode=true&serverTimezone=UTC",
                    "root", "");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static User getUser(String email){
        User user = null;
        try{
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE email = ? LIMIT 1");
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                user = new User();
                user.setEmail(resultSet.getString("email"));
                user.setId(resultSet.getLong("id"));
                user.setPassword(resultSet.getString("password"));
                user.setFullName(resultSet.getString("full_name"));
                user.setRole_id(resultSet.getInt("role_id"));
            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    public static void updateUser(User user){
        String fullName = user.getFullName();
        Long id = user.getId();
        String password = user.getPassword();
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE users SET full_name = ?, password = ? where id = ?");
            statement.setString(1, fullName);
            statement.setString(2, password);
            statement.setLong(3, id);

            int resultSet = statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static ArrayList<News> getAllNews(){
        ArrayList<News> news = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select news.id as newsid, post_date ,nc.id as catid, nc.name as catname, title, content, count_comms from news\n" +
                    "inner join bitlab_news.news_categories nc on news.category_id = nc.id");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                News news1 = new News();
                Long id = resultSet.getLong("newsid");
                Timestamp postdate = resultSet.getTimestamp("post_date");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                int count_comms = resultSet.getInt("count_comms");
                Long catid = resultSet.getLong("catid");
                String catname = resultSet.getString("catname");
                Category category = new Category(catid, catname);

                news1.setId(id);
                news1.setPostDate(postdate);
                news1.setTitle(title);
                news1.setContent(content);
                news1.setCategory(category);
                news1.setCountComms(count_comms);
                news.add(news1);

            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
     return news;
    }

    public static News getNewById(Long id){
        News news = new News();
        try {
            PreparedStatement statement = connection.prepareStatement("select news.id as newsid, post_date ,nc.id as catid, nc.name as catname, title, content, count_comms from news inner join bitlab_news.news_categories nc on news.category_id = nc.id where news.id = ?");
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()){
                Timestamp postdate = resultSet.getTimestamp("post_date");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                int count_comms = resultSet.getInt("count_comms");
                Long catid = resultSet.getLong("catid");
                String catname = resultSet.getString("catname");
                Category category = new Category(catid, catname);

                news.setId(id);
                news.setPostDate(postdate);
                news.setTitle(title);
                news.setContent(content);
                news.setCategory(category);
                news.setCountComms(count_comms);

            }
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return news;
    }

    public static ArrayList<Category> getAllCategory(){
        ArrayList<Category> categories = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from news_categories");
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                categories.add(new Category(resultSet.getLong("id"), resultSet.getString("name")));
            }
            statement.close();
        } catch (Exception e){
              e.printStackTrace();
        }
        return categories;

    }

    public static ArrayList<News> getNewsByCategory(Category category){
        ArrayList<News> news = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("select * from news where category_id = ?");
            statement.setLong(1, category.getId());
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()){
                News news1 = new News();
                Long id = resultSet.getLong("id");
                Timestamp postdate = resultSet.getTimestamp("post_date");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                int count_comms = resultSet.getInt("count_comms");

                news1.setId(id);
                news1.setPostDate(postdate);
                news1.setTitle(title);
                news1.setContent(content);
                news1.setCategory(category);
                news1.setCountComms(count_comms);
                news.add(news1);
            }
            statement.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return news;
    }

    public static User getUserById(Long id){
        User user = new User();
        try{
            PreparedStatement statement = connection.prepareStatement("select * from users where id = ?");
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()){
                user.setId(resultSet.getLong("id"));
                user.setFullName(resultSet.getString("full_name"));
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }



    public static ArrayList<Comments> getAllCommentsByNew(News news){
        ArrayList<Comments> comments = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from comments where news_id = ?");
            preparedStatement.setLong(1, news.getId());
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                Comments comment = new Comments();
                comment.setId(resultSet.getLong("id"));
                comment.setComment(resultSet.getString("comment"));
                comment.setPost_date(resultSet.getTimestamp("post_date"));
                Long userid = resultSet.getLong("user_id");
                User user = DBManager.getUserById(userid);
                comment.setUser(user);
                comment.setNews(news);
                comments.add(comment);
            }
            preparedStatement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return comments;
    }

    public static void addNewComment(Comments comment){
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO comments (id, comment, post_date, user_id, news_id) "
            + "VALUES (null, ?, NOW(), ?, ?)");
            statement.setString(1, comment.getComment());
            statement.setLong(2, comment.getUser().getId());
            statement.setLong(3, comment.getNews().getId());
            int rows = statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void deleteComm(Long id){
        try{
            PreparedStatement statement = connection.prepareStatement("DELETE FROM comments where id = ?");
            statement.setLong(1, id);
            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Category getCategory(Long id){
        Category category = new Category();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * from news_categories WHERE id = ?");
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()){
                category.setId(resultSet.getLong("id"));
                category.setName(resultSet.getString("name"));
            }
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return category;
    }

    public static void updateComs(News news){
        ArrayList<Comments> comments = DBManager.getAllCommentsByNew(news);
        int count = comments.size();
        try{
            PreparedStatement statement = connection.prepareStatement("UPDATE news SET count_comms = ? where id=?");
            statement.setInt(1,count);
            statement.setLong(2,news.getId());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void addNews(News news){
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO news (id, post_date, category_id, title, content, count_comms) "
            + "VALUES (null, NOW(), ?, ?, ?, 0)");
            statement.setLong(1, news.getCategory().getId());
            statement.setString(2, news.getTitle());
            statement.setString(3, news.getContent());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteNews(Long id){
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE from news where id = ?");
            statement.setLong(1, id);
            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void updateNews(News news){
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE news SET category_id = ?, title = ?, content = ? where id = ?");
            statement.setLong(1, news.getCategory().getId());
            statement.setString(2, news.getTitle());
            statement.setString(3, news.getContent());
            statement.setLong(4, news.getId());
            statement.executeUpdate();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void createUser(User user){
        String fullName = user.getFullName();
        String email = user.getEmail();
        String password = user.getPassword();
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO users (id, email, password, full_name, role_id) VALUES (null, ?, ?, ?, 2)");

            statement.setString(1, email);
            statement.setString(2, password);
            statement.setString(3, fullName);

            int resultSet = statement.executeUpdate();
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
