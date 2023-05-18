import { messageRenderer } from "/js/renderers/messages.js";
import { userValidator } from "/js/validators/register.js";
function main() {
    let registerForm = document.getElementById("register-form");
    registerForm.onsubmit = handleSubmitRegister;
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
}




document.addEventListener("DOMContentLoaded", main);
