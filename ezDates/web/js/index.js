"use strict";
import { photoGallery } from '/js/renderers/fotos_trendingGallery.js';
import { fotosAPI_auto } from '/js/api/_fotos.js';
import {messageRenderer} from '/js/renderers/mesagges.js';

async function main() {
    loadPhotos();
};

gallery.addEventListener("click", function (event) {
    let card = event.target.closest(".card");
    if (card) {
        let photoId = card.getAttribute("data-photo-id");
        // Redireccionar a photo_details.html pasando el ID de la foto
        window.location.href = "photo_details.html?id=" + photoId;
    }
});

async function loadPhotos() {
    let galleryContainer = document.getElementById("fotos_trending");
    try {
        let photos = await fotosAPI_auto.getAll();
        let cardGallery = photoGallery.asPhotoGallery(photos);
        galleryContainer.appendChild(cardGallery);
    } catch (err) {
        messageRenderer.showErrorAsAlert("Error cargando foto", err);
    }
}


document.addEventListener("DOMContentLoaded", main);