"use strict";
const userValidator = {
    validateRegister: function (formData) {
        let errors = [];
        let nombre = formData.get("nombre");
        let password = formData.get("password");
        let password2 = formData.get("password2");
        let email = formData.get("email");
        let phone = formData.get("telefono");
        let fechaNacimiento = formData.get("fechaNacimiento");

        if (nombre.length < 3) {
            errors.push("El nombre debe ser de 3 o más caracteres");
        }
        if (password !== password2) {
            errors.push("Las contraseñas no coinciden");
        }

        if (!validateEmail(email)) {
            errors.push("Por favor, ingrese un email válido");
        }

        if (!validatePhoneNumber(phone)) {
            errors.push("Por favor, ingrese un número de teléfono válido");
        }

        if (!isAdult(fechaNacimiento)) {
            errors.push("Debe ser mayor de edad para registrarse");
        }

        return errors;
    }
};

// Función para validar el formato del email
function validateEmail(email) {
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailPattern.test(email);
}

// Función para validar el número de teléfono
function validatePhoneNumber(phone) {
    const phonePattern = /^\d{9}$/;
    return phonePattern.test(phone);
}

// Función para verificar si es mayor de edad (18 años o más)
function isAdult(fechaNacimiento) {
    const today = new Date();
    const birthDate = new Date(fechaNacimiento);
    const age = today.getFullYear() - birthDate.getFullYear();
    const monthDiff = today.getMonth() - birthDate.getMonth();

    if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
        return age - 1 >= 18;
    }

    return age >= 18;
}

export { userValidator };
