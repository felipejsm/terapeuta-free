package com.felipe.tmpl.service;

import com.felipe.tmpl.dto.PatientDTO;
import com.felipe.tmpl.entity.Patient;

public class PatientMapping {
    public Patient dtoToEntity(PatientDTO patientDTO) {
        Patient patient = new Patient();
        patient.setCpf(patientDTO.cpf());
        patient.setEmail(patientDTO.email());
        patient.setName(patientDTO.name());
        patient.setPhone(patientDTO.phone());
        patient.setObservations(patientDTO.observations());
        return patient;
    }
    public PatientDTO entityToDto(Patient patient) {
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
