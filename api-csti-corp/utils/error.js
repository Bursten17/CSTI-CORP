function err(message, code) {
    let e = new Error(code ? message : "Error inesperado , vuelva a intentarlo");

    if (code) {
        e.status = code || 500;
    }

    return e;
}

module.exports = err;
