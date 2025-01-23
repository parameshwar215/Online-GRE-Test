package com.gre.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.gre.entity.Category;
import com.gre.entity.ExamSchedule;


@Repository
public interface ICategoryRepo extends JpaRepository<Category, Integer> {

	
	 
//	@Query("from Category where cat=?1")
//	Category findByCategory(Category  c);
//	@Query("from Category where cat=?1")
//	Category findCategoryName(String categoryName);
	//ExamSchedule save(ExamSchedule ex);
	@Query("from Category where cat=?1")
	Category findByCat(String cat);

	

//	Category findByCatogory(String cat);

}
