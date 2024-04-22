package com.waterwastage.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.waterwastage.Model.WastagePredictionVO;
import com.waterwastage.Service.PredictionService;
import com.waterwastage.Service.WardService;
import com.waterwastage.Service.ZoneService;

@Controller
public class PredictionController {

	@Autowired
	private ZoneService zoneService;
	
	@Autowired
	private WardService wardService;
	
	@Autowired
	private PredictionService predictionService;
	
	@GetMapping(value="/admin/loadPrediction")
	public ModelAndView loadPrediction()
	{
		List zoneList = this.zoneService.searchZone();
		System.out.println("ZoneList size===>>>"+zoneList.size());
		

		List wardList = this.wardService.wardSearch();
		System.out.println("WardList size===>>>"+wardList.size());
		return new ModelAndView("admin/addPrediction","WastagePredictionVO",new WastagePredictionVO()).addObject("zoneList",zoneList).addObject("wardList",wardList);
	}
	
	@GetMapping(value="/user/loadUserPrediction")
	public ModelAndView loadUserPrediction()
	{
		List zoneList = this.zoneService.searchZone();
		System.out.println("ZoneList size===>>>"+zoneList.size());
		
		List wardList = this.wardService.wardSearch();
		System.out.println("WardList size===>>>"+wardList.size());
		return new ModelAndView("user/addPrediction","WastagePredictionVO",new WastagePredictionVO()).addObject("zoneList",zoneList).addObject("wardList",wardList);
	}
}
