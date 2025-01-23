package com.gre.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gre.entity.Category;
import com.gre.repo.ICategoryRepo;
import com.gre.repo.IExamRepo;
import com.gre.service.CategoryServices;

import jakarta.servlet.http.HttpSession;

@Controller
public class CategoryController {
	@Autowired
	ICategoryRepo cRepo;
	@Autowired
	IExamRepo aRepo;
	@Autowired
	CategoryServices cService;
	

	@RequestMapping("/addCat")
	public String AddQuestion() {
		List<Category> cList=cRepo.findAll();
		return "ViewExams";
	}
	 @PostMapping("/saveC")
	 public String saveCat(Category c) {
		 return cService.saveCat(c); 
	 }

	 @GetMapping("/findAllCat")
	 public List<Category> getAll(){
		return  cRepo.findAll();
		 
	 }
	 
	 @RequestMapping("/viewcat")
	 public String viewCat(Model model) {
		  List<Category> cList=cRepo.findAll();
		  model.addAttribute("clist", cList);
		  return "viewCat";
	 }
	@GetMapping("/deleteC")
	public String deleteCat(@RequestParam("cat") String cat, Model model,HttpSession session) {
	      return cService.deleteCat(cat,session);
	}
	
}
