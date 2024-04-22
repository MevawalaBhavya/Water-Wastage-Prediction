package com.waterwastage.Controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
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
import com.waterwastage.Model.WardVO;
import com.waterwastage.Model.WaterDataVO;
import com.waterwastage.Service.AreaService;
import com.waterwastage.Service.WardService;
import com.waterwastage.Service.WaterDataService;
import com.waterwastage.Service.ZoneService;
import com.waterwastage.utils.Basemethods;

@Controller
public class WaterDataController {

	@Autowired
	ZoneService zoneService;
	
	@Autowired
	AreaService areaService;
	
	@Autowired
	WardService wardService;
	
	@Autowired
	WaterDataService waterDataService;
	
	@RequestMapping(value="/admin/addWaterData",method=RequestMethod.GET)
	public ModelAndView addWaterData(Model model)
	{
		List zoneList = this.zoneService.searchZone();
		model.addAttribute("zoneList",zoneList);
		System.out.print("size : "+zoneList.size());
		model.addAttribute("areaVO",new AreaVO());
		
		List areaList = this.areaService.areaSearch();
		model.addAttribute("areaList", areaList);
		model.addAttribute("WardVO", new WardVO());
		
		List wardList = this.wardService.wardSearch();
		model.addAttribute("wardList", wardList);
		model.addAttribute("WaterDataVO", new WaterDataVO());
		
		return new ModelAndView("/admin/addWaterData","WaterDataVO", new WaterDataVO());		
	}
	
	@RequestMapping(value="/admin/insertWaterData",method=RequestMethod.POST)
	public ModelAndView InsertWaterData(@ModelAttribute WaterDataVO waterDataVO,@RequestParam MultipartFile file,HttpSession session)
	{
		
		String path = session.getServletContext().getRealPath("/");
		String finalPath = path+"document//waterdata//";

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
		
		String url = Basemethods.uploadIntoS3(fileName, finalPath);
		System.out.println("s3 url link==="+url);
		waterDataVO.setFileName(fileName);
		waterDataVO.setFilePath(url);
		waterDataVO.setStatus(true);
		this.waterDataService.waterDataInsert(waterDataVO);
		return new ModelAndView("redirect:/admin/addWaterData");
	}
	
	@RequestMapping(value="/admin/viewWaterData",method=RequestMethod.GET)
	public ModelAndView searchWaterData(Model model)
	{
		List waterdataList = this.waterDataService.waterDataSearch();
		System.out.print("WaterData List Size : "+waterdataList.size());
		return new ModelAndView("admin/viewWaterData").addObject("waterList",waterdataList);	
	}
	
	
}
