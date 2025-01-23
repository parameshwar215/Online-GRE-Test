package com.gre.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.gre.entity.Questions;


@Repository
public interface IQuestionRepo extends JpaRepository<Questions, Integer> {

}
