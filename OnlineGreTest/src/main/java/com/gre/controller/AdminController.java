package com.gre.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gre.entity.Admin;
import com.gre.repo.IAdminRepo;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	IAdminRepo aRepo;
	
	
	@RequestMapping("/")
	public String loginPage() {
		return "login.jsp";
		
	}
	@RequestMapping("/home")
	public String homePage() {
		return "home";
		
	}
	
	@GetMapping("/admin")
	public List<Admin> geAdmin() {
		return aRepo.findAll();
	}
	
	@RequestMapping("/profile")
	public String profile(HttpSession session,Model m){
	String email =(String)session.getAttribute("email");
	Admin a=aRepo.findByEmail(email);
	m.addAttribute("admin",a);
	System.out.println(a.getAdminName());
	return "profile";
	}
	@RequestMapping("/editP")
	public String editAP(HttpSession session,Model m ) {
	String email =(String)session.getAttribute("email");
    Admin a=aRepo.findByEmail(email);
	m.addAttribute("admin",a);
	return "editProfile";
	}
	@PostMapping("/saveUpdates")
	public String editP(@ModelAttribute Admin admin ,HttpSession session) {
		String email =(String)session.getAttribute("email");
		
	Admin a= aRepo.findByEmail(email);
	a.setAdminName(admin.getAdminName());
	a.setCity(admin.getCity());
	a.setState(admin.getState());
	a.setAddress(admin.getAddress());
	a.setCountry(admin.getCountry());
	session.setAttribute("name",admin.getAdminName());
	System.out.println(a);
	
     aRepo.save(a);
     return "profile";
     }
	
	@PostMapping("/login")
	public String login_user(@RequestParam("email") String email,@RequestParam("password") String password,HttpSession session,ModelMap modelMap,Model model)
			
	{

	Admin ad=aRepo.findByEmailPassword(email, password);
	
   
	if(ad!=null)
		
	{
		int aid=ad.getAdminId();
	    String em=ad.getEmail();
		String apass=ad.getPassword();
		session.setAttribute("admin", ad);
	
		if(email.equalsIgnoreCase(em) && apass.equalsIgnoreCase(password)) 
			
		{
			session.setAttribute("flag", false);
			session.setAttribute("aid",aid);
			session.setAttribute("email",em);
			session.setAttribute("pass",apass);
			String name=ad.getAdminName();
			session.setAttribute("name",name);
			///aRepo.save(ad);
			// model.addAttribute("success", "Login successful");
			 return "home";
			
		}
		else 
		{
			model.addAttribute("error", "invalid credentilas entered");
			return "login";
		}
	}
	else
	{
		model.addAttribute("error", "invalid credentilas entered");
		return "login";
	}
	
    }
	@GetMapping("/logout")
	public String logout_user(HttpSession session)
	{
		session.removeAttribute("aid");
		session.invalidate();
		return "login";
	}
	@GetMapping("/sessionexpired")
	public String sessionExpired()
	{
		
		return "sessionExpired";
	}

	

	

}
