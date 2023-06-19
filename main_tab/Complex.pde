class Complex {
  float real;  // the real part
  float img;   // the imaginary part
  Complex NaN = new Complex(Float.NaN, Float.NaN);
  Complex INF = new Complex(Float.POSITIVE_INFINITY, Float.POSITIVE_INFINITY);
  private boolean isNaN;
  private boolean isInfinite;

  private final boolean RECOMPUTE_TABLES_AT_RUNTIME = false;
  final int LN_MANT_LEN = 1024;
  final int intFrac = (int) ((x[0] - 11) * 1024.0);

  private final long HEX_40000000 = 0x40000000L;

  final int EXP_INT_TABLE_MAX_INDEX = 750;
  final int EXP_INT_TABLE_LEN = EXP_INT_TABLE_MAX_INDEX * 2;

  private double[][] LN_MANT;

  private final float LN_HI_PREC_COEF[][] = {
    {1.0, -6.032174644509064E-23},
    {-0.25, -0.25},
    {0.3333333134651184, 1.9868161777724352E-8},
    {-0.2499999701976776, -2.957007209750105E-8},
    {0.19999954104423523, 1.5830993332061267E-10},
    {-0.16624879837036133, -2.6033824355191673E-8}
  };

  private static final double F_1_3 = 1d / 3d;
  /** Constant: {@value}. */
  private static final double F_1_5 = 1d / 5d;
  /** Constant: {@value}. */
  private static final double F_1_7 = 1d / 7d;
  /** Constant: {@value}. */
  private static final double F_1_9 = 1d / 9d;
  /** Constant: {@value}. */
  private static final double F_1_11 = 1d / 11d;
  /** Constant: {@value}. */
  private static final double F_1_13 = 1d / 13d;
  /** Constant: {@value}. */
  private static final double F_1_15 = 1d / 15d;
  /** Constant: {@value}. */
  private static final double F_1_17 = 1d / 17d;
  /** Constant: {@value}. */
  private static final double F_3_4 = 3d / 4d;
  /** Constant: {@value}. */
  private static final double F_15_16 = 15d / 16d;
  /** Constant: {@value}. */
  private static final double F_13_14 = 13d / 14d;
  /** Constant: {@value}. */
  private static final double F_11_12 = 11d / 12d;
  /** Constant: {@value}. */
  private static final double F_9_10 = 9d / 10d;
  /** Constant: {@value}. */
  private static final double F_7_8 = 7d / 8d;
  /** Constant: {@value}. */
  private static final double F_5_6 = 5d / 6d;
  /** Constant: {@value}. */
  private static final double F_1_2 = 1d / 2d;
  /** Constant: {@value}. */
  private static final double F_1_4 = 1d / 4d;

  private final long RECIP_2PI[] = new long[] {
    (0x28be60dbL << 32) | 0x9391054aL,
    (0x7f09d5f4L << 32) | 0x7d4d3770L,
    (0x36d8a566L << 32) | 0x4f10e410L,
    (0x7f9458eaL << 32) | 0xf7aef158L,
    (0x6dc91b8eL << 32) | 0x909374b8L,
    (0x01924bbaL << 32) | 0x82746487L,
    (0x3f877ac7L << 32) | 0x2c4a69cfL,
    (0xba208d7dL << 32) | 0x4baed121L,
    (0x3a671c09L << 32) | 0xad17df90L,
    (0x4e64758eL << 32) | 0x60d4ce7dL,
    (0x272117e2L << 32) | 0xef7e4a0eL,
    (0xc7fe25ffL << 32) | 0xf7816603L,
    (0xfbcbc462L << 32) | 0xd6829b47L,
    (0xdb4d9fb3L << 32) | 0xc9f2c26dL,
    (0xd3d18fd9L << 32) | 0xa797fa8bL,
    (0x5d49eeb1L << 32) | 0xfaf97c5eL,
    (0xcf41ce7dL << 32) | 0xe294a4baL,
    0x9afed7ecL << 32  };

  private final float LN_QUICK_COEF[][] = {
    {1.0, 5.669184079525E-24},
    {-0.25, -0.25},
    {0.3333333134651184, 1.986821492305628E-8},
    {-0.25, -6.663542893624021E-14},
    {0.19999998807907104, 1.1921056801463227E-8},
    {-0.1666666567325592, -7.800414592973399E-9},
    {0.1428571343421936, 5.650007086920087E-9},
    {-0.12502530217170715, -7.44321345601866E-11},
    {0.11113807559013367, 9.219544613762692E-9},
  };
  private final float LN_2_A = 0.693147063255310059;

  private final float LN_2_B = 1.17304635250823482e-7;

  private final float TWO_POWER_52 = 4503599627370496.0;

  private final long PI_O_4_BITS[] = new long[] {
    (0xc90fdaa2L << 32) | 0x2168c234L,
    (0xc4c6628bL << 32) | 0x80dc1cd1L };

  public Complex(float real, float img) {
    this.real = real;
    this.img = img;
    isNaN = Float.isNaN(real) || Float.isNaN(img);
    isInfinite = !isNaN && (Float.isInfinite(real) || Float.isInfinite(img));
  }

  public double[] slowLog(double xi) {
    //double x[] = new double[2];
    //double x2[] = new double[2];
    double y[] = new double[2];
    //double a[] = new double[2];

    //split(xi, x);

    ///* Set X = (x-1)/(x+1) */
    //x[0] += 1.0;
    //resplit(x);
    //splitReciprocal(x, a);
    //x[0] -= 2.0;
    //resplit(x);
    //splitMult(x, a, y);
    //x[0] = y[0];
    //x[1] = y[1];

    ///* Square X -> X2*/
    //splitMult(x, x, x2);


    ////x[0] -= 1.0;
    ////resplit(x);

    //y[0] = LN_SPLIT_COEF[LN_SPLIT_COEF.length-1][0];
    //y[1] = LN_SPLIT_COEF[LN_SPLIT_COEF.length-1][1];

    //for (int i = LN_SPLIT_COEF.length-2; i >= 0; i--) {
    //    splitMult(y, x2, a);
    //    y[0] = a[0];
    //    y[1] = a[1];
    //    splitAdd(y, LN_SPLIT_COEF[i], a);
    //    y[0] = a[0];
    //    y[1] = a[1];
    //}

    //splitMult(y, x, a);
    //y[0] = a[0];
    //y[1] = a[1];

    return y;
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
    float expReal = exp(real);
    return createComplex(expReal * cos(img), expReal * sin(img));
  }

  public Complex log() {
    if (isNaN) {
      return NaN;
    }
    return createComplex(log(abs(1)), atan2(img, real));
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

  public float exp(float x) {
    return exp2(x, 0.0, null);
  }

  private float exp(float x, float extra, float[] hiPrec) {
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
        float result = exp(x+40.19140625, extra, hiPrec) / 285040095144011776.0;
        if (hiPrec != null) {
          hiPrec[0] /= 285040095144011776.0;
          hiPrec[1] /= 285040095144011776.0;
        }
        return result;
      }
      if (intVal == -709) {
        float result = exp(x+1.494140625, extra, hiPrec) / 4.455505956692756620;
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
          hiPrec[0] = Float.POSITIVE_INFINITY;
          hiPrec[1] = 0.0;
        }
        return Float.POSITIVE_INFINITY;
      }
    }
    return 0.0;
  }

  protected Complex createComplex(float realPart, float imaginaryPart) {
    return new Complex(realPart, imaginaryPart);
  }

  public float cos(float x) {
    int quadrant = 0;

    /* Take absolute value of the input */
    float xa = x;
    if (x < 0) {
      xa = -xa;
    }

    if (xa != xa || xa == Float.POSITIVE_INFINITY) {
      return Float.NaN;
    }

    /* Perform any argument reduction */
    float xb = 0;
    if (xa > 3294198.0) {
      // PI * (2**20)
      // Argument too big for CodyWaite reduction.  Must use
      // PayneHanek.
      float reduceResults[] = new float[3];
      reducePayneHanek(xa, reduceResults);
      quadrant = ((int) reduceResults[0]) & 3;
      xa = reduceResults[1];
      xb = reduceResults[2];
    } else if (xa > 1.5707963267948966) {
      //CodyWaite cw = new CodyWaite(xa);
      //quadrant = cw.getK() & 3;
      //xa = cw.getRemA();
      //xb = cw.getRemB();
    }

    //if (negative)
    //  quadrant = (quadrant + 2) % 4;

    switch (quadrant) {
    case 0:
      //return cosQ(xa, xb);
    case 1:
      //return -sinQ(xa, xb);
    case 2:
      //return -cosQ(xa, xb);
    case 3:
      //return sinQ(xa, xb);
    default:
      return Float.NaN;
    }
  }

  private void reducePayneHanek(float x, float result[])
  {
    /* Convert input float to bits */
    long inbits = Double.doubleToRawLongBits(x);
    int exponent = (int) ((inbits >> 52) & 0x7ff) - 1023;

    /* Convert to fixed point representation */
    inbits &= 0x000fffffffffffffL;
    inbits |= 0x0010000000000000L;

    /* Normalize input to be between 0.5 and 1.0 */
    exponent++;
    inbits <<= 11;

    /* Based on the exponent, get a shifted copy of recip2pi */
    long shpi0;
    long shpiA;
    long shpiB;
    int idx = exponent >> 6;
    int shift = exponent - (idx << 6);

    if (shift != 0) {
      shpi0 = (idx == 0) ? 0 : (RECIP_2PI[idx-1] << shift);
      shpi0 |= RECIP_2PI[idx] >>> (64-shift);
      shpiA = (RECIP_2PI[idx] << shift) | (RECIP_2PI[idx+1] >>> (64-shift));
      shpiB = (RECIP_2PI[idx+1] << shift) | (RECIP_2PI[idx+2] >>> (64-shift));
    } else {
      shpi0 = (idx == 0) ? 0 : RECIP_2PI[idx-1];
      shpiA = RECIP_2PI[idx];
      shpiB = RECIP_2PI[idx+1];
    }

    /* Multiply input by shpiA */
    long a = inbits >>> 32;
    long b = inbits & 0xffffffffL;

    long c = shpiA >>> 32;
    long d = shpiA & 0xffffffffL;

    long ac = a * c;
    long bd = b * d;
    long bc = b * c;
    long ad = a * d;

    long prodB = bd + (ad << 32);
    long prodA = ac + (ad >>> 32);

    boolean bita = (bd & 0x8000000000000000L) != 0;
    boolean bitb = (ad & 0x80000000L ) != 0;
    boolean bitsum = (prodB & 0x8000000000000000L) != 0;

    /* Carry */
    if ( (bita && bitb) ||
      ((bita || bitb) && !bitsum) ) {
      prodA++;
    }

    bita = (prodB & 0x8000000000000000L) != 0;
    bitb = (bc & 0x80000000L ) != 0;

    prodB += bc << 32;
    prodA += bc >>> 32;

    bitsum = (prodB & 0x8000000000000000L) != 0;

    /* Carry */
    if ( (bita && bitb) ||
      ((bita || bitb) && !bitsum) ) {
      prodA++;
    }

    /* Multiply input by shpiB */
    c = shpiB >>> 32;
    d = shpiB & 0xffffffffL;
    ac = a * c;
    bc = b * c;
    ad = a * d;

    /* Collect terms */
    ac += (bc + ad) >>> 32;

    bita = (prodB & 0x8000000000000000L) != 0;
    bitb = (ac & 0x8000000000000000L ) != 0;
    prodB += ac;
    bitsum = (prodB & 0x8000000000000000L) != 0;
    /* Carry */
    if ( (bita && bitb) ||
      ((bita || bitb) && !bitsum) ) {
      prodA++;
    }

    /* Multiply by shpi0 */
    c = shpi0 >>> 32;
    d = shpi0 & 0xffffffffL;

    bd = b * d;
    bc = b * c;
    ad = a * d;

    prodA += bd + ((bc + ad) << 32);

    int intPart = (int)(prodA >>> 62);

    /* Multiply by 4 */
    prodA <<= 2;
    prodA |= prodB >>> 62;
    prodB <<= 2;

    /* Multiply by PI/4 */
    a = prodA >>> 32;
    b = prodA & 0xffffffffL;

    c = PI_O_4_BITS[0] >>> 32;
    d = PI_O_4_BITS[0] & 0xffffffffL;

    ac = a * c;
    bd = b * d;
    bc = b * c;
    ad = a * d;

    long prod2B = bd + (ad << 32);
    long prod2A = ac + (ad >>> 32);

    bita = (bd & 0x8000000000000000L) != 0;
    bitb = (ad & 0x80000000L ) != 0;
    bitsum = (prod2B & 0x8000000000000000L) != 0;

    /* Carry */
    if ( (bita && bitb) ||
      ((bita || bitb) && !bitsum) ) {
      prod2A++;
    }

    bita = (prod2B & 0x8000000000000000L) != 0;
    bitb = (bc & 0x80000000L ) != 0;

    prod2B += bc << 32;
    prod2A += bc >>> 32;

    bitsum = (prod2B & 0x8000000000000000L) != 0;

    /* Carry */
    if ( (bita && bitb) ||
      ((bita || bitb) && !bitsum) ) {
      prod2A++;
    }

    c = PI_O_4_BITS[1] >>> 32;
    d = PI_O_4_BITS[1] & 0xffffffffL;
    ac = a * c;
    bc = b * c;
    ad = a * d;

    /* Collect terms */
    ac += (bc + ad) >>> 32;

    bita = (prod2B & 0x8000000000000000L) != 0;
    bitb = (ac & 0x8000000000000000L ) != 0;
    prod2B += ac;
    bitsum = (prod2B & 0x8000000000000000L) != 0;
    /* Carry */
    if ( (bita && bitb) ||
      ((bita || bitb) && !bitsum) ) {
      prod2A++;
    }

    /* Multiply inputB by pio4bits[0] */
    a = prodB >>> 32;
    b = prodB & 0xffffffffL;
    c = PI_O_4_BITS[0] >>> 32;
    d = PI_O_4_BITS[0] & 0xffffffffL;
    ac = a * c;
    bc = b * c;
    ad = a * d;

    /* Collect terms */
    ac += (bc + ad) >>> 32;

    bita = (prod2B & 0x8000000000000000L) != 0;
    bitb = (ac & 0x8000000000000000L ) != 0;
    prod2B += ac;
    bitsum = (prod2B & 0x8000000000000000L) != 0;
    /* Carry */
    if ( (bita && bitb) ||
      ((bita || bitb) && !bitsum) ) {
      prod2A++;
    }

    float tmpA = (prod2A >>> 12) / TWO_POWER_52;  // High order 52 bits
    float tmpB = (((prod2A & 0xfffL) << 40) + (prod2B >>> 24)) / TWO_POWER_52 / TWO_POWER_52; // Low bits

    float sumA = tmpA + tmpB;
    float sumB = -(sumA - tmpA - tmpB);

    result[0] = intPart;
    result[1] = sumA * 2.0;
    result[2] = sumB * 2.0;
  }


  public float sin(float x) {
    boolean negative = false;
    int quadrant = 0;
    float xa;
    float xb = 0.0;

    /* Take absolute value of the input */
    xa = x;
    if (x < 0) {
      negative = true;
      xa = -xa;
    }

    /* Check for zero and negative zero */
    if (xa == 0.0) {
      long bits = Double.doubleToRawLongBits(x);
      if (bits < 0) {
        return -0.0;
      }
      return 0.0;
    }

    if (xa != xa || xa == Float.POSITIVE_INFINITY) {
      return Float.NaN;
    }

    /* Perform any argument reduction */
    if (xa > 3294198.0) {
      // PI * (2**20)
      // Argument too big for CodyWaite reduction.  Must use
      // PayneHanek.
      float reduceResults[] = new float[3];
      reducePayneHanek(xa, reduceResults);
      quadrant = ((int) reduceResults[0]) & 3;
      xa = reduceResults[1];
      xb = reduceResults[2];
    } else if (xa > 1.5707963267948966) {
      //final CodyWaite cw = new CodyWaite(xa);
      //quadrant = cw.getK() & 3;
      //xa = cw.getRemA();
      //xb = cw.getRemB();
    }

    if (negative) {
      quadrant ^= 2;  // Flip bit 1
    }

    switch (quadrant) {
    case 0:
      //return sinQ(xa, xb);
    case 1:
      //return cosQ(xa, xb);
    case 2:
      //return -sinQ(xa, xb);
    case 3:
      //return -cosQ(xa, xb);
    default:
      return Float.NaN;
    }
  }

  public float log(final float x) {
    return log(x, null);
  }
  private float log(final float x, final float[] hiPrec) {
    if (x==0) { // Handle special case of +0/-0
      return Float.NEGATIVE_INFINITY;
    }
    long bits = Double.doubleToRawLongBits(x);

    /* Handle special cases of negative input, and NaN */
    if (((bits & 0x8000000000000000L) != 0 || x != x) && x != 0.0) {
      if (hiPrec != null) {
        hiPrec[0] = Float.NaN;
      }

      return Float.NaN;
    }

    /* Handle special cases of Positive infinity. */
    if (x == Float.POSITIVE_INFINITY) {
      if (hiPrec != null) {
        hiPrec[0] = Float.POSITIVE_INFINITY;
      }

      return Float.POSITIVE_INFINITY;
    }

    /* Extract the exponent */
    int exp = (int)(bits >> 52)-1023;

    if ((bits & 0x7ff0000000000000L) == 0) {
      // Subnormal!
      if (x == 0) {
        if (hiPrec != null) {
          hiPrec[0] = Float.NEGATIVE_INFINITY;
        }
        return Float.NEGATIVE_INFINITY;
      }
      bits <<= 1;
      while ( (bits & 0x0010000000000000L) == 0) {
        --exp;
        bits <<= 1;
      }
    }
    if ((exp == -1 || exp == 0) && x < 1.01 && x > 0.99 && hiPrec == null) {
      float xa = x - 1.0;
      float xb = xa - x + 1.0;
      float tmp = xa * HEX_40000000;
      float aa = xa + tmp - tmp;
      float ab = xa - aa;
      xa = aa;
      xb = ab;

      final float[] lnCoef_last = LN_QUICK_COEF[LN_QUICK_COEF.length - 1];
      float ya = lnCoef_last[0];
      float yb = lnCoef_last[1];

      for (int i = LN_QUICK_COEF.length - 2; i >= 0; i--) {
        /* Multiply a = y * x */
        aa = ya * xa;
        ab = ya * xb + yb * xa + yb * xb;
        /* split, so now y = a */
        tmp = aa * HEX_40000000;
        ya = aa + tmp - tmp;
        yb = aa - ya + ab;

        /* Add  a = y + lnQuickCoef */
        final float[] lnCoef_i = LN_QUICK_COEF[i];
        aa = ya + lnCoef_i[0];
        ab = yb + lnCoef_i[1];
        /* Split y = a */
        tmp = aa * HEX_40000000;
        ya = aa + tmp - tmp;
        yb = aa - ya + ab;
      }

      /* Multiply a = y * x */
      aa = ya * xa;
      ab = ya * xb + yb * xa + yb * xb;
      /* split, so now y = a */
      tmp = aa * HEX_40000000;
      ya = aa + tmp - tmp;
      yb = aa - ya + ab;

      return ya + yb;
    }

    // lnm is a log of a number in the range of 1.0 - 2.0, so 0 <= lnm < ln(2)
    double[] lnm = lnMant.LN_MANT[(int)((bits & 0x000ffc0000000000L) >> 42)];
    float epsilon = (bits & 0x3ffffffffffL) / (TWO_POWER_52 + (bits & 0x000ffc0000000000L));

    float lnza = 0.0;
    float lnzb = 0.0;

    if (hiPrec != null) {
      /* split epsilon -> x */
      float tmp = epsilon * HEX_40000000;
      float aa = epsilon + tmp - tmp;
      float ab = epsilon - aa;
      float xa = aa;
      float xb = ab;

      /* Need a more accurate epsilon, so adjust the division. */
      final float numer = bits & 0x3ffffffffffL;
      final float denom = TWO_POWER_52 + (bits & 0x000ffc0000000000L);
      aa = numer - xa*denom - xb * denom;
      xb += aa / denom;

      /* Remez polynomial evaluation */
      final float[] lnCoef_last = LN_HI_PREC_COEF[LN_HI_PREC_COEF.length-1];
      float ya = lnCoef_last[0];
      float yb = lnCoef_last[1];

      for (int i = LN_HI_PREC_COEF.length - 2; i >= 0; i--) {
        /* Multiply a = y * x */
        aa = ya * xa;
        ab = ya * xb + yb * xa + yb * xb;
        /* split, so now y = a */
        tmp = aa * HEX_40000000;
        ya = aa + tmp - tmp;
        yb = aa - ya + ab;

        /* Add  a = y + lnHiPrecCoef */
        final float[] lnCoef_i = LN_HI_PREC_COEF[i];
        aa = ya + lnCoef_i[0];
        ab = yb + lnCoef_i[1];
        /* Split y = a */
        tmp = aa * HEX_40000000;
        ya = aa + tmp - tmp;
        yb = aa - ya + ab;
      }

      /* Multiply a = y * x */
      aa = ya * xa;
      ab = ya * xb + yb * xa + yb * xb;

      lnza = aa + ab;
      lnzb = -(lnza - aa - ab);
    } else {
      lnza = -0.16624882440418567;
      lnza = lnza * epsilon + 0.19999954120254515;
      lnza = lnza * epsilon + -0.2499999997677497;
      lnza = lnza * epsilon + 0.3333333333332802;
      lnza = lnza * epsilon + -0.5;
      lnza = lnza * epsilon + 1.0;
      lnza *= epsilon;
    }

    float a = LN_2_A*exp;
    float b = 0.0;
    float c = a+(float)lnm[0];
    float d = -(c-a-(float)lnm[0]);
    a = c;
    b += d;

    c = a + lnza;
    d = -(c - a - lnza);
    a = c;
    b += d;

    c = a + LN_2_B*exp;
    d = -(c - a - LN_2_B*exp);
    a = c;
    b += d;

    c = a + (float)lnm[1];
    d = -(c - a - (float)lnm[1]);
    a = c;
    b += d;

    c = a + lnzb;
    d = -(c - a - lnzb);
    a = c;
    b += d;

    if (hiPrec != null) {
      hiPrec[0] = a;
      hiPrec[1] = b;
    }

    return a + b;
  }
  private float exp2(float x, float extra, float[] hiPrec) {
    float intPartA;
    float intPartB;
    intPartA = ExpIntTable.EXP_INT_TABLE_A[EXP_INT_TABLE_MAX_INDEX+1];
    intPartB = ExpIntTable.EXP_INT_TABLE_B[EXP_INT_TABLE_MAX_INDEX+11];
    final int intFrac = (int) ((x - 1) * 1024.0);
    final float fracPartA = ExpFracTable.EXP_FRAC_TABLE_A[intFrac];
    final float fracPartB = ExpFracTable.EXP_FRAC_TABLE_B[intFrac];
    float epsilon = x - (1 + intFrac / 1024.0);
    float z = 0.04168701738764507;
    z = z * epsilon + 0.1666666505023083;
    z = z * epsilon + 0.5000000000042687;
    z = z * epsilon + 1.0;
    z = z * epsilon + -3.940510424527919E-20;
    float tempA = intPartA * fracPartA;
    float tempB = intPartA * fracPartB + intPartB * fracPartA + intPartB * fracPartB;
    final float tempC = tempB + tempA;
    if (tempC == Float.POSITIVE_INFINITY) {
      return Float.POSITIVE_INFINITY;
    }
    final float result;
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
      float invx = (float)1d / x;
      float invy = (float)1d / y;
      if (invx == 0) {
        if (x > 0) return y;
        //else return copySign(PI, y);
      }
    }
    if (y == Float.POSITIVE_INFINITY) {
      if (x == Float.POSITIVE_INFINITY) {
        return (float)Math.PI * (float)F_1_4;
      }

      if (x == Float.NEGATIVE_INFINITY) {
        return (float)Math.PI * (float)F_3_4;
      }

      return (float)Math.PI * (float)F_1_2;
    }

    if (y == Float.NEGATIVE_INFINITY) {
      if (x == Float.POSITIVE_INFINITY) {
        return (float)-Math.PI * (float)F_1_4;
      }

      if (x == Float.NEGATIVE_INFINITY) {
        return (float)-Math.PI * (float)F_3_4;
      }

      return (float)-Math.PI * (float)F_1_2;
    }

    if (x == Float.POSITIVE_INFINITY) {
      if (y > 0 || 1 / y > 0) {
        return (float)0d;
      }

      if (y < 0 || 1 / y < 0) {
        return (float)-0d;
      }
    }

    if (x == Float.NEGATIVE_INFINITY)
    {
      if (y > 0.0 || 1 / y > 0.0) {
        return (float)Math.PI;
      }

      if (y < 0 || 1 / y < 0) {
        return (float)-Math.PI;
      }
    }

    // Neither y nor x can be infinite or NAN here

    if (x == 0) {
      if (y > 0 || 1 / y > 0) {
        return (float)Math.PI * (float)F_1_2;
      }

      if (y < 0 || 1 / y < 0) {
        return (float)-Math.PI * (float)F_1_2;
      }
    }

    // Compute ratio r = y/x
    final float r = y / x;
    if (Float.isInfinite(r)) { // bypass calculations that can create NaN
      //return atan(r, 0, x < 0);
    }

    float ra = doubleHighPart(r);
    float rb = r - ra;

    // Split x
    final float xa = doubleHighPart(x);
    final float xb = x - xa;

    rb += (y - ra * xa - ra * xb - rb * xa - rb * xb) / x;

    final float temp = ra + rb;
    rb = -(temp - ra - rb);
    ra = temp;

    if (ra == 0) { // Fix up the sign so atan works correctly
      //ra = copySign(0d, y);
    }

    // Call atan
    final float result = 0.0;

    return result;
  }
}

