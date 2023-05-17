"use strict";
import { parseHTML } from "/js/utils/parseHTML.js"; // Función para crear elementos del DOM
const photoRenderer = { 
	// 5.2 Devuelve Card para la galería
	asCard: function (photo) { // El parámetro es un objeto photo
	 let html = `<div class= "col-md-4 mb-2">
					<div class= "card bg-dark text-light">
						<div class="embed-responsive embed-responsive-4by3">
							<a href="photo_detail.html?photoId=${photo.fotoId}">
								<img src="${photo.urlFoto}" class="img-fluid card-image embed-responsive-item">
							</a>
						</div>	
						<div class="card-body pb-0">
							<h5 class="card-title text-center p-0 m-0 ">${photo.nombreFoto} </h5 >
							<p class= "card-text p-0 m-0 "><small>${photo.descripcionFoto}</small></p>
							<p class= "text-end">@${photo.userId}
							</p>
						</div>
					</div>
				</div>`;
	 let card = parseHTML (html);
	 return card;
	},
	// 5.3 Detalles de la foto
	asDetails: function (photo) {
		let html = `<div><img src="${photo.uelFoto}" class="img-fluid rounded">
					<h3>${photo.nombewFoto}</h3>
					<h6>${photo.description}</h6>
					<p> Uploaded by (User <a href="profile.html" class="user-link">@${photo.userId})</p>
					</div>`;
		let photoDetails = parseHTML (html);
		return photoDetails;
		},
};
export { photoRenderer };