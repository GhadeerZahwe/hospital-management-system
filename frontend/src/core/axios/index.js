// axiosConfig.js
import axios from "axios"

export const requestData = async (route, method, data, headers) =>
    await axios
        .request({
            url: `http://localhost/hospital-management-system/backend/php/${route}`,
            method,
            data,
            headers: {
                "Content-Type": "application/json",
                ...headers,
            },
        })
        .then((res) => {
            return res.data
        })
