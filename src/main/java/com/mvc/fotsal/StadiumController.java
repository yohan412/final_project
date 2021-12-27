package com.mvc.fotsal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StadiumController {
    private static final Logger logger = LoggerFactory.getLogger(StadiumController.class);

    @RequestMapping("/stadiumlist.do")
    public String StadiumList(){
        logger.info("Move to Stadium List Page");

        return "stadiumlist";
    }
}
