class Complex {
  float real;  // the real part
  float img;   // the imaginary part
  Complex NaN = new Complex(Float.NaN, Float.NaN);
  Complex INF = new Complex(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY);
  private boolean isNaN;
  private boolean isInfinite;

  public Complex(float real, float img) {
    this.real = real;
    this.img = img;
    isNaN = Double.isNaN(real) || Double.isNaN(img);
    isInfinite = !isNaN && (Double.isInfinite(real) || Double.isInfinite(img));
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

  public Complex multiply(Complex factor) {
    if (isNaN || factor.isNaN) {
      return NaN;
    }
    if (Float.isInfinite(real) || Float.isInfinite(img) || Float.isInfinite(factor.real) || Float.isInfinite(factor.img))
      return INF;
    return createComplex(real * factor.real - img * factor.img,
      real * factor.img + img * factor.real);
  }

  public Complex multiply(float factor) {
    if (isNaN || Float.isNaN(factor)) return NaN;
    if (Float.isInfinite(real) || Float.isInfinite(img) || Float.isInfinite(factor)) return INF;
    return createComplex( real * factor, img * factor);
  }

  public Complex pow(float d1)
  {
    return this.log().multiply(d1).exp();
  }

  public Complex exp() {
    if (isNaN) return NaN;
    float expReal = FastMath.exp(real);
    return CreateComplex(expReal * FastMath.cos(img), expReal * FastMath.sin(img));
  }

  public Complex log() {
    if (isNaN) {
      return NaN;
    }
    return createComplex(FastMath.log(abs()), FastMath.atan2(imaginary, real));
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

  public boolean isNaN() {
    return isNaN;
  }

  protected Complex createComplex(float realPart, float imaginaryPart) {
    return new Complex(realPart, imaginaryPart);
  }
}

class FastMath {
  public static float exp(float x) {
    return exp(x, 0.0, null);
  }

  private static float exp(float x, float extra, float[] hiPrec) {
    float intPartA;
    float intPartB;
    int intVal = (int) x;
    if (x < 0.0) {

      if (x < -746d) {
        if (hiPrec != null) {
          hiPrec[0] = 0.0;
          hiPrec[1] = 0.0;
        }
        return 0.0;
      }
      if (intVal < -709) {

        final float result = exp(x+40.19140625, extra, hiPrec) / 285040095144011776.0;
        if (hiPrec != null) {
          hiPrec[0] /= 285040095144011776.0;
          hiPrec[1] /= 285040095144011776.0;
        }
        return result;
      }

      if (intVal == -709) {
        final float result = exp(x+1.494140625, extra, hiPrec) / 4.455505956692756620;
        if (hiPrec != null) {
          hiPrec[0] /= 4.455505956692756620;
          hiPrec[1] /= 4.455505956692756620;
        }
        return result;
      }

      intVal--;
    } else {
      if (intVal > 709) {
        if (hiPrec != null) {
          hiPrec[0] = Double.POSITIVE_INFINITY;
          hiPrec[1] = 0.0;
        }
        return Double.POSITIVE_INFINITY;
      }
    }

    intPartA = ExpIntTable.EXP_INT_TABLE_A[EXP_INT_TABLE_MAX_INDEX+intVal];
    intPartB = ExpIntTable.EXP_INT_TABLE_B[EXP_INT_TABLE_MAX_INDEX+intVal];

    final int intFrac = (int) ((x - intVal) * 1024.0);
    final double fracPartA = ExpFracTable.EXP_FRAC_TABLE_A[intFrac];
    final double fracPartB = ExpFracTable.EXP_FRAC_TABLE_B[intFrac];


    final double epsilon = x - (intVal + intFrac / 1024.0);

    double z = 0.04168701738764507;
    z = z * epsilon + 0.1666666505023083;
    z = z * epsilon + 0.5000000000042687;
    z = z * epsilon + 1.0;
    z = z * epsilon + -3.940510424527919E-20;


    double tempA = intPartA * fracPartA;
    double tempB = intPartA * fracPartB + intPartB * fracPartA + intPartB * fracPartB;

    final double tempC = tempB + tempA;

    if (tempC == Double.POSITIVE_INFINITY) {
      return Double.POSITIVE_INFINITY;
    }

    final double result;
    if (extra != 0.0) {
      result = tempC*extra*z + tempC*extra + tempC*z + tempB + tempA;
    } else {
      result = tempC*z + tempB + tempA;
    }

    if (hiPrec != null) {
      hiPrec[0] = tempA;
      hiPrec[1] = tempC*extra*z + tempC*extra + tempC*z + tempB;
    }

    return result;
  }

  public float atan2(float y, float x) {
    if (x != x || y != y) return Float.NaN;
    if (y == 0) {
      float result = x * y;
      float invx = 1d / x;
      float invy = 1d / y;
      if (invx == 0) {
        if (x > 0) return y;
        else return copySign(PI, y);
      }
    }
    if (y == Double.POSITIVE_INFINITY) {
      if (x == Double.POSITIVE_INFINITY) {
        return Math.PI * F_1_4;
      }

      if (x == Double.NEGATIVE_INFINITY) {
        return Math.PI * F_3_4;
      }

      return Math.PI * F_1_2;
    }

    if (y == Double.NEGATIVE_INFINITY) {
      if (x == Double.POSITIVE_INFINITY) {
        return -Math.PI * F_1_4;
      }

      if (x == Double.NEGATIVE_INFINITY) {
        return -Math.PI * F_3_4;
      }

      return -Math.PI * F_1_2;
    }

    if (x == Double.POSITIVE_INFINITY) {
      if (y > 0 || 1 / y > 0) {
        return 0d;
      }

      if (y < 0 || 1 / y < 0) {
        return -0d;
      }
    }

    if (x == Double.NEGATIVE_INFINITY)
    {
      if (y > 0.0 || 1 / y > 0.0) {
        return Math.PI;
      }

      if (y < 0 || 1 / y < 0) {
        return -Math.PI;
      }
    }

    // Neither y nor x can be infinite or NAN here

    if (x == 0) {
      if (y > 0 || 1 / y > 0) {
        return Math.PI * F_1_2;
      }

      if (y < 0 || 1 / y < 0) {
        return -Math.PI * F_1_2;
      }
    }

    // Compute ratio r = y/x
    final double r = y / x;
    if (Double.isInfinite(r)) { // bypass calculations that can create NaN
      return atan(r, 0, x < 0);
    }

    double ra = doubleHighPart(r);
    double rb = r - ra;

    // Split x
    final double xa = doubleHighPart(x);
    final double xb = x - xa;

    rb += (y - ra * xa - ra * xb - rb * xa - rb * xb) / x;

    final double temp = ra + rb;
    rb = -(temp - ra - rb);
    ra = temp;

    if (ra == 0) { // Fix up the sign so atan works correctly
      ra = copySign(0d, y);
    }

    // Call atan
    final double result = atan(ra, rb, x < 0);

    return result;
  }
}
