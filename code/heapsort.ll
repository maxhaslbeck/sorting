; Generated by Isabelle/LLVM-shallow
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"






define i64* @Proto_IICF_EOArray_swap_eo_impl(i64* %x, i64 %x1, i64 %x2) {

  start:
    %x3 = getelementptr i64, i64* %x, i64 %x1
    %r = load i64, i64* %x3
    %xa = insertvalue { i64, i64* } zeroinitializer, i64 %r, 0
    %xb = insertvalue { i64, i64* } %xa, i64* %x, 1
    %a1 = extractvalue { i64, i64* } %xb, 0
    %a2 = extractvalue { i64, i64* } %xb, 1
    %xc = getelementptr i64, i64* %a2, i64 %x2
    %ra = load i64, i64* %xc
    %xd = insertvalue { i64, i64* } zeroinitializer, i64 %ra, 0
    %xe = insertvalue { i64, i64* } %xd, i64* %a2, 1
    %a1a = extractvalue { i64, i64* } %xe, 0
    %a2a = extractvalue { i64, i64* } %xe, 1
    %p = getelementptr i64, i64* %a2a, i64 %x1
    store i64 %a1a, i64* %p
    %pa = getelementptr i64, i64* %a2a, i64 %x2
    store i64 %a1, i64* %pa
    ret i64* %a2a
}

define i64* @heapsort(i64* %x, i64 %x1, i64 %x2) {

  start:
    %x3 = sub i64 %x2, %x1
    %xa = icmp slt i64 1, %x3
    br i1 %xa, label %then, label %else

  then:
    %xb = call i64* @Sorting_Heapsort_heapsort_interp_heapify_btu_impl (i64 %x1, i64 %x2, i64* %x)
    %xc = insertvalue { i64*, i64 } zeroinitializer, i64* %xb, 0
    %xd = insertvalue { i64*, i64 } %xc, i64 %x2, 1
    br label %while_start

  while_start:
    %xca = phi { i64*, i64 } [ %x5, %while_body ], [ %xd, %then ]
    %a1 = extractvalue { i64*, i64 } %xca, 0
    %a2 = extractvalue { i64*, i64 } %xca, 1
    %xda = add i64 %x1, 1
    %x4 = icmp slt i64 %xda, %a2
    br i1 %x4, label %while_body, label %while_end

  while_body:
    %a11 = extractvalue { i64*, i64 } %xca, 0
    %a21 = extractvalue { i64*, i64 } %xca, 1
    %xda1 = sub i64 %a21, 1
    %xea = call i64* @Proto_IICF_EOArray_swap_eo_impl (i64* %a11, i64 %x1, i64 %xda1)
    %xfa = sub i64 %a21, 1
    %xg = call i64* @Sorting_Heapsort_heapsort_interp_sift_down_impl (i64 %x1, i64 %xfa, i64 %x1, i64* %xea)
    %xha = sub i64 %a21, 1
    %xi = insertvalue { i64*, i64 } zeroinitializer, i64* %xg, 0
    %x5 = insertvalue { i64*, i64 } %xi, i64 %xha, 1
    br label %while_start

  while_end:
    %a12 = extractvalue { i64*, i64 } %xca, 0
    %a22 = extractvalue { i64*, i64 } %xca, 1
    br label %ctd_if

  else:
    br label %ctd_if

  ctd_if:
    %x6 = phi i64* [ %x, %else ], [ %a12, %while_end ]
    ret i64* %x6
}

