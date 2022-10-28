export class Matrix {
  constructor(strmat) {
    this._rows = strmat.split("\n").map((row) => {
      return row.split(" ").map((elem) => { return ~~elem })
    })
    this._columns = this.rows.map((_, i) => {
      return this.rows.map((row) => {
        return row[i]
      })
    })

  }

  get rows() {
    return this._rows
  }

  get columns() {
    return this._columns
  }
}
