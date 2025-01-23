package com.gre.service;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gre.entity.Category;
import com.gre.entity.ExamSchedule;
import com.gre.repo.ICategoryRepo;
import com.gre.repo.IExamRepo;


@Service
public class ExamService {
	@Autowired
	IExamRepo eRepo;
	@Autowired
	ICategoryRepo cRepo;
	
	public ExamSchedule addCatToExam(ExamSchedule ex,Category cs) {
		Set<Category> catSet=null;
		catSet=ex.getCatSet();
		catSet.add(cs);
		ex.setCatSet(catSet);
		return eRepo.save(ex);
	}
	
	
	
	

}
