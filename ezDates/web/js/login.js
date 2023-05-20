"use strict";

import { messageRenderer } from "/js/renderers/messages.js";
import { loginValidator } from "/js/validators/login.js";

import { sessionManager } from "/js/utils/session.js";
import { authAPI_auto } from "/js/api/_auth.js";

function main() {
    let loginForm = document.getElementById("login-form");
    loginForm.onsubmit = handleSubmitLogin;
}

async function handleSubmitLogin(event) {
    try {
        event.preventDefault();
        let form = event.target;
        let formData = new FormData(form);
        let err = loginValidator.validate(formData);
        let loginData = await authAPI_auto.login(formData);
        let sessionToken = loginData.sessionToken;
        let loggedUser = loginData.user;


        sessionManager.login(sessionToken, loggedUser);
        window.location.href = "index.html";

    } catch (err) {
        messageRenderer.showErrorAsAlert("Error en el inicio", err);
    }

}


document.addEventListener("DOMContentLoaded", main);