@import java.util.List
@import com.felipe.tmpl.dto.TransactionDTO
@param List<TransactionDTO> transactions
@param String currentUri

@template.root(content = @`
    <div class="p-6 space-y-6">

        <div class="stats stats-vertical lg:stats-horizontal shadow w-full">
            <div class="stat">
                <div class="stat-title">Total Users</div>
                <div class="stat-value text-primary">25.6K</div>
                <div class="stat-desc">↗︎ 400 (22%) this month</div>
            </div>
            <div class="stat">
                <div class="stat-title">Revenue</div>
                <div class="stat-value text-secondary">$89,400</div>
                <div class="stat-desc">↗︎ 12% increase</div>
            </div>
            <div class="stat">
                <div class="stat-title">Active Projects</div>
                <div class="stat-value text-accent">48</div>
                <div class="stat-desc">12 completed this week</div>
            </div>
        </div>

        <div class="card bg-base-200 shadow-xl" x-data="{ loaded: true }">
            <div class="card-body">
                <h2 class="card-title">Activity Overview</h2>
                <div class="h-64 flex items-center justify-center bg-base-300 rounded-lg">
                    <p x-show="loaded" class="text-base-content/50">Chart logic here</p>
                </div>
            </div>
        </div>

        <div class="card bg-base-200 shadow-xl">
            <div class="card-body">
                <div class="flex items-center justify-between mb-4">
                    <h2 class="card-title">Recent Transactions</h2>
                    <button class="btn btn-sm btn-primary"
                            hx-get="/dashboard/refresh"
                            hx-target="#transaction-body">
                        Refresh Table
                    </button>
                </div>
                <div class="overflow-x-auto">
                    <table class="table table-zebra">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Customer</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Date</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody id="transaction-body">
                        @template.fragments.transactions-table(transactions = transactions)
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
`,
currentUri = currentUri)