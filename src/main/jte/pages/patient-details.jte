@import com.felipe.tmpl.dto.PatientDTO
@param PatientDTO patient
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
                        <h3 class="font-bold mb-4">Dados Pessoais</h3>
                        <div class="space-y-2">
                            <p><span class="opacity-60">E-mail:</span> ${patient.email()}</p>
                            <p><span class="opacity-60">Telefone:</span> ${patient.phone()}</p>
                            <p><span class="opacity-60">CPF:</span> ${patient.cpf()}</p>
                        </div>
                    </div>
                    <div>
                        <h3 class="font-bold mb-4">Anamnese Inicial</h3>
                        <textarea class="textarea textarea-bordered w-full h-32"
                                  placeholder="Descreva as queixas principais e histórico..."></textarea>
                        <button class="btn btn-sm btn-primary mt-2">Salvar Anotação</button>
                    </div>
                </div>
            </div>

            <input type="radio" name="my_tabs" role="tab" class="tab" aria-label="Evolução" />
            <div role="tabpanel" class="tab-content bg-base-100 border-base-300 rounded-box p-6">
                <h3 class="font-bold mb-6">Histórico de Sessões</h3>
                <ul class="timeline timeline-vertical">
                    <li>
                        <div class="timeline-start">10/01/2026</div>
                        <div class="timeline-middle">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-5 h-5 text-primary"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.857-9.809a.75.75 0 00-1.214-.882l-3.483 4.79-1.88-1.88a.75.75 0 10-1.06 1.061l2.5 2.5a.75.75 0 001.137-.089l4-5.5z" clip-rule="evenodd" /></svg>
                        </div>
                        <div class="timeline-end timeline-box">Sessão inicial: Paciente relata melhora no sono.</div>
                        <hr class="bg-primary"/>
                    </li>
                    <li>
                        <hr/>
                        <div class="timeline-start">Hoje</div>
                        <div class="timeline-middle">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-5 h-5"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm.75-11.25a.75.75 0 00-1.5 0v2.5h-2.5a.75.75 0 000 1.5h2.5v2.5a.75.75 0 001.5 0v-2.5h2.5a.75.75 0 000-1.5h-2.5v-2.5z" clip-rule="evenodd" /></svg>
                        </div>
                        <div class="timeline-end timeline-box italic opacity-50">Próxima sessão pendente...</div>
                    </li>
                </ul>
            </div>

            <input type="radio" name="my_tabs" role="tab" class="tab" aria-label="Arquivos" />
            <div role="tabpanel" class="tab-content bg-base-100 border-base-300 rounded-box p-6">
                <h3 class="font-bold mb-4">Documentos e Exames</h3>
                <div class="flex flex-col items-center justify-center border-2 border-dashed border-base-300 p-10 rounded-lg">
                    <p class="mb-4 opacity-60">Arraste arquivos aqui ou clique para upload</p>
                    <input type="file" class="file-input file-input-bordered w-full max-w-xs" />
                </div>
            </div>
        </div>
    </div>
`
)