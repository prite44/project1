package com.meproject.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class MainController {
	@RequestMapping(value="/module")
	public String main(){
		return "main";
	}

}
