
<cfoutput>
<!-- Modal for Admin Login -->
<div id="adminLoginModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Admin Login</h2>
        <form id="adminLoginForm" onsubmit="loginFormSubmit(event)">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <span id="loginResponse"></span>
            <button type="submit" id="loginSubmit" name="loginSubmit">Login</button>
        </form>
    </div>
</div>
</cfoutput>