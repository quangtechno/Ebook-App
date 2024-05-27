package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.entity.BookDtls;
import com.mysql.cj.protocol.Resultset;

public class BookDAOImpl implements BookDAO {
	private Connection con;

	public BookDAOImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean addBooks(BookDtls b) {
		boolean condition = false;
		try {
			String query = "Insert into book_dtls(bookname,author,price,bookCategory,status,photo,email) values(?,?,?,?,?,?,?);";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setDouble(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());
			int row = ps.executeUpdate();
			if (row == 1) {
				condition = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return condition;
	}

	@Override
	public List<BookDtls> getAllBooks() {
		List<BookDtls> list = new ArrayList<>();
		BookDtls b = null;
		try {
			String query = "select * from book_dtls";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BookDtls getBookById(int id) {
		BookDtls b = null;
		try {
			String query = "select * from book_dtls where bookId=?;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			System.out.println("Executing query: " + ps.toString());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public boolean editBooks(BookDtls b) {
		boolean condition = false;
		try {
			String query = "update book_dtls set bookname=?,author=?,price=?,status=? where bookId=? ;";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setDouble(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			int row = ps.executeUpdate();
			if (row == 1) {
				condition = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return condition;
	}

	@Override
	public boolean deleteBooks(int id) {
		boolean condition = false;
		try {
			String query = "delete from book_dtls where bookId=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			int row = ps.executeUpdate();
			if (row == 1) {
				condition = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return condition;
	}

	@Override
	public List<BookDtls> getNewBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();

		try {
			String query = "select * from book_dtls where bookCategory=? and status=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, "new");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i=0;
			while (rs.next()&&i<3) {
				BookDtls b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getITBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		try {
			String query = "select * from book_dtls where bookCategory=? and status=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, "IT");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i=0;
			while (rs.next()&&i<3) {
				BookDtls b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getLiteratureBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		try {
			String query = "select * from book_dtls where bookCategory=? and status=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, "Literature");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i=0;
			while (rs.next()&&i<3) {
				BookDtls b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<BookDtls> getAllNewBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();

		try {
			String query = "select * from book_dtls where bookCategory=? and status=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, "new");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BookDtls b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllITBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		try {
			String query = "select * from book_dtls where bookCategory=? and status=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, "IT");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BookDtls b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllLiteratureBooks() {
		List<BookDtls> list = new ArrayList<BookDtls>();
		try {
			String query = "select * from book_dtls where bookCategory=? and status=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, "Literature");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BookDtls b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookDtls> getAllBookByUserId(String uEmail) {
		List<BookDtls> list = new ArrayList<BookDtls>();
		try {
			String query = "select * from book_dtls where email=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, uEmail);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BookDtls b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean deleteByEmail(String uEmail) {
		boolean condition = false;
		try {
			String query = "delete from book_dtls where email=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, uEmail);
			int row = ps.executeUpdate();
			if (row == 1) {
				condition = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return condition;
	}

	@Override
	public List<BookDtls> getBookBySearch(String ch) {
		List<BookDtls> list = new ArrayList<BookDtls>();
		try {
			String query = "select * from book_dtls where bookname like? or author like? or bookCategory like?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BookDtls b = new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
