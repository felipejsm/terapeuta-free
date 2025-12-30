@import gg.jte.Content
@param Content content
@param String currentUri

<!DOCTYPE html>
<html lang="en" data-theme="light">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modern Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.14/dist/full.min.css" rel="stylesheet" type="text/css" />
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://unpkg.com/htmx.org@1.9.10"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
</head>
<body>
<div class="drawer lg:drawer-open">
    <input id="main-drawer" type="checkbox" class="drawer-toggle" />

    <div class="drawer-content flex flex-col">

        <div class="navbar bg-base-200 shadow-md sticky top-0 z-10">
            <div class="flex-none lg:hidden">
                <label for="main-drawer" class="btn btn-square btn-ghost">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="h-6 w-6 stroke-current"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path></svg>
                </label>
            </div>
            <div class="flex-1 px-2 mx-2 font-bold text-xl text-primary">ModernDash</div>
            <div class="flex-none gap-2">
                <input type="checkbox" value="dark" class="toggle theme-controller" />
            </div>
        </div>

        <main class="flex-grow p-4 md:p-6">
            ${content}
        </main>

    </div>

    <div class="drawer-side z-20">
        <label for="main-drawer" class="drawer-overlay"></label>
        <aside class="bg-base-200 w-80 min-h-full flex flex-col border-r border-base-300">
            <div class="p-4 font-bold text-2xl text-primary border-b border-base-300">
                Dashboard
            </div>
            <ul class="menu p-4 w-full text-base-content gap-2 flex-grow" hx-boost="true">
                <li>
                    <a href="/dashboard" class="${"/dashboard".equals(currentUri) ? "active" : ""}">
                        Dashboard
                    </a>
                </li>
                <li>
                    <a href="/settings" class="${"/settings".equals(currentUri) ? "active" : ""}">
                        Settings
                    </a>
                </li>
                <li><a class="active"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5"><path stroke-linecap="round" stroke-linejoin="round" d="m2.25 12 8.954-8.955c.44-.439 1.152-.439 1.591 0L21.75 12M4.5 9.75v10.125c0 .621.504 1.125 1.125 1.125H9.75v-4.875c0-.621.504-1.125 1.125-1.125h2.25c.621 0 1.125.504 1.125 1.125V21h4.125c.621 0 1.125-.504 1.125-1.125V9.75M8.25 21h8.25" /></svg> Home</a></li>
                <li><a><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5"><path stroke-linecap="round" stroke-linejoin="round" d="M2.25 18.75a60.07 60.07 0 0 1 15.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 0 1 3 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125V18.75m-1.125-13.5h-1.125" /></svg> Transactions</a></li>
                <li><a><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5"><path stroke-linecap="round" stroke-linejoin="round" d="M10.5 6a7.5 7.5 0 1 0 7.5 7.5h-7.5V6Z" /><path stroke-linecap="round" stroke-linejoin="round" d="M13.5 10.5H21A7.5 7.5 0 0 0 13.5 3v7.5Z" /></svg> Analytics</a></li>
            </ul>

            <div class="p-4 border-t border-base-300">
                <div class="alert bg-base-300 shadow-sm">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="h-6 w-6 shrink-0 stroke-current"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                    <div><h3 class="font-bold text-sm">Need Help?</h3></div>
                </div>
            </div>
        </aside>
    </div>
</div>
</body>
</html>