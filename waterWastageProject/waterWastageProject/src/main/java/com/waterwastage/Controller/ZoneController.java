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
import com.waterwastage.Model.ZoneVO;
import com.waterwastage.Service.ZoneService;

@Controller
public class ZoneController {

	@Autowired
	ZoneService  zoneService;
	

	@RequestMapping(value="/admin/addZone",method=RequestMethod.GET)
	public ModelAndView addZone()
	{
		return new ModelAndView("admin/addZone","zoneVO",new ZoneVO());		
	}
	@RequestMapping(value="/admin/insertZone",method=RequestMethod.POST)
	public ModelAndView insertZone(@ModelAttribute ZoneVO zoneVO)
	{
		zoneVO.setStatus(true);
		this.zoneService.insertZone(zoneVO);
		return new ModelAndView("redirect:/admin/addZone");
	}
	@RequestMapping(value="/admin/viewZone",method=RequestMethod.GET)
	public ModelAndView searchZone(Model model)
	{
		List zoneList = this.zoneService.searchZone();
		model.addAttribute("zoneList",zoneList);
		return new ModelAndView("admin/viewZone","zone",model);	
	}
	
	@RequestMapping(value = "/admin/deleteZone", method = RequestMethod.GET)
	public ModelAndView DeleteArea(@ModelAttribute ZoneVO zoneVO, @RequestParam int id) {
		zoneVO.setId(id);
		List editList=this.zoneService.editZone(zoneVO);
		ZoneVO zoneVO2 = (ZoneVO)editList.get(0);
		zoneVO2.setStatus(false);
		this.zoneService.insertZone(zoneVO2);
		return new ModelAndView("redirect:/admin/viewZone");
	}
	
	@RequestMapping(value = "/admin/editZone", method = RequestMethod.GET)
	public ModelAndView Edit(Model model, @ModelAttribute ZoneVO zoneVO, @RequestParam int id) {

		zoneVO.setId(id);
		List editList=this.zoneService.editZone(zoneVO);
		return new ModelAndView("admin/addZone", "zoneVO", (ZoneVO)editList.get(0));

	}
}
