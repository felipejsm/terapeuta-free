package com.felipe.tmpl.repository;

import com.felipe.tmpl.entity.Patient;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PatientRepository extends JpaRepository<Patient, Long> {
}
