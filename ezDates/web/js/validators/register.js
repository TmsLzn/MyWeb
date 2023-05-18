"use strict";
const userValidator = {
    validateRegister: function (formData) {
        let errors = [];
        let firstName = formData.get("firstName");
        let lastName = formData.get("lastName");
        let password = formData.get("password");
        let password2 = formData.get("password2");
        if (firstName.length < 3) {
            errors.push("El nombre debe ser de 3 o más carácteres");
        }
        if (lastName.length < 3) {
            errors.push("Tu apellido debe ser de 3 o más carácteres");
        }
        
        if (password !== password2) {
        errors.push("Las contraseñas no coinciden");
        }
        return errors;
        }
};
export { userValidator };
