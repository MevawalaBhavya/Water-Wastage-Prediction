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
import com.waterwastage.Model.WardVO;
import com.waterwastage.Service.AreaService;
import com.waterwastage.Service.WardService;
import com.waterwastage.Service.ZoneService;

@Controller
public class WardController {

	@Autowired
	ZoneService zoneService;
	
	@Autowired
	AreaService areaService;
	
	@Autowired
	WardService wardService;
	
	@RequestMapping(value="/admin/addWard",method=RequestMethod.GET)
	public ModelAndView addAWard(Model model)
	{
		List zoneList = this.zoneService.searchZone();
		model.addAttribute("zoneList",zoneList);
		System.out.print("size : "+zoneList.size());
		model.addAttribute("areaVO",new AreaVO());
		
		List areaList = this.areaService.areaSearch();
		model.addAttribute("areaList", areaList);
		model.addAttribute("WardVO", new WardVO());
	//	return new ModelAndView("AddState");
		return new ModelAndView("admin/addWard","wardVO",new WardVO());		
	}
	@RequestMapping(value="/admin/insertWard",method=RequestMethod.POST)
	public ModelAndView Insert(@ModelAttribute WardVO wardVO)
	{
		
		wardVO.setStatus(true);
		this.wardService.wardInsert(wardVO);
		return new ModelAndView("redirect:/admin/addWard");
	}
	
	@RequestMapping(value="/admin/viewWard",method=RequestMethod.GET)
	public ModelAndView searchWard(Model model)
	{
		List wardList = this.wardService.wardSearch();
		model.addAttribute("wardList",wardList);
		System.out.print("Ward List Size : "+wardList.size());
		return new ModelAndView("admin/viewWard");	
	}
	
	@RequestMapping(value = "/admin/deleteWard", method = RequestMethod.GET)
	public ModelAndView DeleteArea(@ModelAttribute WardVO wardVO, @RequestParam int id) {
		wardVO.setId(id);
		List editList=this.wardService.wardEdit(wardVO);
		WardVO wardVO2 = (WardVO)editList.get(0);
		wardVO2.setStatus(false);
		this.wardService.wardInsert(wardVO2);
		return new ModelAndView("redirect:/admin/viewWard");
	}
	
	@RequestMapping(value = "/admin/editWard", method = RequestMethod.GET)
	public ModelAndView Edit(Model model, @ModelAttribute WardVO wardVO, @RequestParam int id) {

		List zoneList = this.zoneService.searchZone();
		model.addAttribute("zoneList", zoneList);
		List areaList = this.areaService.areaSearch();
		model.addAttribute("areaList", areaList);
		wardVO.setId(id);
		List editList=this.wardService.wardEdit(wardVO);
		System.out.println("Edite LIST :::::::::::::::::"+editList);
		return new ModelAndView("admin/addWard", "wardVO", (WardVO)editList.get(0));

	}
}
