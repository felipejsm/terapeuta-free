package com.felipe.tmpl.dto;

public record TransactionDTO(
        String id,
        String customerName,
        String email,
        String amount,
        String status,
        String date
) {
    // Método utilitário para retornar a classe CSS do daisyUI baseada no status
    public String statusClass() {
        return switch (status.toLowerCase()) {
            case "completed" -> "badge-success";
            case "pending" -> "badge-warning";
            case "failed" -> "badge-error";
            default -> "badge-ghost";
        };
    }
}