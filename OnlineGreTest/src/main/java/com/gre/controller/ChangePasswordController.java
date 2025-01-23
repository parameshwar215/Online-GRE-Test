package com.gre.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.gre.entity.Admin;
import com.gre.entity.Changepassword;
import com.gre.repo.IAdminRepo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ChangePasswordController {
	@Autowired

	private IAdminRepo arepo;

	@GetMapping("/forgetpassword")
	public String forgetpassword(Model model) {
		model.addAttribute("changepassword", new Changepassword());
		model.addAttribute("oldnewequal", false);
		model.addAttribute("newconformsame", false);
		model.addAttribute("old", false);
		model.addAttribute("np", false);
		model.addAttribute("cp", false);
		return "resetpassword";
	}

	@PostMapping("/changepassword")
	public String changePassword(@ModelAttribute("changepassword") Changepassword password, Admin admin,
			BindingResult result, HttpServletRequest request, Model model, HttpSession session) {

		String email = (String) session.getAttribute("email");

		Admin a = arepo.findByEmail(email);

		String old = a.getPassword();
		
       String em=a.getEmail();
		if (em == null) {

			model.addAttribute("changepassword", new Changepassword());
			model.addAttribute("oldnewequal", false);
			model.addAttribute("newconformsame", false);
			model.addAttribute("old", false);
			model.addAttribute("np", false);
			model.addAttribute("cp", false);
			return "error";
		}

		if (result.hasErrors()) {

			model.addAttribute("old", false);
			model.addAttribute("oldnewequal", false);

			model.addAttribute("newconformsame", false);

			model.addAttribute("np", false);

			model.addAttribute("cp", false);
			return "resetpassword";
		}
// 1.old null - old !=old

		if (password.getOldPassword() == ""
				|| !old.equals(password.getOldPassword())) {

			System.out.print("old :" + old + "==" + "getOldpassword :" + password.getOldPassword());
			System.out.println();

			model.addAttribute("old", true);
			model.addAttribute("oldnewequal", false);

			model.addAttribute("newconformsame", false);
			model.addAttribute("np", false);
			model.addAttribute("cp", false);
			return "resetpassword";
		}
		
//2. old==new && old==confirm

		if (password.getOldPassword().equals(password.getNewPassword())
				|| password.getOldPassword().equals(password.getConformPassword())) {

			System.out.println("old :" + old + "==" + "confirm password :" + password.getConformPassword());
			System.out.print("old :" + old + "==" + "new password :" + password.getNewPassword());

			System.out.println();
			model.addAttribute("old", false);

			model.addAttribute("oldnewequal", true);

			model.addAttribute("newconformsame", false);
			model.addAttribute("np", false);

			model.addAttribute("cp", false);
			return "resetpassword";

		}
//3. new !=confirm

		if (!password.getNewPassword().equals(password.getConformPassword())) {
			System.out.println("old :" + old + "==" + "confirm password :" + password.getConformPassword());

			System.out.print("old :" + old + "==" + "new password :" + password.getNewPassword());

			System.out.println();

			model.addAttribute("old", false);

			model.addAttribute("oldnewequal", false);

			model.addAttribute("newconformsame", true);
			model.addAttribute("np", false);
			model.addAttribute("cp", false);

			return "resetpassword";
		}

////4. new==null ,confirm==null

		if (password.getNewPassword() == "" || password.getConformPassword() == "") {

			System.out.println("old :" + old + "==" + "confirm password :" + password.getConformPassword());

			System.out.println(
					"new :" + password.getNewPassword() + "==" + "confirmpassword :" + password.getConformPassword());

			System.out.println();

			model.addAttribute("old", false);
			model.addAttribute("oldnewequal", false);
			model.addAttribute("newconformsame", false);
			model.addAttribute("np", true);
			model.addAttribute("cp", true);
			return "resetpassword";

		}

		System.out.println("old :" + old + "==" + "getOldpassword :" + password.getOldPassword());

		System.out.println(
				"new :" + password.getNewPassword() + "==" + "confirmpassword :" + password.getConformPassword());

		System.out.println();

		a.setPassword(password.getNewPassword());

		arepo.save(a);

		return "login";

	}
}