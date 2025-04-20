package tn.essat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

    @GetMapping("/Page403")
    public String get403(Model model) {
        return "pageErreur";
    }
}