define i64* @Sorting_Heapsort_heapsort_interp_sift_down_impl(i64 %x, i64 %x1, i64 %x2, i64* %x3) {

  start:
    %x4 = sub i64 %x2, %x
    %xa = add i64 %x, %x4
    %xb = getelementptr i64, i64* %x3, i64 %xa
    %r = load i64, i64* %xb
    %xc = insertvalue { i64, i64* } zeroinitializer, i64 %r, 0
    %xd = insertvalue { i64, i64* } %xc, i64* %x3, 1
    %a1 = extractvalue { i64, i64* } %xd, 0
    %a2 = extractvalue { i64, i64* } %xd, 1
    %xe = insertvalue { i64, i1 } zeroinitializer, i64 %x4, 0
    %tmpb = insertvalue { i64, i1 } %xe, i1 1, 1
    %xf = insertvalue { i64*, { i64, i1 } } zeroinitializer, i64* %a2, 0
    %xg = insertvalue { i64*, { i64, i1 } } %xf, { i64, i1 } %tmpb, 1
    br label %while_start

  while_start:
    %xea = phi { i64*, { i64, i1 } } [ %x16, %ctd_if ], [ %xg, %start ]
    %a1a = extractvalue { i64*, { i64, i1 } } %xea, 0
    %xfa = extractvalue { i64*, { i64, i1 } } %xea, 1
    %a1b = extractvalue { i64, i1 } %xfa, 0
    %a2b = extractvalue { i64, i1 } %xfa, 1
    %xga = sub i64 %x1, %x
    %xha = sub i64 %xga, 1
    %xia = udiv i64 %xha, 2
    %xj = icmp slt i64 %a1b, %xia
    %x5 = and i1 %xj, %a2b
    br i1 %x5, label %while_body, label %while_end

  while_body:
    %a1a1 = extractvalue { i64*, { i64, i1 } } %xea, 0
    %xfa1 = extractvalue { i64*, { i64, i1 } } %xea, 1
    %a1b1 = extractvalue { i64, i1 } %xfa1, 0
    %a2b1 = extractvalue { i64, i1 } %xfa1, 1
    %xga1 = mul i64 2, %a1b1
    %xha1 = add i64 %xga1, 1
    %xi = mul i64 2, %a1b1
    %xja = add i64 %xi, 2
    %xk = add i64 %x, %xha1
    %xl = add i64 %x, %xja
    %xm = getelementptr i64, i64* %a1a1, i64 %xk
    %ra = load i64, i64* %xm
    %xn = insertvalue { i64, i64* } zeroinitializer, i64 %ra, 0
    %xo = insertvalue { i64, i64* } %xn, i64* %a1a1, 1
    %a1c = extractvalue { i64, i64* } %xo, 0
    %a2a = extractvalue { i64, i64* } %xo, 1
    %xp = getelementptr i64, i64* %a2a, i64 %xl
    %rb = load i64, i64* %xp
    %xq = insertvalue { i64, i64* } zeroinitializer, i64 %rb, 0
    %xr = insertvalue { i64, i64* } %xq, i64* %a2a, 1
    %a1aa = extractvalue { i64, i64* } %xr, 0
    %a2aa = extractvalue { i64, i64* } %xr, 1
    %xs = icmp ult i64 %a1c, %a1aa
    %p = getelementptr i64, i64* %a2aa, i64 %xk
    store i64 %a1c, i64* %p
    %pa = getelementptr i64, i64* %a2aa, i64 %xl
    store i64 %a1aa, i64* %pa
    br i1 %xs, label %then, label %else

  then:
    %xw = add i64 %x, %xja
    %xx = getelementptr i64, i64* %a1a1, i64 %xw
    %rc = load i64, i64* %xx
    %xy = insertvalue { i64, i64* } zeroinitializer, i64 %rc, 0
    %xz = insertvalue { i64, i64* } %xy, i64* %a1a1, 1
    %a1d = extractvalue { i64, i64* } %xz, 0
    %a2c = extractvalue { i64, i64* } %xz, 1
    %ya = icmp ult i64 %a1, %a1d
    %pb = getelementptr i64, i64* %a2c, i64 %xw
    store i64 %a1d, i64* %pb
    br i1 %ya, label %thena, label %elsea

  thena:
    %yd = add i64 %x, %xja
    %ye = getelementptr i64, i64* %a1a1, i64 %yd
    %rd = load i64, i64* %ye
    %yf = insertvalue { i64, i64* } zeroinitializer, i64 %rd, 0
    %yg = insertvalue { i64, i64* } %yf, i64* %a1a1, 1
    %a1ca = extractvalue { i64, i64* } %yg, 0
    %a2ca = extractvalue { i64, i64* } %yg, 1
    %yh = add i64 %x, %a1b1
    %pc = getelementptr i64, i64* %a2ca, i64 %yh
    store i64 %a1ca, i64* %pc
    %yj = insertvalue { i64*, { i64, i1 } } zeroinitializer, i64* %a2ca, 0
    %yk = insertvalue { i64, i1 } zeroinitializer, i64 %xja, 0
    %x6 = insertvalue { i64, i1 } %yk, i1 1, 1
    %x7 = insertvalue { i64*, { i64, i1 } } %yj, { i64, i1 } %x6, 1
    br label %ctd_ifa

  elsea:
    %yd1 = insertvalue { i64*, { i64, i1 } } zeroinitializer, i64* %a1a1, 0
    %ye1 = insertvalue { i64, i1 } zeroinitializer, i64 %a1b1, 0
    %x8 = insertvalue { i64, i1 } %ye1, i1 0, 1
    %x9 = insertvalue { i64*, { i64, i1 } } %yd1, { i64, i1 } %x8, 1
    br label %ctd_ifa

  ctd_ifa:
    %x10 = phi { i64*, { i64, i1 } } [ %x9, %elsea ], [ %x7, %thena ]
    br label %ctd_if

  else:
    %xw1 = add i64 %x, %xha1
    %xx1 = getelementptr i64, i64* %a1a1, i64 %xw1
    %rc1 = load i64, i64* %xx1
    %xy1 = insertvalue { i64, i64* } zeroinitializer, i64 %rc1, 0
    %xz1 = insertvalue { i64, i64* } %xy1, i64* %a1a1, 1
    %a1d1 = extractvalue { i64, i64* } %xz1, 0
    %a2c1 = extractvalue { i64, i64* } %xz1, 1
    %ya1 = icmp ult i64 %a1, %a1d1
    %pb1 = getelementptr i64, i64* %a2c1, i64 %xw1
    store i64 %a1d1, i64* %pb1
    br i1 %ya1, label %thenb, label %elseb

  thenb:
    %yd2 = add i64 %x, %xha1
    %ye2 = getelementptr i64, i64* %a1a1, i64 %yd2
    %rd1 = load i64, i64* %ye2
    %yf1 = insertvalue { i64, i64* } zeroinitializer, i64 %rd1, 0
    %yg1 = insertvalue { i64, i64* } %yf1, i64* %a1a1, 1
    %a1ca1 = extractvalue { i64, i64* } %yg1, 0
    %a2ca1 = extractvalue { i64, i64* } %yg1, 1
    %yh1 = add i64 %x, %a1b1
    %pc1 = getelementptr i64, i64* %a2ca1, i64 %yh1
    store i64 %a1ca1, i64* %pc1
    %yj1 = insertvalue { i64*, { i64, i1 } } zeroinitializer, i64* %a2ca1, 0
    %yk1 = insertvalue { i64, i1 } zeroinitializer, i64 %xha1, 0
    %x11 = insertvalue { i64, i1 } %yk1, i1 1, 1
    %x12 = insertvalue { i64*, { i64, i1 } } %yj1, { i64, i1 } %x11, 1
    br label %ctd_ifb

  elseb:
    %yd3 = insertvalue { i64*, { i64, i1 } } zeroinitializer, i64* %a1a1, 0
    %ye3 = insertvalue { i64, i1 } zeroinitializer, i64 %a1b1, 0
    %x13 = insertvalue { i64, i1 } %ye3, i1 0, 1
    %x14 = insertvalue { i64*, { i64, i1 } } %yd3, { i64, i1 } %x13, 1
    br label %ctd_ifb

  ctd_ifb:
    %x15 = phi { i64*, { i64, i1 } } [ %x14, %elseb ], [ %x12, %thenb ]
    br label %ctd_if

  ctd_if:
    %x16 = phi { i64*, { i64, i1 } } [ %x15, %ctd_ifb ], [ %x10, %ctd_ifa ]
    br label %while_start

  while_end:
    %a1a2 = extractvalue { i64*, { i64, i1 } } %xea, 0
    %xfa2 = extractvalue { i64*, { i64, i1 } } %xea, 1
    %a1b2 = extractvalue { i64, i1 } %xfa2, 0
    %a2b2 = extractvalue { i64, i1 } %xfa2, 1
    %xga2 = sub i64 %x1, %x
    %xha2 = udiv i64 %xga2, 2
    %xi1 = icmp slt i64 %a1b2, %xha2
    br i1 %xi1, label %thenc, label %elsec

  thenc:
    %xj1 = mul i64 2, %a1b2
    %xka = add i64 %xj1, 1
    %xl1 = add i64 %x, %xka
    %xm1 = getelementptr i64, i64* %a1a2, i64 %xl1
    %ra1 = load i64, i64* %xm1
    %xn1 = insertvalue { i64, i64* } zeroinitializer, i64 %ra1, 0
    %xo1 = insertvalue { i64, i64* } %xn1, i64* %a1a2, 1
    %a1c1 = extractvalue { i64, i64* } %xo1, 0
    %a2a1 = extractvalue { i64, i64* } %xo1, 1
    %xp1 = icmp ult i64 %a1, %a1c1
    %p1 = getelementptr i64, i64* %a2a1, i64 %xl1
    store i64 %a1c1, i64* %p1
    br i1 %xp1, label %thend, label %elsed

  thend:
    %xs1 = add i64 %x, %xka
    %xt = getelementptr i64, i64* %a1a2, i64 %xs1
    %rb1 = load i64, i64* %xt
    %xu = insertvalue { i64, i64* } zeroinitializer, i64 %rb1, 0
    %xv = insertvalue { i64, i64* } %xu, i64* %a1a2, 1
    %a1ca2 = extractvalue { i64, i64* } %xv, 0
    %a2c2 = extractvalue { i64, i64* } %xv, 1
    %xw2 = add i64 %x, %a1b2
    %pa1 = getelementptr i64, i64* %a2c2, i64 %xw2
    store i64 %a1ca2, i64* %pa1
    %xy2 = add i64 %x, %xka
    %pb2 = getelementptr i64, i64* %a2c2, i64 %xy2
    store i64 %a1, i64* %pb2
    br label %ctd_ifd

  elsed:
    %xs2 = add i64 %x, %a1b2
    %pa2 = getelementptr i64, i64* %a1a2, i64 %xs2
    store i64 %a1, i64* %pa2
    br label %ctd_ifd

  ctd_ifd:
    %x17 = phi i64* [ %a1a2, %elsed ], [ %a2c2, %thend ]
    br label %ctd_ifc

  elsec:
    %xj2 = add i64 %x, %a1b2
    %p2 = getelementptr i64, i64* %a1a2, i64 %xj2
    store i64 %a1, i64* %p2
    br label %ctd_ifc

  ctd_ifc:
    %x18 = phi i64* [ %a1a2, %elsec ], [ %x17, %ctd_ifd ]
    ret i64* %x18
}

