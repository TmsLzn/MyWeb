"use strict";

import { parseHTML } from "/js/utils/parseHTML.js";
import { photoRenderer } from "/js/renderers/fotos.js";

const photoGallery = {
    asPhotoGallery: function(pictures) {
        let row = parseHTML(`<div class="row my-4 py-4"></div>`);
        let galleryContainer = parseHTML('<div class="photo-gallery"></div>');
        galleryContainer.appendChild(row);
        let counter = 0;

        for (let picture of pictures) {
            let card = photoRenderer.asCard(picture);
            console.log(card);
            row.appendChild(card);
            counter += 1;
            if (counter % 3 === 0) {
                row = parseHTML('<div class="row"></div>');
                galleryContainer.appendChild(row);

            }
        }
        return galleryContainer;
    }
};

export { photoGallery };