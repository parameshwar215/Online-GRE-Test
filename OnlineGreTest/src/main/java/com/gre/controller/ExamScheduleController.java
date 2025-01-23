package com.gre.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gre.entity.Category;
import com.gre.entity.ExamSchedule;
import com.gre.repo.ICategoryRepo;
import com.gre.repo.IExamRepo;
import com.gre.service.ExamService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ExamScheduleController {
	
	@Autowired
	ICategoryRepo cRpo;
	@Autowired
	private IExamRepo eRepo;
	@Autowired
	ExamService eSevice;
	
	@GetMapping("/addE")
	public String AddQuestion(Model model) {
		return "addExam";
	}
	//@RequestMapping("/ViewExam")
	
	@RequestMapping("/addCat/{id}")
	public String AddCategories(@PathVariable int id,Model model,HttpSession session) {
		
		List<Category> categoryList=cRpo.findAll();
		ExamSchedule es=eRepo.getById(id);
		Set<Category> clist=es.getCatSet();
		session.setAttribute("c1list" ,categoryList);
		session.setAttribute("ex", es);
		session.setAttribute("clist", clist);
//		model.addAttribute("ex", es);
//		model.addAttribute("clist",categoryList);
		return "addCatToExam";
	}
	
	@PostMapping("/saveCategories")
	public String saveCategories(@RequestParam("examName") String examName, @RequestParam("cat") String cat,Model model,HttpSession session) {
		ExamSchedule es=eRepo.findByExamname(examName);
		Category c=cRpo.findByCat(cat);
		eSevice.addCatToExam(es, c);
		ExamSchedule es1=eRepo.findByExamname(examName);
		Set<Category> clist=es1.getCatSet();
		session.setAttribute("clist" ,clist);
		return "addCatToExam";
	}
	@GetMapping("/viewSyllabus/{id}")
	public String AddCatToExam(@PathVariable int id,Model model) {
		ExamSchedule ex=eRepo.getById(id);
		model.addAttribute("ex",ex);
		return "viewSyllabus";
	}
//	@GetMapping("/addCatToExam")
//	public String AddCatToExam(Model model) {
//		return "addExam";
////	}

	 @PostMapping("/saveE")
	 public String saveQuestoin(ExamSchedule es) {
		 List<ExamSchedule> elist=eRepo.findAll();
		 boolean flag=true;
		 for(ExamSchedule e:elist) {
			 if(e.getExamName().equalsIgnoreCase(es.getExamName())) {
				 flag=false;
				 break;
			 }
		 }
		 if(flag) {
			 eRepo.save(es);
			 return "ViewExams";
		 }
		 else return "ViewExams";
	
		 
	 }
	 @GetMapping("/delE/{id}")
		public String deleteE(@PathVariable int id) {
		 eRepo.deleteById(id);
		 
			return "redirect:/examView";
		}
	 
	 @GetMapping("/updateExam/{id}")
		public String updateE(@PathVariable int id,Model model) {
		 ExamSchedule ex=eRepo.getById(id);
		 model.addAttribute("ex", ex);
		 //eRepo.deleteById(id)
			return "updateExam";
		}
	 @PostMapping("/saveUpdate/{id}")
	 public String  saveUpdate(@PathVariable int id,ExamSchedule ex){
		 ExamSchedule ex1=eRepo.getById(id);
		 ex1.setExamLocation(ex.getExamLocation());
		 ex1.setDateOfExam(ex.getDateOfExam());
		 ex1.setExamName(ex.getExamName());
		 ex1.setFee(ex.getFee());
		 eRepo.save(ex1);
		 return "ViewExams";
		 
	 }
	
	 
	 

	 @RequestMapping("/removeCatFromSyllabs/{cid}/{eid}")
	 public String removeCatFromSyllabs(@PathVariable int cid, @PathVariable int eid,Model model) {
	     ExamSchedule ex = eRepo.getById(eid);
	     Set<Category> cList = ex.getCatSet();
	     Iterator<Category> iterator = cList.iterator();
	     while (iterator.hasNext()) {
	         Category c = iterator.next();
	         if (c.getCategoryId() == cid) {
	             iterator.remove();
	         }
	     }
	     ex.setCatSet(cList);
	     eRepo.save(ex);
	     ExamSchedule ex1 = eRepo.getById(eid);
	     model.addAttribute("ex", ex1);
	     return "viewSyllabus";
	 }

	 @RequestMapping("/examView")
	 public String viewExam(Model model) {
		 List<Category> categoryList=cRpo.findAll();
			List<ExamSchedule> examList=eRepo.findAll();
			model.addAttribute("elist", examList);
			model.addAttribute("clist",categoryList);
		 return "ViewExams";
	 }


}
