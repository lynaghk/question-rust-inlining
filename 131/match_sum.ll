; ModuleID = 'match_sum.3a1fbbbh-cgu.0'
source_filename = "match_sum.3a1fbbbh-cgu.0"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-darwin"

; match_sum::match_sum_4
; Function Attrs: nounwind readonly uwtable
define i64 @fun([0 x i8]* noalias nonnull readonly %s.0, i64 %s.1) unnamed_addr #0 {
start:
  %0 = icmp eq i64 %s.1, 0
  br i1 %0, label %bb5, label %bb7.preheader

bb7.preheader:                                    ; preds = %start
  %1 = getelementptr inbounds [0 x i8], [0 x i8]* %s.0, i64 0, i64 0
  %xtraiter = and i64 %s.1, 1
  %2 = icmp eq i64 %s.1, 1
  br i1 %2, label %bb5.loopexit.unr-lcssa, label %bb7.preheader.new

bb7.preheader.new:                                ; preds = %bb7.preheader
  %unroll_iter = sub i64 %s.1, %xtraiter
  br label %bb7

bb5.loopexit.unr-lcssa:                           ; preds = %bb7, %bb7.preheader
  %.lcssa.ph = phi i64 [ undef, %bb7.preheader ], [ %13, %bb7 ]
  %sum.010.unr = phi i64 [ 0, %bb7.preheader ], [ %13, %bb7 ]
  %iter.sroa.0.09.unr = phi i8* [ %1, %bb7.preheader ], [ %10, %bb7 ]
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %bb5, label %bb7.epil

bb7.epil:                                         ; preds = %bb5.loopexit.unr-lcssa
  %3 = load i8, i8* %iter.sroa.0.09.unr, align 1
  %switch.tableidx.epil = add i8 %3, -65
  %4 = icmp ult i8 %switch.tableidx.epil, 4
  %switch.idx.cast.epil = zext i8 %switch.tableidx.epil to i64
  %switch.offset.epil = add nuw nsw i64 %switch.idx.cast.epil, 1
  %_0.0.i.epil = select i1 %4, i64 %switch.offset.epil, i64 0
  %5 = add i64 %_0.0.i.epil, %sum.010.unr
  br label %bb5

bb5:                                              ; preds = %bb7.epil, %bb5.loopexit.unr-lcssa, %start
  %sum.0.lcssa = phi i64 [ 0, %start ], [ %.lcssa.ph, %bb5.loopexit.unr-lcssa ], [ %5, %bb7.epil ]
  ret i64 %sum.0.lcssa

bb7:                                              ; preds = %bb7, %bb7.preheader.new
  %sum.010 = phi i64 [ 0, %bb7.preheader.new ], [ %13, %bb7 ]
  %iter.sroa.0.09 = phi i8* [ %1, %bb7.preheader.new ], [ %10, %bb7 ]
  %niter = phi i64 [ %unroll_iter, %bb7.preheader.new ], [ %niter.nsub.1, %bb7 ]
  %6 = getelementptr inbounds i8, i8* %iter.sroa.0.09, i64 1
  %7 = load i8, i8* %iter.sroa.0.09, align 1
  %switch.tableidx = add i8 %7, -65
  %8 = icmp ult i8 %switch.tableidx, 4
  %switch.idx.cast = zext i8 %switch.tableidx to i64
  %switch.offset = add nuw nsw i64 %switch.idx.cast, 1
  %_0.0.i = select i1 %8, i64 %switch.offset, i64 0
  %9 = add i64 %_0.0.i, %sum.010
  %10 = getelementptr inbounds i8, i8* %iter.sroa.0.09, i64 2
  %11 = load i8, i8* %6, align 1
  %switch.tableidx.1 = add i8 %11, -65
  %12 = icmp ult i8 %switch.tableidx.1, 4
  %switch.idx.cast.1 = zext i8 %switch.tableidx.1 to i64
  %switch.offset.1 = add nuw nsw i64 %switch.idx.cast.1, 1
  %_0.0.i.1 = select i1 %12, i64 %switch.offset.1, i64 0
  %13 = add i64 %_0.0.i.1, %9
  %niter.nsub.1 = add i64 %niter, -2
  %niter.ncmp.1 = icmp eq i64 %niter.nsub.1, 0
  br i1 %niter.ncmp.1, label %bb5.loopexit.unr-lcssa, label %bb7
}

attributes #0 = { nounwind readonly uwtable "no-frame-pointer-elim"="true" "probe-stack"="__rust_probestack" }
