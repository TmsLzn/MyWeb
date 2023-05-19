"use strict";
import { photoGallery } from '/web/js/renderers/usuarioGallery.js';

import { usuariosAPI_auto } from '/web/js/api/_usuarios.js';
import { messageRenderer } from '/web/js/renderers/messages.js';

async function main() {
    loadUsers();
};

usuarios_trending.addEventListener("click", function (event) {
    let card = event.target.closest(".card");
    if (card) {
        let userId = card.getAttribute("data-photo-id");
       //Redireccionar a photo_details.html pasando el ID de la foto
        window.location.href = "photo_details.html?id=" + userId;
    }
});

async function loadUsers() {
    let galleryContainer = document.getElementById("usuarios_trending");
    try {
        let usuarios = await usuariosAPI_auto.getAll();
        let cardGallery = photoGallery.asPhotoGallery(usuarios);
        galleryContainer.appendChild(cardGallery);
    } catch (err) {
        messageRenderer.showErrorAsAlert("Error cargando foto", err);
    }
}


document.addEventListener("DOMContentLoaded", main);