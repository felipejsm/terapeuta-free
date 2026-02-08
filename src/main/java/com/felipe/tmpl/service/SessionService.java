package com.felipe.tmpl.service;

import com.felipe.tmpl.dto.PatientDTO;
import com.felipe.tmpl.dto.SessionDTO;
import com.felipe.tmpl.entity.Patient;
import com.felipe.tmpl.entity.Session;
import com.felipe.tmpl.repository.SessionRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class SessionService {
    private SessionRepository repository;

    public SessionService(final SessionRepository repository) {
        this.repository = repository;
    }

    public List<SessionDTO> getSessionsByPatientId(final Long patientId) {
        return repository.findByPatientIdOrderByDateTimeDesc(patientId)
                .stream()
                .map(s -> new SessionDTO(
                        s.getId(),
                        s.getDateTime().format(DateTimeFormatter.ofPattern("dd/MM/yyyy")),
                        s.getNotes()
                )).toList();
    }

    public void saveSession(final PatientDTO patient, final String notes) {
        // Salva a nova sessão
        Session session = new Session();
        session.setPatient(fromPatientDtoToPatientEntity(patient));
        session.setDateTime(LocalDateTime.now());
        session.setNotes(notes);
        repository.save(session);
    }

    private Patient fromPatientDtoToPatientEntity(PatientDTO patientDTO) {
        return new Patient(
                patientDTO.id(),
                patientDTO.name(),
                patientDTO.email(),
                patientDTO.phone(),
                patientDTO.cpf(),
                patientDTO.observations()
        );
    }
}
