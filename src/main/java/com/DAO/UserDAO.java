package com.DAO;

import com.entity.User;

public interface UserDAO {
public boolean userRegister(User us);
public boolean checkExist(User us);
public User login(String email,String password);
public boolean  checkPassword(int id, String ps);
boolean updateProfiles(User user);
boolean updateProfilesOrder(User user);

}
