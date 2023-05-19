"use strict";
import { parseHTML } from "/js/utils/parseHTML.js"; // Función para crear elementos del DOM

const photoRenderer = {
    // 5.2 Devuelve Card para la galería
    asCard: function (user) {
        let html = `<div class="col-md-4 mb-2">
            <div class="card bg-dark text-light">
                <div class="card-body d-flex flex-column align-items-center">
                    <div class="profile-image-container mb-3">
                        <a href="photo_detail.html?photoId=${user.userId}">
                            <img src="${user.fotoUrl}" class="img-fluid card-image embed-responsive-item rounded-profile">
                        </a>
                    </div>
                    <h5 class="card-title">@${user.usuario}</h5>
                    <p class="card-text">${user.biografia}</p>
                </div>
            </div>
        </div>`;
        let card = parseHTML(html);
        return card;
    },
    
    
    

    // 5.3 Detalles de la foto
    asDetails: function (user) {
        let html = `<div>
            <img src="${photo.urlFoto}" class="img-fluid rounded">
            <h3>${photo.nombreFoto}</h3>
            <h6>${photo.biografia}</h6>
            <p>Uploaded by (User <a href="profile.html" class="user-link">@${user.userId}</a>)</p>
        </div>`;
        let photoDetails = parseHTML(html);
        return photoDetails;
    },
};

export { photoRenderer };
