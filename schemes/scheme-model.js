const db = require('../data/db-config.js');

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes').where({id});
}

function findSteps(id) {
//  SELECT st.id, sc.scheme_name, st.step_number, st.instructions 
// FROM steps as st
// JOIN schemes as sc
// WHERE st.scheme_id = 2 AND sc.id = 2
// ORDER BY st.step_number
    return db('steps as st').join('schemes as sc').select('st.id', 'sc.scheme_name', 'st.step_number', 'st.instructions').where('st.scheme_id', id).where('sc.id', id).orderBy('step_number');
}

function add(scheme) {
   return db('schemes').insert(scheme);
}

function update(body, id) {
    return db('schemes').where('id', id).update(body).returning('id');
 }

 function remove(id) {
    return db('schemes').where('id', id).del().returning('id');
 }

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove,
}