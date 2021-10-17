import numeral from 'numeral'
import moment from 'moment'

const solesFilter = function (value) {
    if(!value) return 'S/ 0.00'

    return numeral(value).format('(S/ 0.00a)')
}

const dateFilter = function (date) {
    return moment(date).format('DD/MM/YYYY');
}

export {
    solesFilter,
    dateFilter
}