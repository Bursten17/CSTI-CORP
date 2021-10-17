const sql = require("mssql");
const { config_db_csti_corp } = require("./config");

async function connection() {
    const pool = new sql.ConnectionPool(config_db_csti_corp);

    try {
        connectionDb = await pool.connect();

        return connectionDb;
    } catch (error) {
        console.log("Error", error);
        throw "Error Database";
    }
}

module.exports = {
    sql,
    connection
};
