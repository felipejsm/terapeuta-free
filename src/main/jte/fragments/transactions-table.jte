@import java.util.List
@import com.felipe.tmpl.dto.TransactionDTO
@param List<TransactionDTO> transactions

@for(var txn : transactions)
    <tr>
        <td>${txn.id()}</td>
        <td>
            <div class="flex items-center gap-3">
                <div class="avatar">
                    <div class="mask mask-squircle h-10 w-10">
                        <img src="https://avatar.vercel.sh/${txn.customerName()}.png" alt="Avatar" />
                    </div>
                </div>
                <div>
                    <div class="font-bold">${txn.customerName()}</div>
                    <div class="text-sm opacity-50">${txn.email()}</div>
                </div>
            </div>
        </td>
        <td class="font-semibold">$${txn.amount()}</td>
        <td><span class="badge ${txn.statusClass()}">${txn.status()}</span></td>
        <td>${txn.date()}</td>
        <td>
            <button class="btn btn-ghost btn-xs">Details</button>
        </td>
    </tr>
@endfor