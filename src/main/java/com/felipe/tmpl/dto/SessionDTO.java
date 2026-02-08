package com.felipe.tmpl.dto;

public record SessionDTO(
        Long id,
        String formattedDate,
        String notes
) {}