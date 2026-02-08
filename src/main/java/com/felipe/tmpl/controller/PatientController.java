package com.felipe.tmpl.controller;

import com.felipe.tmpl.dto.PatientDTO;
import com.felipe.tmpl.repository.PatientRepository;
import com.felipe.tmpl.service.PatientService;
import com.felipe.tmpl.service.SessionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pacientes")
public class PatientController {
    private PatientService service;
    private SessionService sessionService;
    public PatientController(PatientService service,
                             SessionService sessionService) {
        this.service = service;
        this.sessionService = sessionService;
    }

    @PostMapping
    public String create(PatientDTO patient, Model model) {
        this.service.save(patient);
        var patients = this.service.getAll();
        model.addAttribute("patients", patients);
        return "fragments/patients-list";
    }

    @GetMapping("/{id}")
    public String viewPatientDetails(@PathVariable Long id, Model model) {
        var patient = service.getPatientById(id);
        var sessions = this.sessionService.getSessionsByPatientId(id);
        model.addAttribute("patient", patient);
        model.addAttribute("sessions", sessions);
        return "pages/patient-details";
    }
}
