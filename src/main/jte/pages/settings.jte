@param String username
@param String email
@param String currentUri

@template.root(content = @`
    <div class="p-6 max-w-4xl mx-auto">
        <h1 class="text-2xl font-bold mb-6">Configurações de Perfil</h1>

        <div class="card bg-base-200 shadow-xl">
            <div class="card-body">
                <form hx-post="/settings/update" hx-target="#save-result" class="space-y-4">

                    <div class="form-control w-full">
                        <label class="label"><span class="label-text">Nome de Usuário</span></label>
                        <input type="text" name="username" value="${username}" class="input input-bordered w-full" />
                    </div>

                    <div class="form-control w-full">
                        <label class="label"><span class="label-text">E-mail</span></label>
                        <input type="email" name="email" value="${email}" class="input input-bordered w-full" />
                    </div>

                    <div x-data="{ showNotifications: true }" class="py-4 border-t border-base-300">
                        <div class="flex items-center justify-between">
                            <span class="font-medium">Ativar Notificações</span>
                            <input type="checkbox" class="toggle toggle-primary" x-model="showNotifications" />
                        </div>
                        <p x-show="showNotifications" x-transition class="text-sm text-base-content/60 mt-2">
                            Você receberá alertas de novas transações por e-mail.
                        </p>
                    </div>

                    <div class="card-actions justify-end mt-6">
                        <div id="save-result"></div> <button type="submit" class="btn btn-primary">Salvar Alterações</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
`,
currentUri = currentUri)