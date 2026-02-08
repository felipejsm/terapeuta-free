package com.felipe.tmpl.repository;

import com.felipe.tmpl.entity.Session;
import org.springframework.data.repository.CrudRepository;
import java.util.List;

public interface SessionRepository extends CrudRepository<Session, Long> {
    List<Session> findByPatientIdOrderByDateTimeDesc(Long patientId);
}