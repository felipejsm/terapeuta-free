@import com.felipe.tmpl.dto.PatientDTO
@import com.felipe.tmpl.dto.SessionDTO
@import java.util.List
@param PatientDTO patient
@param List<SessionDTO> sessions
@param String currentUri

@template.root(
currentUri = currentUri,
content = @`
    <div class="p-6">
        <div class="flex justify-between items-start mb-6">
            <div>
                <div class="text-sm breadcrumbs mb-2">
                    <ul>
                        <li><a href="/">Dashboard</a></li>
                        <li>Ficha do Paciente</li>
                    </ul>
                </div>
                <h1 class="text-3xl font-bold">${patient.name()}</h1>
                <p class="text-base-content/60">ID: #${patient.id()}</p>
            </div>

            <div class="flex gap-2">
                <a href="https://api.whatsapp.com/send?phone=55${patient.phone().replaceAll("\\D", "")}"
                   target="_blank" class="btn btn-success text-white">
                    WhatsApp
                </a>
                <a href="https://meet.jit.si/ClinicaFelipe_${patient.id()}"
                   target="_blank" class="btn btn-primary">
                    Iniciar Vídeo
                </a>
            </div>
        </div>

        <div role="tablist" class="tabs tabs-lifted">

            <input type="radio" name="my_tabs" role="tab" class="tab" aria-label="Resumo" checked />
            <div role="tabpanel" class="tab-content bg-base-100 border-base-300 rounded-box p-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                    <div>
                        <h3 class="font-bold mb-4 text-lg">Dados Pessoais</h3>
                        <div class="space-y-3">
                            <p><span class="opacity-60 font-semibold">E-mail:</span> ${patient.email()}</p>
                            <p><span class="opacity-60 font-semibold">Telefone:</span> ${patient.phone()}</p>
                            <p><span class="opacity-60 font-semibold">CPF:</span> ${patient.cpf()}</p>
                        </div>
                    </div>

                    <div id="anamnesis-section">
                        @template.fragments.anamnesis-content(patient = patient)
                    </div>
                </div>
            </div>
            <input type="radio" name="my_tabs" role="tab" class="tab" aria-label="Arquivos" />
            <div role="tabpanel" class="tab-content bg-base-100 border-base-300 rounded-box p-6">
                <h3 class="font-bold mb-4">Documentos e Exames</h3>
                <div class="flex flex-col items-center justify-center border-2 border-dashed border-base-300 p-10 rounded-lg">
                    <p class="mb-4 opacity-60">Arraste arquivos aqui ou clique para upload</p>
                    <input type="file" class="file-input file-input-bordered w-full max-w-xs" />
                </div>
            </div>
            <input type="radio" name="my_tabs" role="tab" class="tab" aria-label="Evolução" />
            <div role="tabpanel" class="tab-content bg-base-100 border-base-300 rounded-box p-6">

                <div class="collapse collapse-plus bg-base-200 mb-6">
                    <input type="checkbox" />
                    <div class="collapse-title text-sm font-medium">
                        + Nova Anotação de Sessão
                    </div>
                    <div class="collapse-content">
                        <form hx-post="/pacientes/${patient.id()}/sessoes"
                              hx-target="#timeline-container"
                              hx-on::after-request="this.reset()">
                            <div class="form-control">
                                <textarea name="notes" required class="textarea textarea-bordered h-24" placeholder="O que aconteceu hoje?"></textarea>
                            </div>
                            <div class="flex justify-end mt-2">
                                <button type="submit" class="btn btn-primary btn-sm">Salvar na Timeline</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div id="timeline-container">
                    @template.fragments.sessions-timeline(sessions = sessions)
                </div>
            </div>
        </div>
    </div>
`
)