package com.felipe.tmpl.controller;

import com.felipe.tmpl.dto.PatientDTO;
import com.felipe.tmpl.repository.PatientRepository;
import com.felipe.tmpl.service.PatientService;
import com.felipe.tmpl.service.SessionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/{id}/sessoes")
    public String addSession(@PathVariable Long id, @RequestParam String notes, Model model) {
        var patient = this.service.getPatientById(id);
        this.sessionService.saveSession(patient, notes);
        var sessions = this.sessionService.getSessionsByPatientId(id);
        model.addAttribute("sessions", sessions);
        return "fragments/sessions-timeline";
    }

}
