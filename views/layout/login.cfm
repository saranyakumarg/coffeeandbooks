<cfoutput>
<!-- Modal for Admin Login -->
<div id="adminLoginModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Login</h2>
        <form id="adminLoginForm" onsubmit="loginFormSubmit(event)">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br>
            <span id="loginResponse"></span>
            <button type="submit" id="loginSubmit" name="loginSubmit">Login</button>
        </form>
        <p>Don't have an account? <a href="##" id="registerLink">Register</a></p>
    </div>
</div>

<!-- Modal for Registration -->
<div id="registerModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>Register</h2>
        <form id="registerForm" onsubmit="registerFormSubmit(event)">
            <label for="newUsername">Username:</label>
            <input type="text" id="newUsername" name="newUsername" required><br>
            <label for="newPassword">Password:</label>
            <input type="password" id="newPassword" name="newPassword" required><br>
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required><br>
            <span id="registerResponse"></span>
            <button type="submit" id="registerSubmit" name="registerSubmit">Register</button>
        </form>
    </div>
</div>
</cfoutput>