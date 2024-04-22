package com.waterwastage.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.waterwastage.Model.AreaVO;
import com.waterwastage.Model.LoginVO;
import com.waterwastage.Model.RegisterVO;
import com.waterwastage.Service.LoginService;
import com.waterwastage.Service.RegisterService;
import com.waterwastage.utils.Basemethods;

@Controller
public class RegisterController {

	@Autowired RegisterService registerService;
	@Autowired LoginService loginService;
	@RequestMapping(value = "admin/loadRegister", method = RequestMethod.GET)
	public ModelAndView loadRegister() {

		return new ModelAndView("admin/addEmployee","registerVO",new RegisterVO());
	}
	
	@RequestMapping(value = "admin/insertEmployee", method = RequestMethod.POST)
	public ModelAndView insertEmployee(@ModelAttribute RegisterVO registerVO,LoginVO loginVO) {

		loginVO.setUsername(registerVO.getLoginVO().getUsername());
		
		String password = Basemethods.generatePassword();
		loginVO.setPassword(password);
		
		Basemethods.sendMail(registerVO.getLoginVO().getUsername(), password,registerVO.getFirstName());
		loginVO.setEnabled("1");
		loginVO.setRole("ROLE_USER");
		loginVO.setStatus(true);
		this.loginService.insertLogin(loginVO);
		
		registerVO.setLoginVO(loginVO);
		registerVO.setStatus(true);
		this.registerService.insertRegister(registerVO);

		return new ModelAndView("redirect:/admin/loadRegister"); 
	}
	
	@RequestMapping(value="/admin/viewUser",method=RequestMethod.GET)
	public ModelAndView searchArea()
	{
	
		List userList = this.registerService.searchUser();
		System.out.println(userList.size());
		return new ModelAndView("admin/viewUser","userList",userList);	
	}
	
	@RequestMapping(value = "/admin/deleteUser", method = RequestMethod.GET)
	public ModelAndView DeleteUser(@ModelAttribute RegisterVO registerVO, @RequestParam int id) {
		registerVO.setRegisterId(id);
		List editList=this.registerService.editUser(registerVO);
		RegisterVO registerVO2 = (RegisterVO)editList.get(0);
		registerVO2.setStatus(false);
		this.registerService.insertRegister(registerVO2);
		return new ModelAndView("redirect:/admin/viewUser");
	}
	
	
	@RequestMapping(value = "/admin/editUser", method = RequestMethod.GET)
	public ModelAndView Edit(Model model, @ModelAttribute RegisterVO registerVO, @RequestParam int id) {

		registerVO.setRegisterId(id);
		List editList=this.registerService.editUser(registerVO);
		System.out.println("Edite LIST :::::::::::::::::"+editList);
		return new ModelAndView("admin/addUser", "editList", (RegisterVO)editList.get(0));

	}
}


