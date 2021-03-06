; Generated by Isabelle/LLVM-shallow
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"






define i64 @exp64(i64 %r) {

  start:
    %x = insertvalue { i64, i64 } zeroinitializer, i64 1, 0
    %xa = insertvalue { i64, i64 } %x, i64 %r, 1
    br label %while_start

  while_start:
    %xb = phi { i64, i64 } [ %x4, %while_body ], [ %xa, %start ]
    %a = extractvalue { i64, i64 } %xb, 0
    %x1 = extractvalue { i64, i64 } %xb, 1
    %x2 = icmp ult i64 0, %x1
    br i1 %x2, label %while_body, label %while_end

  while_body:
    %a1 = extractvalue { i64, i64 } %xb, 0
    %r1 = extractvalue { i64, i64 } %xb, 1
    %xd = mul i64 %a1, 2
    %xaa = insertvalue { i64, i64 } zeroinitializer, i64 %xd, 0
    %x3 = sub i64 %r1, 1
    %x4 = insertvalue { i64, i64 } %xaa, i64 %x3, 1
    br label %while_start

  while_end:
    %a2 = extractvalue { i64, i64 } %xb, 0
    %r2 = extractvalue { i64, i64 } %xb, 1
    ret i64 %a2
}

define i32 @exp32(i32 %r) {

  start:
    %x = insertvalue { i32, i32 } zeroinitializer, i32 1, 0
    %xa = insertvalue { i32, i32 } %x, i32 %r, 1
    br label %while_start

  while_start:
    %xb = phi { i32, i32 } [ %x4, %while_body ], [ %xa, %start ]
    %a = extractvalue { i32, i32 } %xb, 0
    %x1 = extractvalue { i32, i32 } %xb, 1
    %x2 = icmp ult i32 0, %x1
    br i1 %x2, label %while_body, label %while_end

  while_body:
    %a1 = extractvalue { i32, i32 } %xb, 0
    %r1 = extractvalue { i32, i32 } %xb, 1
    %xd = mul i32 %a1, 2
    %xaa = insertvalue { i32, i32 } zeroinitializer, i32 %xd, 0
    %x3 = sub i32 %r1, 1
    %x4 = insertvalue { i32, i32 } %xaa, i32 %x3, 1
    br label %while_start

  while_end:
    %a2 = extractvalue { i32, i32 } %xb, 0
    %r2 = extractvalue { i32, i32 } %xb, 1
    ret i32 %a2
}
