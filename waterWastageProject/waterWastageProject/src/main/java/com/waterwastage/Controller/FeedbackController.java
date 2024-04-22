package com.waterwastage.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.waterwastage.Model.FeedbackVO;
import com.waterwastage.Model.LoginVO;
import com.waterwastage.Service.FeedbackService;
import com.waterwastage.Service.LoginService;
import com.waterwastage.utils.Basemethods;



@Controller
public class FeedbackController {

	@Autowired
	FeedbackService feedbackService;

	@Autowired
	LoginService loginService;
	
	@RequestMapping(value="/postFeedback",method=RequestMethod.GET)
	public ModelAndView addComplain(Model model)
	{
			return new ModelAndView("user/PostFeedback","feedbackVO",new FeedbackVO());
	}
	
	@RequestMapping(value="/insertFeedback",method=RequestMethod.POST)
	public ModelAndView insertFeedback(@ModelAttribute FeedbackVO feedbackVO)
	{
		feedbackVO.setStatus(true);
		String currentUser = Basemethods.getUser();
		List UserList = this.loginService.searchLoginID(currentUser);
		LoginVO loginVO = (LoginVO)UserList.get(0);
		feedbackVO.setLoginVO(loginVO);
		this.feedbackService.saveFeedback(feedbackVO);
		return new ModelAndView("redirect:/postFeedback");
	}

	@RequestMapping(value="/viewUserFeedback",method=RequestMethod.GET)
	public ModelAndView loadUserFeedback(Model model,@ModelAttribute FeedbackVO feedbackVO)
	{
		String currentUser = Basemethods.getUser();
		List UserList = this.loginService.searchLoginID(currentUser);
		LoginVO loginVO = (LoginVO)UserList.get(0);
		feedbackVO.setLoginVO(loginVO);
		List feedbackList = this.feedbackService.viewUserFeedback(feedbackVO);
		model.addAttribute("feedbackList",feedbackList);
		
		return new ModelAndView("user/ViewUserFeedback");
	}
	
	
}