define i64* @Sorting_Heapsort_heapsort_interp_heapify_btu_impl(i64 %x, i64 %x1, i64* %x2) {

  start:
    %xa = sub i64 %x1, 1
    %xb = insertvalue { i64*, i64 } zeroinitializer, i64* %x2, 0
    %xc = insertvalue { i64*, i64 } %xb, i64 %xa, 1
    br label %while_start

  while_start:
    %xaa = phi { i64*, i64 } [ %x5, %while_body ], [ %xc, %start ]
    %a1 = extractvalue { i64*, i64 } %xaa, 0
    %x3 = extractvalue { i64*, i64 } %xaa, 1
    %x4 = icmp slt i64 %x, %x3
    br i1 %x4, label %while_body, label %while_end

  while_body:
    %a11 = extractvalue { i64*, i64 } %xaa, 0
    %a2 = extractvalue { i64*, i64 } %xaa, 1
    %xba = sub i64 %a2, 1
    %xca = call i64* @Sorting_Heapsort_heapsort_interp_sift_down_impl (i64 %x, i64 %x1, i64 %xba, i64* %a11)
    %xda = insertvalue { i64*, i64 } zeroinitializer, i64* %xca, 0
    %x5 = insertvalue { i64*, i64 } %xda, i64 %xba, 1
    br label %while_start

  while_end:
    %a12 = extractvalue { i64*, i64 } %xaa, 0
    %a21 = extractvalue { i64*, i64 } %xaa, 1
    ret i64* %a12
}