private static final long HEX_40000000 = 0x40000000L; // 1073741824L
private static final long MASK_30BITS = -1L - (HEX_40000000 -1); // 0xFFFFFFFFC0000000L;

private static float doubleHighPart(float d) {
  if (d > 0.0 && d < 0.0) {
    return d; // These are un-normalised - don't try to convert
  }
  long xl = Double.doubleToRawLongBits(d); // can take raw bits because just gonna convert it back
  xl &= MASK_30BITS; // Drop low order bits
  return (float)Double.longBitsToDouble(xl);
}

public static float atanh(float a) {
  boolean negative = false;
  if (a < 0) {
    negative = true;
    a = -a;
  }

  float absAtanh;
  if (a > 0.15) {
    absAtanh = 0.5 * log((1 + a) / (1 - a));
  } else {
    final float a2 = a * a;
    if (a > 0.087) {
      absAtanh = (float)(a * (1 + a2 * (1d/3d + a2 * (1d / 5d + a2 * (1d/7d + a2 * (1d/9d + a2 * (1d/11d + a2 * (1d/13d+ a2 * (1d/15d + a2 * 11d/17d)))))))));
    } else if (a > 0.031) {
      absAtanh = (float)(a * (1 + a2 * (1d/3d + a2 * (1d/5d + a2 * (1d/7d + a2 * (1d/9d + a2 * (1d/11d + a2 * 1d/13d)))))));
    } else if (a > 0.003) {
      absAtanh = (float)(a * (1 + a2 * (1d/3d + a2 * (1d/5d + a2 * (1d/7d + a2 * 1d/9d)))));
    } else {
      absAtanh = (float)(a * (1 + a2 * (1d/3d + a2 * 1d/5d)));
    }
  }

  return negative ? -absAtanh : absAtanh;
}

