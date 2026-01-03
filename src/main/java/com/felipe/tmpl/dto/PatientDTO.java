package com.felipe.tmpl.dto;

public record PatientDTO(
        Long id,
        String name,
        String email,
        String phone,
        String cpf
) {
}
