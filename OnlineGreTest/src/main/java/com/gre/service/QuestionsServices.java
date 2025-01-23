package com.gre.service;

import org.aspectj.weaver.patterns.TypePatternQuestions.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.gre.entity.Category;
import com.gre.entity.Questions;
import com.gre.repo.ICategoryRepo;
import com.gre.repo.IQuestionRepo;

@Service
public class QuestionsServices {
	
	@Autowired
	ICategoryRepo cRepo;
	@Autowired
	ICategoryRepo cRpo;
	@Autowired
	IQuestionRepo qRepo;
	
	public  String saveQuestion(Questions q) {
		
		Category c=cRpo.findByCat(q.getCategoryName());
		 q.setCateg(c);
		 qRepo.save(q);
		 return "redirect:/viewQuestions";
		
	}
	
	public String deleteQuestion(int id){
		qRepo.deleteById(id);
        return "redirect:/viewQuestions";
		
	}
	
	

}
