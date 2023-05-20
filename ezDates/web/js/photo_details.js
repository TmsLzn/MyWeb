"use strict";

import { sessionManager } from "/js/utils/session.js";

import { photoRenderer } from "/js/renderers/fotos.js";
import { fotosAPI_auto } from "/js/api/_fotos.js";
import { messageRenderer } from "/js/renderers/messages.js";

// Get the ID of the photo to load from the URL params
let urlParams = new URLSearchParams(window.location.search);
let photoId = urlParams.get("fotoId");

async function main() {
    // Check that we have an ID before doing anything else
    if (photoId === null) {
        messageRenderer.showMessageAsAlert("Please, provide a photoId");
        return;
    }

    let deleteBtn = document.getElementById("button-delete");
    deleteBtn.onclick = handleDelete;

    let editBtn = document.querySelector("#button-edit");
    editBtn.onclick = handleEdit;


    loadPhotoDetails();
    hideActionsColumn();
}

function hideActionsColumn() {
    let actions_col = document.getElementById("actions-col");
    if (!sessionManager.isLogged()) {
        actions_col.style.display = "none";
    }
}


function handleEdit(event) {
    window.location.href = "edit_photo.html?photoId=" + photoId;
}


async function handleDelete(event) {
    let answer = confirm("Do you really want to delete this photo?");
    if (answer) {
        try {
            await fotosAPI_auto.delete(photoId);
            window.location = "/index.html";
        } catch (err) {
            messageRenderer.showErrorMessage(err.response.data.message);
        }
    }
}

async function loadPhotoDetails() {
    let photoContainer = document.querySelector("#photo-details-column");
    try {
        let photo = await fotosAPI_auto.getById(photoId);
        console.log(photo);
        let photoDetails = photoRenderer.asDetails(photo);
        photoContainer.appendChild(photoDetails);
    } catch (err) {
        messageRenderer.showErrorMessage("Error loading photo", err);
    }
}

document.addEventListener("DOMContentLoaded", main);