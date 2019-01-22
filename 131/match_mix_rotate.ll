; ModuleID = 'match_mix_rotate.3a1fbbbh-cgu.0'
source_filename = "match_mix_rotate.3a1fbbbh-cgu.0"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-darwin"

%"unwind::libunwind::_Unwind_Exception" = type { [0 x i64], i64, [0 x i64], void (i32, %"unwind::libunwind::_Unwind_Exception"*)*, [0 x i64], [6 x i64], [0 x i64] }
%"unwind::libunwind::_Unwind_Context" = type { [0 x i8] }

; match_mix_rotate::match_mix_4
; Function Attrs: nounwind readonly uwtable
define i64 @fun([0 x i8]* noalias nonnull readonly %s.0, i64 %s.1) unnamed_addr #0 personality i32 (i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*)* @rust_eh_personality {
start:
  %0 = getelementptr inbounds [0 x i8], [0 x i8]* %s.0, i64 0, i64 %s.1
  %1 = ptrtoint [0 x i8]* %s.0 to i64
  %2 = ptrtoint i8* %0 to i64
  br label %bb6

bb4:                                              ; preds = %bb14
  ret i64 %out.1.lcssa

bb6:                                              ; preds = %bb14, %start
  %out.062 = phi i64 [ 0, %start ], [ %out.1.lcssa, %bb14 ]
  %iter.sroa.0.061 = phi i64 [ 0, %start ], [ %3, %bb14 ]
  %3 = add nuw nsw i64 %iter.sroa.0.061, 1
  %4 = and i64 %iter.sroa.0.061, 63
  %5 = sub nsw i64 0, %iter.sroa.0.061
  %6 = and i64 %5, 63
  br label %bb1.i

bb1.i:                                            ; preds = %bb6, %bb15
  %out.160 = phi i64 [ %out.062, %bb6 ], [ %24, %bb15 ]
  %iter2.sroa.14.059 = phi i64 [ 32, %bb6 ], [ %7, %bb15 ]
  %iter2.sroa.11.058 = phi i64 [ %iter.sroa.0.061, %bb6 ], [ 0, %bb15 ]
  %iter2.sroa.0.057 = phi i64 [ %1, %bb6 ], [ %iter2.sroa.0.1, %bb15 ]
  %7 = add nsw i64 %iter2.sroa.14.059, -1
  %8 = icmp eq i64 %iter2.sroa.11.058, 0
  br i1 %8, label %bb1.i.i, label %bb2.i.i

bb1.i.i:                                          ; preds = %bb1.i
  %9 = inttoptr i64 %iter2.sroa.0.057 to i8*
  %10 = icmp eq i8* %0, %9
  br i1 %10, label %bb14, label %bb9.i.i.i

bb9.i.i.i:                                        ; preds = %bb1.i.i
  %11 = getelementptr inbounds i8, i8* %9, i64 1
  br label %"_ZN76_$LT$core..iter..Take$LT$I$GT$$u20$as$u20$core..iter..iterator..Iterator$GT$4next17hc1ea69bfab43cf3eE.exit"

bb2.i.i:                                          ; preds = %bb1.i
  %12 = sub i64 %2, %iter2.sroa.0.057
  %13 = icmp ugt i64 %12, %iter2.sroa.11.058
  %14 = inttoptr i64 %iter2.sroa.0.057 to i8*
  br i1 %13, label %bb8.i.i.i, label %bb14

bb8.i.i.i:                                        ; preds = %bb2.i.i
  %15 = getelementptr inbounds i8, i8* %14, i64 %iter2.sroa.11.058
  %16 = add nuw nsw i64 %iter2.sroa.11.058, 1
  %17 = getelementptr inbounds i8, i8* %14, i64 %16
  br label %"_ZN76_$LT$core..iter..Take$LT$I$GT$$u20$as$u20$core..iter..iterator..Iterator$GT$4next17hc1ea69bfab43cf3eE.exit"

"_ZN76_$LT$core..iter..Take$LT$I$GT$$u20$as$u20$core..iter..iterator..Iterator$GT$4next17hc1ea69bfab43cf3eE.exit": ; preds = %bb9.i.i.i, %bb8.i.i.i
  %iter2.sroa.0.1.in = phi i8* [ %11, %bb9.i.i.i ], [ %17, %bb8.i.i.i ]
  %_0.0.i14 = phi i8* [ %9, %bb9.i.i.i ], [ %15, %bb8.i.i.i ]
  %18 = icmp eq i8* %_0.0.i14, null
  br i1 %18, label %bb14, label %bb15

bb14:                                             ; preds = %bb2.i.i, %bb1.i.i, %bb15, %"_ZN76_$LT$core..iter..Take$LT$I$GT$$u20$as$u20$core..iter..iterator..Iterator$GT$4next17hc1ea69bfab43cf3eE.exit"
  %out.1.lcssa = phi i64 [ %out.160, %bb2.i.i ], [ %out.160, %bb1.i.i ], [ %24, %bb15 ], [ %out.160, %"_ZN76_$LT$core..iter..Take$LT$I$GT$$u20$as$u20$core..iter..iterator..Iterator$GT$4next17hc1ea69bfab43cf3eE.exit" ]
  %exitcond = icmp eq i64 %3, 1000
  br i1 %exitcond, label %bb4, label %bb6

bb15:                                             ; preds = %"_ZN76_$LT$core..iter..Take$LT$I$GT$$u20$as$u20$core..iter..iterator..Iterator$GT$4next17hc1ea69bfab43cf3eE.exit"
  %iter2.sroa.0.1 = ptrtoint i8* %iter2.sroa.0.1.in to i64
  %19 = load i8, i8* %_0.0.i14, align 1
  %switch.tableidx = add i8 %19, -65
  %20 = icmp ult i8 %switch.tableidx, 4
  %switch.idx.cast = zext i8 %switch.tableidx to i64
  %switch.offset = add nuw nsw i64 %switch.idx.cast, 1
  %_0.0.i = select i1 %20, i64 %switch.offset, i64 0
  %21 = shl i64 %_0.0.i, %4
  %22 = lshr i64 %_0.0.i, %6
  %23 = or i64 %21, %22
  %24 = xor i64 %23, %out.160
  %25 = icmp eq i64 %7, 0
  br i1 %25, label %bb14, label %bb1.i
}

; Function Attrs: uwtable
declare i32 @rust_eh_personality(i32, i32, i64, %"unwind::libunwind::_Unwind_Exception"*, %"unwind::libunwind::_Unwind_Context"*) unnamed_addr #1

attributes #0 = { nounwind readonly uwtable "no-frame-pointer-elim"="true" "probe-stack"="__rust_probestack" }
attributes #1 = { uwtable "no-frame-pointer-elim"="true" "probe-stack"="__rust_probestack" "target-cpu"="core2" }