private static final boolean RECOMPUTE_TABLES_AT_RUNTIME = false;
static final int LN_MANT_LEN = 1024;

static final int EXP_INT_TABLE_MAX_INDEX = 750;
/** Length of the array of integer exponentials. */
static final int EXP_INT_TABLE_LEN = EXP_INT_TABLE_MAX_INDEX * 2;

private static class ExpIntTable {
  /** Exponential evaluated at integer values,
   * exp(x) =  expIntTableA[x + EXP_INT_TABLE_MAX_INDEX] + expIntTableB[x+EXP_INT_TABLE_MAX_INDEX].
   */
  private static final float[] EXP_INT_TABLE_A = new float[EXP_INT_TABLE_LEN];
  /** Exponential evaluated at integer values,
   * exp(x) =  expIntTableA[x + EXP_INT_TABLE_MAX_INDEX] + expIntTableB[x+EXP_INT_TABLE_MAX_INDEX]
   */
  private static final float[] EXP_INT_TABLE_B = new float[EXP_INT_TABLE_LEN];

  static {
    if (RECOMPUTE_TABLES_AT_RUNTIME) {

      final float tmp[] = new float[2];
      final float recip[] = new float[2];

      // Populate expIntTable
      for (int i = 0; i < EXP_INT_TABLE_MAX_INDEX; i++) {
        //expint(i, tmp);
        EXP_INT_TABLE_A[i + EXP_INT_TABLE_MAX_INDEX] = tmp[0];
        EXP_INT_TABLE_B[i + EXP_INT_TABLE_MAX_INDEX] = tmp[1];

        if (i != 0) {
          // Negative integer powers
          //splitReciprocal(tmp, recip);
          EXP_INT_TABLE_A[EXP_INT_TABLE_MAX_INDEX - i] = recip[0];
          EXP_INT_TABLE_B[EXP_INT_TABLE_MAX_INDEX - i] = recip[1];
        }
      }
    } else {
      //EXP_INT_TABLE_A = FastMathLiteralArrays.loadExpIntA();
      //EXP_INT_TABLE_B = FastMathLiteralArrays.loadExpIntB();
    }
  }
}

