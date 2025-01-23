package com.gre.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gre.entity.Category;
import com.gre.entity.Questions;
import com.gre.repo.ICategoryRepo;
import com.gre.repo.IQuestionRepo;
import com.gre.service.QuestionsServices;

import jakarta.servlet.http.HttpSession;

@Controller

public class QuestionController {
	
	@Autowired
	QuestionsServices qServices;
	
	@Autowired
	ICategoryRepo cRepo;
	@Autowired
	ICategoryRepo cRpo;
	@Autowired
	IQuestionRepo qRepo;
	
	@GetMapping("/addQ")
	public String AddQuestion(Model model) {
		List<Category> categoryList=cRpo.findAll();
		model.addAttribute("list",categoryList );

        
		return "addQuestion";
	}
	@ResponseBody
	@GetMapping("/get/{id}")
	public int  getQuestion(@PathVariable int id) {
		//Questions q= qRepo.getById(id);
		return id;
	}
	 @PostMapping("/saveQ")
	 public String saveQuestoin(Questions q) {
		 
		 return qServices.saveQuestion(q);
	 }
	 
	 @GetMapping("/deleteQ/{id}")
	 public String deleteQ(@PathVariable int id ) {
         return qServices.deleteQuestion(id);

	 }
	 @RequestMapping("/viewQuestions")
	 public String viewQuestions(Model model,HttpSession session) {
//		session.setAttribute("flag", false);
		 List<Category> cList=cRepo.findAll();
		  session.setAttribute("clist", cList);
		 return "viewQuestions";
	 }
	 @GetMapping("/updateQ/{id}")
	 public String updateQ(@PathVariable int id,Model model) {
		 
//		Question q=qRepo.getById(id);
		model.addAttribute("id", id);
		//model.addAttribute("Q", q);
		return "updateQ";
		 
	 }
	 
	 @GetMapping("/getQuestion/{id}")
	 public String getQ(@PathVariable int id,Model model) {
		 List<Category> cList=cRepo.findAll();
		  model.addAttribute("clist", cList);
		  Category c=cRepo.getById(id);
		  model.addAttribute("cname", c.getCat());
//		Question q=qRepo.getById(id);
		model.addAttribute("id", id);
		//model.addAttribute("Q", q);
		return "categoryWiseQuestions";
		 
	 }
	 @GetMapping("viewSyllabus/getQuestion/{id}")
	 public String getsyllabusQ(@PathVariable int id,Model model) {
		 List<Category> cList=cRepo.findAll();
		  model.addAttribute("clist", cList);
		  Category c=cRepo.getById(id);
		  model.addAttribute("cname", c.getCat());
//		Question q=qRepo.getById(id);
		model.addAttribute("id", id);
		//model.addAttribute("Q", q);
		return "categoryWiseQuestions";
		 
	 }
	 @GetMapping("addCat/getQuestion/{id}")
	 public String getsyllaBusQ(@PathVariable int id,Model model) {
		 List<Category> cList=cRepo.findAll();
		  model.addAttribute("clist", cList);
		  Category c=cRepo.getById(id);
		  model.addAttribute("cname", c.getCat());
//		Question q=qRepo.getById(id);
		model.addAttribute("id", id);
		//model.addAttribute("Q", q);
		return "categoryWiseQuestions";
		 
	 }
	 @PostMapping("/updateQuestion/{id}")
		public String editP(@ModelAttribute Questions question ,@PathVariable int id,HttpSession session) {
			Questions a=qRepo.getById(id);
			a.setQuestion(question.getQuestion());
			a.setNegativeMarks(question.getNegativeMarks());
			a.setA(question.getA());
			a.setB(question.getB());
			a.setC(question.getC());
			a.setD(question.getD());
			a.setAnswer(question.getAnswer());
	        qRepo.save(a);
	     return "redirect:/viewQuestions";
	     }
	 
		 

}
