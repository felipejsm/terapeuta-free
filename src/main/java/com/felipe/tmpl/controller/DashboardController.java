package com.felipe.tmpl.controller;
import com.felipe.tmpl.dto.TransactionDTO;
import com.felipe.tmpl.service.TransactionService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {

    private final TransactionService transactionService;

    public DashboardController(TransactionService transactionService) {
        this.transactionService = transactionService;
    }

    /**
     * Rota principal da Dashboard.
     * O Spring Boot + jte identificam automaticamente os arquivos em src/main/jte/pages
     */
    @GetMapping
    public String viewDashboard(Model model) {
        List<TransactionDTO> transactions = transactionService.getRecentTransactions();
        model.addAttribute("transactions", transactions);

        // Retorna o template completo (que usa o @template.root)
        return "pages/dashboard";
    }

    /**
     * Rota de atualização (Refresh).
     * Atendida quando o HTMX faz um hx-get="/dashboard/refresh"
     */
    @GetMapping("/refresh")
    public String refreshTransactions(
            @RequestHeader(value = "HX-Request", required = false) boolean isHtmx,
            Model model) {

        // Simulando a busca de novos dados (ou dados atualizados)
        List<TransactionDTO> transactions = transactionService.getRecentTransactions();
        model.addAttribute("transactions", transactions);

        // IMPORTANTE: Retornamos apenas o fragmento HTML das linhas da tabela.
        // O jte processará apenas o arquivo src/main/jte/fragments/transactions-table.jte
        return "fragments/transactions-table";
    }
}