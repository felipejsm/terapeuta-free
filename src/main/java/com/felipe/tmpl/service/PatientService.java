package com.felipe.tmpl.service;

import com.felipe.tmpl.dto.PatientDTO;
import com.felipe.tmpl.entity.Patient;
import com.felipe.tmpl.repository.PatientRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PatientService {
    private PatientRepository repository;
    private final PatientMapping mapping;
    public PatientService(PatientRepository repository) {
        this.repository = repository;
        this.mapping = new PatientMapping();
    }

    public List<PatientDTO> getAll() {
        return this.repository.findAll().stream()
                .map( p -> new PatientDTO(
                        p.getId(), p.getName(), p.getEmail(),
                        p.getPhone(), p.getCpf(),
                        p.getObservations()))
                .toList();
    }

    public void save(PatientDTO patientDTO) {
        var patient = this.mapping.dtoToEntity(patientDTO);
        this.repository.save(patient);
    }

    public PatientDTO getPatientById(final Long id) {
        var patient = repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Paciente Não Encontrado"));

        return new PatientDTO(
                patient.getId(),
                patient.getName(),
                patient.getEmail(),
                patient.getPhone(),
                patient.getCpf(),
                patient.getObservations()
        );
    }
}
