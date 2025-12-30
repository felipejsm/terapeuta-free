package com.felipe.tmpl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SettingsController {

    @GetMapping("/settings")
    public String viewSettings(Model model) {
        model.addAttribute("username", "Admin");
        model.addAttribute("email", "admin@exemplo.com");
        return "pages/settings";
    }

    @PostMapping("/settings/update")
    public String updateSettings(@RequestParam String username, Model model) {
        // Lógica de salvar no banco...

        // Retornamos um fragmento simples (badge) para o HTMX mostrar o sucesso
        return "fragments/save-success";
    }
}