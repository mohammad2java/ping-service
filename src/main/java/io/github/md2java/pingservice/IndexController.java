package io.github.md2java.pingservice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/")
    public String redirectToActuatorInfo() {
        return "redirect:/actuator/info";
    }
}
