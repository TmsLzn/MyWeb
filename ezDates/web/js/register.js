import { messageRenderer } from "/js/renderers/messages.js";
import { userValidator } from "/js/validators/register.js";
import { sessionManager } from "/js/utils/session.js";
import { authAPI_auto } from "/js/api/_auth.js";


function main() {
    let registerForm = document.getElementById("register-form");
    registerForm.onsubmit = handleSubmitRegister;
    valoresPorDefecto();
}

function valoresPorDefecto() {
    let estatura = document.getElementById('estatura-input');
    estatura.value = 170;
    let peso = document.getElementById('peso-input');
    peso.value = 75;
    let genero = document.getElementById('gender-select');
    genero.value = 'other';
    let colorOjos = document.getElementById('color-ojos-input');
    colorOjos.value = 'other';
    let colorPelo = document.getElementById('color-pelo-input');
    colorPelo.value = 'other';
    let bio = document.getElementById('biografia-input');
    bio.value = 'Hola soy un/a nuev@ usuari@.';
}



function handleSubmitRegister(event) {
    event.preventDefault();
    let form = event.target;
    let formData = new FormData(form);
    let errors = userValidator.validateRegister(formData);
    if (errors.length > 0) {
        let errorsDiv = document.getElementById("errors");
        errorsDiv.innerHTML = "";
        for (let error of errors) {
            messageRenderer.showErrorAsAlert(error);
        }
    }
    else {
        sendRegister(formData);
    }
}

async function sendRegister(formData) {
    try {
        let loginData = await authAPI_auto.register(formData);
        let sessionToken = loginData.sessionToken;
        let loggedUser = loginData.user;
        sessionManager.login(sessionToken, loggedUser);
        window.location.href = "index.html";
    } catch (err) {
        
        messageRenderer.showErrorAsAlert("Error registering a new user", err);
        messageRenderer.showErrorAsAlert("Error registering a new user" + err.response );
    }
}


document.addEventListener("DOMContentLoaded", main);
