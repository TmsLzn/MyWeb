"use strict"

const loginValidator = {
    validate: function(formData) {
        let user = formData.get("usuario");
        let password = formData.get("password");

        let errors = [];

        if (usuario.length < 3) {
            errors.push("El usuario tiene que tener más de 3 caracteres");
        } else if (password.length < 3) {
            errors.push("La contraseña tiene que tener más de 3 caracteres");
        }



        return errors;
    }

}

export { loginValidator }