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

const citasAPI_auto = {

    /** Gets all entries from 'citas' */
    getAll: async function() {
        let response = await axios.get(`${BASE_URL}/citas`, requestOptions);
        return response.data;
    },

    /** Gets an entry from 'citas' by its primary key */
    getById: async function(citasId) {
        let response = await axios.get(`${BASE_URL}/citas/${citasId}`, requestOptions);
        return response.data[0];
    },

    /** Creates a new entry in 'citas' */
    create: async function(formData) {
        let response = await axios.post(`${BASE_URL}/citas`, formData, requestOptions);
        return response.data;
    },

    /** Updates an existing entry in 'citas' by its primary key */
    update: async function(formData, citasId) {
        let response = await axios.put(`${BASE_URL}/citas/${citasId}`, formData, requestOptions);
        return response.data;
    },

    /** Deletes an existing entry in 'citas' by its primary key */
    delete: async function(citasId) {
        let response = await axios.delete(`${BASE_URL}/citas/${citasId}`, requestOptions);
        return response.data;
    },
};

export { citasAPI_auto };