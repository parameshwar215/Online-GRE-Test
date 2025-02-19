package com.gre.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.gre.entity.Admin;

@Repository
public interface IAdminRepo extends JpaRepository<Admin,Integer>{
    @Query("From Admin where email=?1 and password=?2")
	Admin findByEmailPassword(String email, String password);
    @Query("From Admin where email=?1")
	Admin findByEmail(String email);

}
