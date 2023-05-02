package com.google.pronect.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.pronect.service.ScheduleService;
import com.google.pronect.vo.Schedule;

@Controller
@RequestMapping(value="group/schedule")
public class ScheduleController {
	private static final Logger log = LoggerFactory.getLogger(ScheduleController.class);
	@Autowired
	private ScheduleService scheduleService;

	@GetMapping("list")
	@ResponseBody
	public List<Map<String, Object>> totalSchedule(int gid) throws Exception {
		List<Schedule> list = scheduleService.totalSchedule(gid);
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<String, Object>();
		for(int i=0; i < list.size(); i++) {			
			hash.put("title", list.get(i).getScd_title());
			hash.put("cal_memo", list.get(i).getScd_memo()); 
			hash.put("groupId", list.get(i).getGid());
			hash.put("id", list.get(i).getScd_id());
			hash.put("start", list.get(i).getScd_start());
			hash.put("end", list.get(i).getScd_end()); 
			hash.put("allDay", "true");
			jsonObj = new JSONObject(hash); 
			jsonArr.add(jsonObj); 
		}
		//log.info("jsonArrCheck: {}", jsonArr);
		return jsonArr;
	}
	@RequestMapping(value="myGroupSchedule", method=RequestMethod.GET)
	public String myGroup(int gid, Model model) {
		model.addAttribute("gid", gid);
		return "group/schedule/groupCalendar";
	}
	@RequestMapping(value="detail", method=RequestMethod.GET)
	public String detailSchedule(int scd_id) {
		return "";
	}
	@RequestMapping(value="gantt", method=RequestMethod.GET)
	public String gantt() {
		return "group/ganttChart/gantt";
	}
}
