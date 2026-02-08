INSERT INTO transactions (id, customer_name, email, amount, status, date)
VALUES ('TXN001', 'Felipe', 'felipe@email.com', '500.00', 'Completed', '2025-12-28');

INSERT INTO patients (name, email, phone, cpf, observations)
VALUES ('João Silva', 'joao@email.com', '5511999999999', '123.456.789-00', 'Paciente ansioso, foco em TCC');

INSERT INTO patients (name, email, phone, cpf, observations)
VALUES ('Maria Oliveira', 'maria@email.com', '5511888888888', '987.654.321-11', 'Início do tratamento para burnout');

-- Supondo que o paciente João Silva tenha ID 1
INSERT INTO sessions (patient_id, date_time, notes)
VALUES (1, '2026-01-15 14:00:00', 'Sessão de acolhimento. Paciente demonstrou abertura para falar sobre traumas de infância.');

INSERT INTO sessions (patient_id, date_time, notes)
VALUES (1, '2026-01-22 10:30:00', 'Trabalhamos técnicas de respiração para controle de ansiedade social.');