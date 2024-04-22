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
import com.waterwastage.Service.AreaService;
import com.waterwastage.Service.ZoneService;

@Controller
public class AreaController {

	@Autowired
	ZoneService zoneService;
	
	@Autowired
	AreaService areaService;
	
	@RequestMapping(value="/admin/addArea",method=RequestMethod.GET)
	public ModelAndView addArea(Model model)
	{
		List zoneList = this.zoneService.searchZone();
		model.addAttribute("zoneList",zoneList);
		System.out.print("size : "+zoneList.size());
		return new ModelAndView("admin/addArea","areaVO",model);		
	}
	@RequestMapping(value="/admin/insertArea",method=RequestMethod.POST)
	public ModelAndView insertArea(@ModelAttribute AreaVO areaVO)
	{
		areaVO.setStatus(true);
		this.areaService.areaInsert(areaVO);
		return new ModelAndView("redirect:/admin/addArea");
	}
	@RequestMapping(value="/admin/viewArea",method=RequestMethod.GET)
	public ModelAndView searchArea()
	{
	
		List areaList = this.areaService.areaSearch();
		System.out.println(areaList.size());
		return new ModelAndView("admin/viewArea","areaList",areaList);	
	}
	
	@RequestMapping(value = "/admin/deleteArea", method = RequestMethod.GET)
	public ModelAndView DeleteArea(@ModelAttribute AreaVO areaVO, @RequestParam int id) {
		areaVO.setId(id);
		List editList=this.areaService.areaEdit(areaVO);
		AreaVO areaVO2 = (AreaVO)editList.get(0);
		areaVO2.setStatus(false);
		this.areaService.areaInsert(areaVO2);
		return new ModelAndView("redirect:/admin/viewArea");
	}
	
	
	@RequestMapping(value = "/admin/editArea", method = RequestMethod.GET)
	public ModelAndView Edit(Model model, @ModelAttribute AreaVO areaVO, @RequestParam int id) {

		List zoneList = this.zoneService.searchZone();
		model.addAttribute("zoneList", zoneList);
		areaVO.setId(id);
		List editList=this.areaService.areaEdit(areaVO);
		System.out.println("Edite LIST :::::::::::::::::"+editList);
		return new ModelAndView("admin/addArea", "areaVO", (AreaVO)editList.get(0));

	}

	
}
