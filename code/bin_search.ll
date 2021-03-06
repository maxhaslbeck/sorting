; Generated by Isabelle/LLVM-shallow
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"






define i64 @bin_search({ i64, i64* } %x, i64 %x1) {

  start:
    %a1 = extractvalue { i64, i64* } %x, 0
    %a2 = extractvalue { i64, i64* } %x, 1
    %xa = insertvalue { i64, i64 } zeroinitializer, i64 0, 0
    %xb = insertvalue { i64, i64 } %xa, i64 %a1, 1
    br label %while_start

  while_start:
    %xaa = phi { i64, i64 } [ %x6, %ctd_if ], [ %xb, %start ]
    %a = extractvalue { i64, i64 } %xaa, 0
    %x2 = extractvalue { i64, i64 } %xaa, 1
    %x3 = icmp slt i64 %a, %x2
    br i1 %x3, label %while_body, label %while_end

  while_body:
    %a1a = extractvalue { i64, i64 } %xaa, 0
    %a2a = extractvalue { i64, i64 } %xaa, 1
    %xba = sub i64 %a2a, %a1a
    %xca = udiv i64 %xba, 2
    %xd = add i64 %a1a, %xca
    %a1b = extractvalue { i64, i64* } %x, 0
    %a2b = extractvalue { i64, i64* } %x, 1
    %xe = getelementptr i64, i64* %a2b, i64 %xd
    %xf = load i64, i64* %xe
    %xg = icmp slt i64 %xf, %x1
    br i1 %xg, label %then, label %else

  then:
    %xha = add i64 %xd, 1
    %xi = insertvalue { i64, i64 } zeroinitializer, i64 %xha, 0
    %x4 = insertvalue { i64, i64 } %xi, i64 %a2a, 1
    br label %ctd_if

  else:
    %xh = insertvalue { i64, i64 } zeroinitializer, i64 %a1a, 0
    %x5 = insertvalue { i64, i64 } %xh, i64 %xd, 1
    br label %ctd_if

  ctd_if:
    %x6 = phi { i64, i64 } [ %x5, %else ], [ %x4, %then ]
    br label %while_start

  while_end:
    %a1a1 = extractvalue { i64, i64 } %xaa, 0
    %a2a1 = extractvalue { i64, i64 } %xaa, 1
    ret i64 %a1a1
}
