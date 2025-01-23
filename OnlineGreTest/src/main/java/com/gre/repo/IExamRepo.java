package com.gre.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.gre.entity.ExamSchedule;

@Repository
public interface IExamRepo extends JpaRepository<ExamSchedule,Integer>{
    @Query("From ExamSchedule where examName=?1")
	ExamSchedule findByExamname(String examName);

//	Category findCatName(String categoryName);

}
