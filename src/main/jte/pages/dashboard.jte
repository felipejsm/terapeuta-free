@import java.util.List
@import com.felipe.tmpl.dto.PatientDTO
@param List<PatientDTO> patients
@param String currentUri

@template.root(
currentUri = currentUri,
content = @`
    <div class="p-6">
        <div class="mb-8">
            <h1 class="text-2xl font-bold">Painel do Terapeuta</h1>
            <p class="text-base-content/60">Bem-vindo de volta! Aqui está o resumo do seu dia.</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-10">
            <div class="card bg-primary text-primary-content shadow-xl hover:scale-105 transition-all cursor-pointer">
                <label for="modal-paciente" class="card bg-primary text-primary-content shadow-xl hover:scale-105 transition-all cursor-pointer">
                    <div class="card-body items-center text-center p-6">
                        <span class="text-3xl">👤</span>
                        <h2 class="card-title text-sm">Novo Paciente</h2>
                    </div>
                </label>
            </div>

            <div class="card bg-base-100 shadow-xl border-l-4 border-secondary">
                <div class="card-body p-4">
                    <div class="flex justify-between items-center">
                        <h2 class="font-bold">Próxima Sessão</h2>
                        <div class="badge badge-secondary text-xs">Em 20m</div>
                    </div>
                    <p class="text-sm">João Silva</p>
                    <div class="card-actions justify-end mt-2">
                        <button class="btn btn-xs btn-outline">Abrir Sala</button>
                    </div>
                </div>
            </div>

            <div class="card bg-base-100 shadow-xl border-l-4 border-accent">
                <div class="card-body p-4">
                    <h2 class="font-bold">Anamneses Pendentes</h2>
                    <p class="text-2xl font-bold text-accent">3</p>
                    <p class="text-xs text-base-content/50">Finalize hoje</p>
                </div>
            </div>
        </div>

        <div class="bg-base-100 shadow-xl rounded-box p-4">
            <div class="flex justify-between items-center mb-4">
                <h2 class="text-lg font-bold">Pacientes Recentes</h2>
                <input type="text" placeholder="Pesquisar..." class="input input-bordered input-sm w-full max-w-xs" />
            </div>

            <div class="overflow-x-auto">
                <table class="table table-zebra">
                    <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Contato</th>
                        <th>CPF</th>
                        <th>Ações</th>
                    </tr>
                    </thead>
                    <tbody id="tbody-pacientes">
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
                                    <a href="/pacientes/${patient.id()}" hx-boost="false" class="btn btn-ghost btn-xs">Ver Ficha</a>
                                </div>
                            </td>
                        </tr>
                    @endfor
                    @if(patients.isEmpty())
                        <tr>
                            <td colspan="4" class="text-center py-4 opacity-50">Nenhum paciente cadastrado.</td>
                        </tr>
                    @endif
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <input type="checkbox" id="modal-paciente" class="modal-toggle" />
    <div class="modal" role="dialog">
        <div class="modal-box">
            <h3 class="font-bold text-lg mb-4">Cadastrar Novo Paciente</h3>

            <form hx-post="/pacientes"
                  hx-target="#tbody-pacientes"
                  hx-swap="innerHTML"
                  hx-on::after-request="document.getElementById('modal-paciente').checked = false; this.reset();">

                <div class="form-control w-full">
                    <label class="label"><span class="label-text">Nome Completo</span></label>
                    <input type="text" name="name" required class="input input-bordered w-full" />
                </div>

                <div class="flex gap-4">
                    <div class="form-control w-1/2">
                        <label class="label"><span class="label-text">E-mail</span></label>
                        <input
                                type="email"
                                name="email"
                                required
                                class="input input-bordered w-full"
                                placeholder="exemplo@email.com"
                                x-on:input="$el.value = $el.value.toLowerCase().trim().replace(/\s/g, '')"
                        />
                    </div>
                    <div class="form-control w-1/2" x-data="{
                            mask(value) {
                                if (!value) return '';
                                value = value.replace(/\D/g, '');
                                if (value.length <= 10) {
                                    return value.replace(/(\d{2})(\d{4})(\d{0,4})/, '($1) $2-$3');
                                } else {
                                    return value.replace(/(\d{2})(\d{5})(\d{0,4})/, '($1) $2-$3');
                                }
                            }
                        }">
                        <label class="label"><span class="label-text">Telefone</span></label>
                        <input
                                type="text"
                                name="phone"
                                required
                                class="input input-bordered w-full"
                                placeholder="(11) 98333-2222"
                                maxlength="15"
                                x-on:input="$el.value = mask($el.value)"
                        />
                    </div>
                </div>

                <div class="form-control w-full" x-data="{
                    maskCpf(value) {
                        return value
                            .replace(/[^a-zA-Z0-9]/g, '') // Remove o que não é alfanumérico
                            .toUpperCase()               // O padrão de letras é maiúsculo
                            .replace(/^([a-zA-Z0-9]{3})([a-zA-Z0-9]{3})([a-zA-Z0-9]{3})([a-zA-Z0-9]{2})$/, '$1.$2.$3-$4') // Aplica a máscara completa
                            .replace(/^([a-zA-Z0-9]{3})([a-zA-Z0-9])/, '$1.$2')
                            .replace(/^([a-zA-Z0-9]{3})\.([a-zA-Z0-9]{3})([a-zA-Z0-9])/, '$1.$2.$3')
                            .replace(/^([a-zA-Z0-9]{3})\.([a-zA-Z0-9]{3})\.([a-zA-Z0-9]{3})([a-zA-Z0-9])/, '$1.$2.$3-$4');
                    }
                }">
                    <label class="label"><span class="label-text">CPF (Alfanumérico)</span></label>
                    <input
                            type="text"
                            name="cpf"
                            class="input input-bordered w-full"
                            placeholder="12A.34B.56C-D7"
                            maxlength="14"
                            x-on:input="$el.value = maskCpf($el.value)"
                    />
                </div>

                <div class="modal-action">
                    <label for="modal-paciente" class="btn">Cancelar</label>
                    <button type="submit" class="btn btn-primary">Salvar Paciente</button>
                </div>
            </form>
        </div>
    </div>
`
)