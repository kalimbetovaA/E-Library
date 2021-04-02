package kz.iitu.javaee;

public class UserAndBooks {
    private int userId;
    private int bookId;
    private String status;

    public UserAndBooks() {
    }

    @Override
    public String toString() {
        return "UserAndBooks{" +
                "userId=" + userId +
                ", bookId=" + bookId +
                ", status='" + status + '\'' +
                '}';
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
