package com.meproject.Reposities;

import org.springframework.data.jpa.repository.JpaRepository;

import com.meproject.Entity.User;

public interface UserRespository extends JpaRepository<User,String>{
}
