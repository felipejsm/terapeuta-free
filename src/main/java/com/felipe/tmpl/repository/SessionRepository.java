package com.felipe.tmpl.repository;

import com.felipe.tmpl.entity.Session;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface SessionRepository extends JpaRepository<Session, Long> {
    List<Session> findByPatientIdOrderByDateTimeDesc(Long patientId);
}