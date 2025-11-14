import axios from "axios";
const apiUrl = window._env_?.REACT_APP_BACKEND_URL || "http://localhost:5000/api/tasks";
console.log("Using API URL:", apiUrl);
console.log(apiUrl)
export function getTasks() {
    return axios.get(apiUrl);
}

export function addTask(task) {
    return axios.post(apiUrl, task);
}

export function updateTask(id, task) {
    return axios.put(apiUrl + "/" + id, task);
}

export function deleteTask(id) {
    return axios.delete(apiUrl + "/" + id);
}
