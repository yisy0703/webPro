package com.lec.json;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.json.dao.ExDao;
import com.lec.json.vo.Ex;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private ExDao dao;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale) {
		return "home";
	}
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(Ex ex, Model model) {
		model.addAttribute("result", dao.insert(ex));
		return "result";
	}
}
