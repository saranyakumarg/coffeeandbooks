
<cfoutput>
<!-- Modal for General purpose -->
<div id="GeneralModal" class="modal">
    <div class="modal-content" id="confirm-modal">
        <span class="close">&times;</span>
        <h3 id="popup-heading"></h3>
        <p id="popup-content"></p>
        <input hidden name="confirm_id" id="confirm_id" value="">
        <button id="confirm-button" class="confirm-btn" onclick="confirmBooking()">Confirm</button>
    </div>
    <div class="modal-content" id="success-modal">
        <span class="close">&times;</span>
        <p id="success-content"></p>
        <button id="next-button" class="confirm-btn">Go for it</button>
    </div>
</div>
</cfoutput>