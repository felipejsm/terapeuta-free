@import java.util.List
@import com.felipe.tmpl.dto.PatientDTO
@param List<PatientDTO> patients

@for(var patient : patients)
    <tr>
        <td class="font-medium">${patient.name()}</td>
        <td class="text-sm">
            <div class="flex flex-col">
                <span>${patient.phone()}</span>
                <span class="text-xs opacity-50">${patient.email()}</span>
            </div>
        </td>
        <td>${patient.cpf()}</td>
        <td>
            <div class="flex gap-2">
                <a href="https://api.whatsapp.com/send?phone=${patient.phone()}" target="_blank" class="btn btn-ghost btn-xs text-success">WPP</a>
                <button class="btn btn-ghost btn-xs">Ver Ficha</button>
            </div>
        </td>
    </tr>
@endfor