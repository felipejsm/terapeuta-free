package com.felipe.tmpl.service;

import com.felipe.tmpl.dto.TransactionDTO;
import com.felipe.tmpl.repository.TransactionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TransactionService {

    @Autowired
    public TransactionRepository repository;

    public List<TransactionDTO> getRecentTransactions() {
        var transactions = repository.findAll();
        return transactions.stream()
                .map(t -> new TransactionDTO(
                        t.getId(),
                        t.getCustomerName(),
                        t.getEmail(),
                        t.getAmount(),
                        t.getStatus(),
                        t.getDate()))
                .toList();
//        return List.of(
//                new TransactionDTO("#TXN001", "Alice Johnson", "alice@example.com", "2,450.00", "Completed", "2024-12-27"),
//                new TransactionDTO("#TXN002", "Bob Smith", "bob@example.com", "1,250.00", "Pending", "2024-12-26"),
//                new TransactionDTO("#TXN003", "Charlie Davis", "charlie@example.com", "3,100.00", "Completed", "2024-12-25"),
//                new TransactionDTO("#TXN004", "Diana Martinez", "diana@example.com", "890.00", "Failed", "2024-12-24")
//        );
    }
}