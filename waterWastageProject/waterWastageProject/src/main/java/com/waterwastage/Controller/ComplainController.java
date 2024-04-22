package com.waterwastage.Controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.waterwastage.Model.AreaVO;
import com.waterwastage.Model.ComplaintVO;
import com.waterwastage.Model.LoginVO;
import com.waterwastage.Service.ComplainService;
import com.waterwastage.Service.LoginService;
import com.waterwastage.utils.Basemethods;

@Controller
public class ComplainController {

	@Autowired
	ComplainService complainService;
	
	@Autowired
	LoginService loginService;
	
	
	@RequestMapping(value="/addComplain",method=RequestMethod.GET)
	public ModelAndView addComplain(Model model)
	{
			return new ModelAndView("user/addComplaint","complaintVO",new ComplaintVO());
	}
	
	@RequestMapping(value="/insertComplain",method=RequestMethod.POST)
	public ModelAndView insertComplain(@ModelAttribute ComplaintVO complaintVO,@RequestParam MultipartFile file,HttpSession session)
	{
		
		String path = session.getServletContext().getRealPath("/");
		String finalPath = path+"document/complain/";

		String fileName = file.getOriginalFilename();
		
		try {
			byte[] b = file.getBytes();
			
			BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(finalPath+fileName));
			
			bufferedOutputStream.write(b);
			bufferedOutputStream.flush();
			bufferedOutputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		complaintVO.setFileName(fileName);
		complaintVO.setFilePath(finalPath); 
		
		complaintVO.setStatus(true);
		complaintVO.setComplainStatus("pending");
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");  
		String strDate= formatter.format(date);  
		System.out.println("formated date : "+strDate);
		complaintVO.setComplainDate(strDate);
		
		String currentUer = Basemethods.getUser();
		System.out.println("current user : "+currentUer);
		
		List UserList = this.loginService.searchLoginID(currentUer);
		System.out.print("User : "+UserList);
		
		LoginVO loginVO = (LoginVO)UserList.get(0);
		System.out.println("loginVO :"+loginVO);
		complaintVO.setLoginVO(loginVO);

		this.complainService.complainInsert(complaintVO);
		return new ModelAndView("redirect:/addComplain");
	}
	
	@RequestMapping(value="/searchAdminComplain",method=RequestMethod.GET)
	public ModelAndView loadComplain(Model model)
	{
		List complainList=this.complainService.adminComplainSearch();
		model.addAttribute("complainList",complainList);
		
		return new ModelAndView("admin/adminViewComplain");
	}
	
	@RequestMapping(value="/giveReply",method=RequestMethod.GET)
	public ModelAndView fetchComplain(Model model,@ModelAttribute ComplaintVO complaintVO,@RequestParam int id)
	{
		complaintVO.setId(id);
		List fetchcomplain=this.complainService.fetchComplain(complaintVO);
		return new ModelAndView("admin/AddReply","complaintVO",fetchcomplain.get(0));
	}
	
	
	@RequestMapping(value="/saveReply",method=RequestMethod.POST)
	public ModelAndView saveReply(Model model,@ModelAttribute ComplaintVO complaintVO)
	{
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");  
		String strDate= formatter.format(date);  
		System.out.println("formated date : "+strDate);
		complaintVO.setComplainStatus("Resolved");
		complaintVO.setReplyDate(strDate);
		this.complainService.complainInsert(complaintVO);
		return new ModelAndView("redirect:/searchAdminComplain");
	}
	
	@RequestMapping(value="/searchUserComplain",method=RequestMethod.GET)
	public ModelAndView loadUserComplain(Model model,@ModelAttribute ComplaintVO complaintVO)
	{
		String currentUser = Basemethods.getUser();
		List UserComplain = this.loginService.searchLoginID(currentUser);
		LoginVO loginVO = (LoginVO)UserComplain.get(0);
		complaintVO.setLoginVO(loginVO);
		List complainList=this.complainService.userComplainSearch(complaintVO);
		model.addAttribute("complainList",complainList);
		
		return new ModelAndView("user/ViewUserComplain");
	}
}
