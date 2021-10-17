const config_db_csti_corp = {
    user: 'sa',
    password: process.env.PASSWORD || 'qlixim-30',
    server: process.env.HOST || 'DESKTOP-QP4INVP',
    database: process.env.DATABASE || 'CSTI_CORP',
    options: {
        trustServerCertificate: true
    },
    pool: {
        max:20,
        min:0
    }
}

module.exports = {
    config_db_csti_corp
}