const mod = (x, n) => (x % n + n) % n

export class Clock {
  constructor(hours, minutes) {
    this._hours = mod(hours + Math.floor((minutes || 0) / 60), 24)
    this._minutes = mod(minutes || 0, 60)
  }

  toString() {
    return `${this._hours.toString().padStart(2, "0")}:${this._minutes.toString().padStart(2, "0")}`
  }

  plus(minutes) {
    return new Clock(this._hours, this._minutes + minutes)
  }

  minus(minutes) {
    return this.plus(-minutes)
  }

  equals(clock) {
    return this.toString() === clock.toString()
  }
}
