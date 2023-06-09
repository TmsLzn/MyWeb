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

const vinculosAPI_auto = {

    /** Gets all entries from 'vinculos' */
    getAll: async function() {
        let response = await axios.get(`${BASE_URL}/vinculos`, requestOptions);
        return response.data;
    },

    /** Gets an entry from 'vinculos' by its primary key */
    getById: async function(vinculoId) {
        let response = await axios.get(`${BASE_URL}/vinculos/${vinculoId}`, requestOptions);
        return response.data[0];
    },

    /** Creates a new entry in 'vinculos' */
    create: async function(formData) {
        let response = await axios.post(`${BASE_URL}/vinculos`, formData, requestOptions);
        return response.data;
    },

    /** Updates an existing entry in 'vinculos' by its primary key */
    update: async function(formData, vinculoId) {
        let response = await axios.put(`${BASE_URL}/vinculos/${vinculoId}`, formData, requestOptions);
        return response.data;
    },

    /** Deletes an existing entry in 'vinculos' by its primary key */
    delete: async function(vinculoId) {
        let response = await axios.delete(`${BASE_URL}/vinculos/${vinculoId}`, requestOptions);
        return response.data;
    },
};

export { vinculosAPI_auto };