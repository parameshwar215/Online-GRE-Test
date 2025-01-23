package com.gre.service;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gre.entity.Category;
import com.gre.entity.ExamSchedule;
import com.gre.repo.ICategoryRepo;
import com.gre.repo.IExamRepo;

import jakarta.servlet.http.HttpSession;

@Service
public class CategoryServices {
	@Autowired
	IExamRepo aRepo;
	
	
	@Autowired
	ICategoryRepo cRepo;
	public String saveCat(Category c) {
		List<Category> cList=cRepo.findAll();
		 boolean flag=true;
		 for(Category cat:cList) {
			 if(cat.getCat().equalsIgnoreCase(c.getCat())){
				 flag=false;
				 break;
			 }
		 }
		 if(flag==true) {
			 cRepo.save(c);
			return  "redirect:/viewQuestions";
		 }
		 else {
			 return  "redirect:/viewQuestions";
		 }
	}
	public String deleteCat(String cat,HttpSession session) {
		List<ExamSchedule> exlist = aRepo.findAll();
		boolean flag=true;
		for(ExamSchedule es:exlist) {
			Set<Category> cList1 = es.getCatSet();
		     Iterator<Category> iterator = cList1.iterator();
		     while (iterator.hasNext()) {
		         Category c = iterator.next();
		         if (c.getCat().equalsIgnoreCase(cat)) {
		             flag=false;
		             session.setAttribute("flag", true);
		             break;
		         }
		     }
		     if(flag==false) {
		    	 break;
		     }
		}
		if(flag==true) {
			session.setAttribute("flag", false);
			List<Category> cList1=cRepo.findAll();
			for(Category ca:cList1) {
				if(ca.getCat().equalsIgnoreCase(cat)) {
					int caId=ca.getCategoryId();
					cRepo.deleteById(caId);
					break;
					
				}
			}
			return "redirect:/viewQuestions";
			
		}
		else{
			return "redirect:/viewQuestions";	
		}	
	}
	
	
	
	
	

}
