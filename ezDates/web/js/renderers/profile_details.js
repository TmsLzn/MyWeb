import { parseHTML } from "/js/utils/parseHTML.js";
import { photoRenderer } from "/js/renderers/profile_details.js";

const profileDetail = {
    render: function(user, pictures) {
        let profileContainer = parseHTML(`<div class="profile-detail"></div>`);

        // Cabecera del perfil con el nombre de usuario
        let header = parseHTML(`
            <div class="profile-header">
                <h2>${user.username}</h2>
            </div>
        `);
        profileContainer.appendChild(header);

        // Galería de fotos del usuario
        let gallery = photoGallery.asPhotoGallery(pictures);
        profileContainer.appendChild(gallery);

        return profileContainer;
    }
};

export { profileDetail };
