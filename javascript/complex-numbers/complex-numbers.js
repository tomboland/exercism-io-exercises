const i = Math.sqrt(-1)

export class ComplexNumber {
  constructor(real, imag) {
    this._real = real
    this._imag = imag
  }

  get real() {
    return this._real
  }

  get imag() {
    return this._imag
  }

  add(other) {
    return new ComplexNumber(this.real + other.real, this.imag + other.imag)
  }

  sub(other) {
    return new ComplexNumber(this.real - other.real, this.imag - other.imag)
  }

  div(other) {
    return new ComplexNumber(
      (this.real * other.real + this.imag * other.imag)
      / (other.real * other.real + other.imag * other.imag),
      (this.imag * other.real - this.real * other.imag)
      / (other.real * other.real + other.imag * other.imag)
    )
  }

  mul(other) {
    return new ComplexNumber(
      this.real * other.real - this.imag * other.imag,
      this.imag * other.real + this.real * other.imag)
  }
// multComplex (xr, xi) (yr, yi) = (xr * yr - xi * yi, xi * yr + xr * yi)
  get abs() {
    return Math.sqrt(this.real * this.real + this.imag * this.imag)
  }

  get conj() {
    return new ComplexNumber(this.real, this.imag ? -this.imag : 0)
  }

  get exp() {
    const exp = Math.exp(this.real)
    return new ComplexNumber(
      exp * Math.cos(this.imag),
      exp * Math.sin(this.imag))
  }
}
