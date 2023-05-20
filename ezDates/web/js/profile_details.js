"use strict";

import { photoGallery } from '/web/js/renderers/fotos_trendingGallery.js';

import { fotosAPI_auto } from '/web/js/api/_fotos.js';
import { messageRenderer } from '/web/js/renderers/messages.js';

async function main() {
    await loadPhotos();
}

async function loadPhotos() {
    let galleryContainer = document.getElementById("perfil_fotos");
    try {
        let photos = await fotosAPI_auto.getAll();
        let cardGallery = photoGallery.asPhotoGallery(photos);
        galleryContainer.appendChild(cardGallery);
    } catch (err) {
        messageRenderer.showErrorAsAlert("Error cargando foto", err);
    }
}

document.addEventListener("DOMContentLoaded", main);
