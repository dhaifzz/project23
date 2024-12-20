<style>
    p#modal-message{    
        font-weight: bold;
        font-size: 1.35rem;
        color: #b11b1b;
        text-align: center;
    } 
</style>

<?php 
$date = date("Y-m-d H:i:s");
?>
<div class="modal fade" id="approvalButtons" tabindex="-1" aria-labelledby="approvalButtonsLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <p id="modal-message"></p>
                <div id="modal-details"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger" id="modal-confirm">Confirm</button>
            </div>
        </div>
    </div>
</div>

<script>
    const sessionId = <?php echo json_encode($_SESSION['guidance_id']); ?>;
    const date = <?php echo json_encode($date); ?>;
    
    document.addEventListener('DOMContentLoaded', function () {
    const modal = new bootstrap.Modal(document.getElementById('approvalButtons'));
    
    document.querySelectorAll('.approvalButtons button').forEach(button => {
        button.addEventListener('click', function () {
            const action = button.getAttribute('data-action'); // 'approve' or 'decline'
            const name = button.getAttribute('data-name');
            const id = button.getAttribute('data-id');
            const course = button.getAttribute('data-course');
            const dateAbsent = button.getAttribute('data-date-absent');

            const modalMessage = document.getElementById('modal-message');
            modalMessage.textContent = 
                action === 'approve' 
                ? `Approve the letter of ${name}?` 
                : `Decline the letter of ${name}?`;

            const modalDetails = document.getElementById('modal-details');
            modalDetails.innerHTML = `
                <p><strong>Course:</strong> ${course}</p>
                <p><strong>Date of Absence:</strong> ${dateAbsent}</p>
            `;

            const confirmButton = document.getElementById('modal-confirm');
            confirmButton.onclick = function () {
                const endpoint = action === 'approve' ? 'approve_request.php' : 'approve_request.php';

                // Send data via AJAX
                fetch(endpoint, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        excuse_letter_id: id,
                        guidance_id: sessionId,
                        date: date,
                        approval: action === 'approve' ? 'Approved' : 'Denied'
                    })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        location.reload(); // Refresh the page
                    }
                    modal.hide();
                })
                .catch(() => {
                    modal.hide();
                });
            };

            modal.show();
        });
    });
});

</script>

