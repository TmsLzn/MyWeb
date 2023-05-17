/*
 * DO NOT EDIT THIS FILE, it is auto-generated. It will be updated automatically.
 * All changes done to this file will be lost upon re-running the 'silence createapi' command.
 * If you want to create new API methods, define them in a new file.
 *
 * Silence is built and maintained by the DEAL research group at the University of Seville.
 * You can find us at https://deal.us.es
 */

"use strict";

import { BASE_URL, requestOptions } from './common.js';

const ubicacionesAPI_auto = {

    /** Gets all entries from 'ubicaciones' */
    getAll: async function() {
        let response = await axios.get(`${BASE_URL}/ubicaciones`, requestOptions);
        return response.data;
    },

    /** Gets an entry from 'ubicaciones' by its primary key */
    getById: async function(ubicacionId) {
        let response = await axios.get(`${BASE_URL}/ubicaciones/${ubicacionId}`, requestOptions);
        return response.data[0];
    },

    /** Creates a new entry in 'ubicaciones' */
    create: async function(formData) {
        let response = await axios.post(`${BASE_URL}/ubicaciones`, formData, requestOptions);
        return response.data;
    },

    /** Updates an existing entry in 'ubicaciones' by its primary key */
    update: async function(formData, ubicacionId) {
        let response = await axios.put(`${BASE_URL}/ubicaciones/${ubicacionId}`, formData, requestOptions);
        return response.data;
    },

    /** Deletes an existing entry in 'ubicaciones' by its primary key */
    delete: async function(ubicacionId) {
        let response = await axios.delete(`${BASE_URL}/ubicaciones/${ubicacionId}`, requestOptions);
        return response.data;
    },
};

export { ubicacionesAPI_auto };