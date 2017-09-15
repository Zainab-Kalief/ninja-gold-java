package com.wura.ninjaGold.controllers;

import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Home {
	@RequestMapping("/home")
	public String index(HttpSession session) {
		
		if(session.getAttribute("gold") == null) {
			session.setAttribute("gold", 0);
			ArrayList<HashMap> activities = new ArrayList<HashMap>();
			session.setAttribute("activities", activities);
		} 
		session.getAttribute("gold");
		session.getAttribute("activities");
		return "home";
	}
	@RequestMapping(path="/processMoney", method=RequestMethod.POST)
	public String process(@RequestParam(value="action") String result, HttpSession session) {
		Integer count = (Integer) session.getAttribute("gold");
		Integer randomNumber = 0;
		Integer chance = 2;
		Date time = new Date();
		if(result.equals("farm")) {
			randomNumber = ThreadLocalRandom.current().nextInt(10, 20 + 1);
			count += randomNumber;
		} else if (result.equals("cave")) {
			randomNumber = ThreadLocalRandom.current().nextInt(5, 10 + 1);
			count += randomNumber;
		} else if(result.equals("house")) {
			randomNumber = ThreadLocalRandom.current().nextInt(2, 5 + 1);
			count += randomNumber;
		} else if(result.equals("casino")) {
			 chance = ThreadLocalRandom.current().nextInt(1, 3);
			if(chance.equals(1)) {
				randomNumber = ThreadLocalRandom.current().nextInt(1, 50 + 1);
				count -= randomNumber;
			} else {
				randomNumber = ThreadLocalRandom.current().nextInt(1, 50 + 1);
				count += randomNumber;
			}	
		}
		HashMap<String, String> results = new HashMap<>();
		results.put("gold", randomNumber + "");
		results.put("action", result);
		results.put("time",  time + "");
		results.put("chance", chance + "");
		session.setAttribute("gold", count);
		((ArrayList<HashMap>) session.getAttribute("activities")).add(0, results);
		return "redirect:/home";
	}
	@RequestMapping("/reset")
	public String reset(HttpSession session) {
		session.setAttribute("gold", 0);
		ArrayList<HashMap> activities = new ArrayList<HashMap>();
		session.setAttribute("activities", activities);
		return "redirect:/home";
	}
}


