package com.waterwastage.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.waterwastage.Model.AreaVO;
import com.waterwastage.Model.LoginVO;
import com.waterwastage.Model.WardVO;
import com.waterwastage.Model.WastagePredictionVO;
import com.waterwastage.Model.ZoneVO;
import com.waterwastage.Service.ComplainService;
import com.waterwastage.Service.FeedbackService;
import com.waterwastage.Service.LoginService;
import com.waterwastage.Service.PredictionService;
import com.waterwastage.Service.WardService;
import com.waterwastage.Service.ZoneService;

@Controller
public class LoginController {

	@Autowired
	LoginService loginService;

	@Autowired
	FeedbackService feedbackService;

	@Autowired
	ComplainService complainService;

	@Autowired
	PredictionService predictionService;
	
	@Autowired
	ZoneService zoneService;
	
	@Autowired
	WardService wardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView loadLogin() {

		return new ModelAndView("login");
	}

	@RequestMapping(value = "/admin/index", method = RequestMethod.GET)
	public ModelAndView adminIndex(LoginVO loginVO) {

		List totalComplainCountList = complainService.getTotalComplainCount();
		List pendingComplainCountList = complainService.getPendingComplainCount();
		List feedbackCountList = feedbackService.getFeedbackCount();
		List userCountList = loginService.getUserCount();
		List plotGraph = predictionService.plotGraph();
		List plotUsageGraph = predictionService.plotUsageGraph(); 
		List usageGraph = predictionService.usageGraph(); 
		List wastageGraph = predictionService.wastageGraph();
		return new ModelAndView("admin/index").addObject("feedbackCountList", feedbackCountList.get(0))
				.addObject("totalComplainCountList", totalComplainCountList.get(0))
				.addObject("pendingComplainCountList", pendingComplainCountList.get(0))
				.addObject("userCountList", userCountList.get(0)).addObject("plotGraph", plotGraph)
				.addObject("usageGraph", usageGraph).addObject("plotUsageGraph", plotUsageGraph)
				.addObject("wastageGraph", wastageGraph);
	}
 
	@RequestMapping(value = "/user/index", method = RequestMethod.GET)
	public ModelAndView userIndex(Model model) {

		List zoneList = this.zoneService.searchZone();
		model.addAttribute("zoneList",zoneList);
		
		List wardList = this.wardService.wardSearch();
		model.addAttribute("wardList",wardList); 

		return new ModelAndView("user/index");
	}

	@RequestMapping(value = "/logout", method = { RequestMethod.POST, RequestMethod.GET })
	public String viewUserDetails(ModelMap model, HttpServletResponse response, HttpServletRequest request) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
			request.getSession().invalidate();
			request.getSession().setAttribute("tempStatus", "success");
			request.getSession().setAttribute("statusText", "Logout Successfully!");
		}
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView load() {

		return new ModelAndView("login");
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView load403() {

		return new ModelAndView("login");
	}

	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public ModelAndView error() {

		return new ModelAndView("login");
	}
	
	@RequestMapping(value="user/seachByWardZOne",method=RequestMethod.POST)
	public ModelAndView seachByWardZOne(@RequestParam int zoneId,@RequestParam int wardId,
			@ModelAttribute ZoneVO zoneVO,@ModelAttribute WardVO wardVO,@ModelAttribute WastagePredictionVO wastagePredictionVO,Model model)
	{
		System.out.println("zoneId:: "+zoneId);
		System.out.println("wardId:: "+wardId);
		
		 wardVO.setId(wardId);
		 zoneVO.setId(zoneId); 
		 
		 wastagePredictionVO.setWardVO(wardVO);
		 wastagePredictionVO.setZoneVO(zoneVO); 
		List dataByWardZOne=this.predictionService.seachByWardZOne(wastagePredictionVO);
		System.out.println("dataByWardZOne::"+dataByWardZOne.size());
		model.addAttribute("dataByWardZOneWastage",dataByWardZOne); 
		
		List seachByWardZOneUsage=this.predictionService.seachByWardZOneUsage(wastagePredictionVO);
		System.out.println("seachByWardZOneUsage::"+seachByWardZOneUsage.size());
		model.addAttribute("seachByWardZOneUsage",seachByWardZOneUsage);
		
		List zoneList = this.zoneService.searchZone();
		model.addAttribute("zoneList",zoneList);
		
		List wardList = this.wardService.wardSearch();  
		model.addAttribute("wardList",wardList); 
		
		return new ModelAndView("user/index");
	}

}
