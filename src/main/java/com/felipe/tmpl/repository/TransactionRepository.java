package com.felipe.tmpl.repository;

import com.felipe.tmpl.entity.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TransactionRepository extends JpaRepository<Transaction, String> {
}
