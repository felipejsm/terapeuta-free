@import com.felipe.tmpl.dto.PatientDTO
@param PatientDTO patient

<div id="anamnesis-section" x-data="{
    quill: null,
    initQuill() {
        this.quill = new Quill($refs.editor, {
            theme: 'snow',
            modules: {
                toolbar: [
                    ['bold', 'italic', 'underline'],
                    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                    ['clean']
                ]
            }
        });
        // Sincroniza o conteúdo do Quill com o input escondido para o HTMX
        this.quill.on('text-change', () => {
            $refs.observationsInput.value = this.quill.root.innerHTML;
        });
    }
}" x-init="initQuill()">

    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>

    <h3 class="font-bold text-lg mb-4">Anamnese Inicial</h3>

    <form hx-post="/pacientes/${patient.id()}/anamnese"
          hx-target="#anamnesis-section"
          hx-swap="outerHTML"
          class="flex flex-col gap-2">

        <div class="bg-base-100 text-base-content border border-base-300 rounded-lg">
            <div x-ref="editor" style="height: 300px;">
                $unsafe{patient.observations() != null ? patient.observations() : ""}
            </div>
        </div>

        <input type="hidden" name="observations" x-ref="observationsInput" value="${patient.observations()}">

        <div class="flex justify-end items-center gap-4 mt-4">
            <span class="htmx-indicator loading loading-spinner loading-xs text-primary"></span>
            <button type="submit" class="btn btn-sm btn-primary">
                Salvar Anamnese
            </button>
        </div>
    </form>
</div>