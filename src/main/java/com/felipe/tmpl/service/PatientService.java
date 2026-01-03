package com.felipe.tmpl.service;

import com.felipe.tmpl.dto.PatientDTO;
import com.felipe.tmpl.entity.Patient;
import com.felipe.tmpl.repository.PatientRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatientService {
    private PatientRepository repository;

    public PatientService(PatientRepository repository) {
        this.repository = repository;
    }

    public List<PatientDTO> getAll() {
        return this.repository.findAll().stream()
                .map( p -> new PatientDTO(
                        p.
                )).toList();
    }

}
