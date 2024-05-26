package com.DAO;



import java.util.List;

import com.entity.BookDtls;

public interface BookDAO {
 public boolean addBooks(BookDtls b);
 public List<BookDtls> getAllBooks();
 public BookDtls getBookById(int id);
 public boolean editBooks(BookDtls b);
 public boolean deleteBooks(int id);
 public List<BookDtls> getNewBooks();
 public List<BookDtls> getITBooks();
 public List<BookDtls> getLiteratureBooks();
 public List<BookDtls> getAllNewBooks();
 public List<BookDtls> getAllITBooks();
 public List<BookDtls> getAllLiteratureBooks();
 public List<BookDtls> getAllBookByUserId(String uEmail);
public boolean deleteByEmail(String uEmail);
List<BookDtls> getBookBySearch(String ch);
} 
