exports.success = function (req, res, message, status, data) {
    let statusCode = status || 200;
    let statusMessage = message || "";

    res.status(statusCode)
        .send(
            {
                status: statusCode,
                message: statusMessage,
                data: data,
                error: false,
            }
        )
}

exports.error = function (req, res, message, status) {
    let statusCode = status || 500;
    let statusMessage = message || "Internal server error";

    res.status(status || 500)
        .send(
            {
                status: statusCode,
                message: statusMessage,
                data: null,
                error: false,
            }
        )
}