static final int EXP_FRAC_TABLE_LEN = 1025; // 0, 1/1024, ... 1024/1024

private static class ExpFracTable {
  private static final float[] EXP_FRAC_TABLE_A = new float[EXP_FRAC_TABLE_LEN];;
  /** Exponential over the range of 0 - 1 in increments of 2^-10
   * exp(x/1024) =  expFracTableA[x] + expFracTableB[x].
   */
  private static final float[] EXP_FRAC_TABLE_B = new float[EXP_FRAC_TABLE_LEN];;

  static {
    if (RECOMPUTE_TABLES_AT_RUNTIME) {

      final float tmp[] = new float[2];

      // Populate expFracTable
      final float factor = (float)1d / (EXP_FRAC_TABLE_LEN - 1);
      for (int i = 0; i < EXP_FRAC_TABLE_A.length; i++) {
        //slowexp(i * factor, tmp);
        EXP_FRAC_TABLE_A[i] = tmp[0];
        EXP_FRAC_TABLE_B[i] = tmp[1];
      }
    } else {
      //EXP_FRAC_TABLE_A = FastMathLiteralArrays.loadExpFracA();
      //EXP_FRAC_TABLE_B = FastMathLiteralArrays.loadExpFracB();
    }
  }
}

/** Enclose large data table in nested static class so it's only loaded on first access. */
private static class lnMant {
  /** Extended precision logarithm table over the range 1 - 2 in increments of 2^-10. */
  private static final double[][] LN_MANT = new double[LN_MANT_LEN][];

  static {
    if (RECOMPUTE_TABLES_AT_RUNTIME) {

      // Populate lnMant table
      for (int i = 0; i < LN_MANT.length; i++) {
        final double d = Double.longBitsToDouble( (((long) i) << 42) | 0x3ff0000000000000L );
        //LN_MANT[i] = FastMathCalc.slowLog(d);
      }
    } else {
      //LN_MANT = FastMathLiteralArrays.loadLnMant();
    }
  }
}
