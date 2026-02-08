package com.felipe.tmpl.service;

import com.felipe.tmpl.dto.SessionDTO;
import com.felipe.tmpl.repository.SessionRepository;
import org.springframework.stereotype.Service;

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
}
