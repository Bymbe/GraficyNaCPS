class Complex {
  float real;  // the real part
  float img;   // the imaginary part

  public Complex(float real, float img) {
    this.real = real;
    this.img = img;
  }

  public Complex multi(Complex b) {
    float real = this.real * b.real - this.img * b.img;
    float img = this.real * b.img + this.img * b.real;
    return new Complex(real, img);
  }

  public Complex divides(int that) {
    return this.times(that);
  }

  public Complex times(int that) {
    float rel = this.real * that - this.img * that;
    float imag = this.real * that + this.img * that;
    return new Complex(rel, imag);
  }

  public Complex pow(float d1)
  {
    //return this.log().multiply(d1).exp(); // tu jest lipa brakuje kilku funkcji bo niestety nie ma ich w processingu
    return this;
  }

  public Complex(float real) {
    this.real = real;
    this.img = 0;
  }

  public float getReal() {
    return real;
  }

  public float getImag() {
    return img;
  }
}
