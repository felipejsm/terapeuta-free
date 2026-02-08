@import java.util.List
@import com.felipe.tmpl.dto.SessionDTO
@param List<SessionDTO> sessions

<ul class="timeline timeline-vertical">
    @for(var session : sessions)
        <li>
            <div class="timeline-start font-mono text-xs">${session.formattedDate()}</div>
            <div class="timeline-middle">
                <div class="bg-primary text-primary-content rounded-full p-1">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-3 w-3" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M5 13l4 4L19 7" />
                    </svg>
                </div>
            </div>
            <div class="timeline-end timeline-box shadow-sm border-base-300 py-3">
                ${session.notes()}
            </div>
            <hr class="bg-primary"/>
        </li>
    @endfor
</ul>