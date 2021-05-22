package com.nguyentanhuy.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nguyentanhuy.DAO.UserDAO;
import com.nguyentanhuy.entities.User;

@Controller
public class HelloController {

	@Autowired
	UserDAO userDAO;

	@Autowired
	User user;

	@RequestMapping(path = "/")
	public String helloRegister(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "register";
	}

	@RequestMapping(path = "/checkMail", method = RequestMethod.POST)
	@ResponseBody
	public String checkEmail(@RequestParam(value = "email") String email) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		String ajaxRespond = "";
		if (userDAO.isExistEmail(email)) {
			String messege = "Email đã tồn tại";
			ajaxRespond = mapper.writeValueAsString(messege);
			return ajaxRespond;
		}
		return mapper.writeValueAsString("");
	}

	@RequestMapping(path = "/register")
	public String register(@Valid @ModelAttribute("user") User u, BindingResult bindingResult,
			HttpServletRequest request) throws JsonProcessingException {
		String rePass = request.getParameter("re_password").trim();
		if (bindingResult.hasErrors() || userDAO.isExistEmail(u.getEmail())
				|| checkRePass(rePass, u.getPassword()).equals("")) {
			System.out.println(bindingResult.toString());
			return "register";
		} else {
//			if (u.isFemale() == true) {
//				u.setFemale(false);
//
//			}
			userDAO.insertUser(u);
			return "helloUser";
		}

	}

	@RequestMapping(path = "/memberList", method = RequestMethod.GET)
	public String getMemberList(Model model, ModelAndView mv) {
		List<User> listMember = userDAO.getMemberList();
		model.addAttribute("listMember", listMember);
		model.addAttribute("listMemberSize", listMember.size());
		return "member-list";
	}

	@RequestMapping(path = "/chooseGender", method = RequestMethod.POST)
	@ResponseBody
	public String chooseGender(@RequestParam(value = "gender") String gender) throws JsonProcessingException {
		System.out.println(gender);
		List<User> list = userDAO.chooseGender(gender);
		ObjectMapper map = new ObjectMapper();
		String listUser = map.writeValueAsString(list);
		System.out.println(listUser);
		return listUser;
	}

	@RequestMapping(path = "/checkRePass", method = RequestMethod.POST)
	@ResponseBody
	public String checkRePass(@RequestParam(value = "RePass") String rePass, @RequestParam(value = "Pass") String pass)
			throws JsonProcessingException {
		String message = "";
		ObjectMapper mapper = new ObjectMapper();
		if (!rePass.equals(pass)) {
			message = mapper.writeValueAsString("Mật khẩu không trùng khớp");
			return message;
		}
		return mapper.writeValueAsString("");
	}

	@RequestMapping(method = RequestMethod.GET, path = "/memberDetail")
	public String memberDetail(@RequestParam(value = "email") String email, Model model) {
		user = userDAO.getMemberDetail(email);
		model.addAttribute("user", user);
		return "member-detail";
	}
}
