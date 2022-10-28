export class InputCell {
    constructor(val) {
        this._val = val
    }

    get value() {
        return this._val
    }

    setValue(val) {
        this._val = val
    }
}

export class ComputeCell {
    constructor(inputCells, fn) {
        this._inputCells = inputCells
        this._fn = fn
    }
    get value() {
        return this._fn(this._inputCells)
    }
}

export class CallbackCell {}