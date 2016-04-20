; ModuleID = 'main/main.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.11.0"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str1 = private unnamed_addr constant [24 x i8] c"Starting everything!!!\0A\00", align 1
@.str2 = private unnamed_addr constant [17 x i8] c"time spent: %f \0A\00", align 1
@.str3 = private unnamed_addr constant [14 x i8] c"Seems good! \0A\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"%f\09\00", align 1
@.str5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str6 = private unnamed_addr constant [9 x i8] c"%d \09 %d\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"%d\09%d\09Time spent:  %f\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"%d\09%d\09%d\09Time Spent:  %f\0A\00", align 1
@.str9 = private unnamed_addr constant [32 x i8] c"The result is, however, right!\0A\00", align 1

; Function Attrs: nounwind ssp uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca float*, align 8
  %b = alloca float*, align 8
  %c = alloca float*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %begin = alloca i64, align 8
  %end = alloca i64, align 8
  %time_spent = alloca double, align 8
  store i32 0, i32* %1
  %2 = call i64 @"\01_clock"()
  store i64 %2, i64* %begin, align 8
  %3 = call i8* @malloc(i64 2400000000)
  %4 = bitcast i8* %3 to float*
  store float* %4, float** %a, align 8
  %5 = call i8* @malloc(i64 4800000000)
  %6 = bitcast i8* %5 to float*
  store float* %6, float** %b, align 8
  %7 = call i8* @malloc(i64 3200000000)
  %8 = bitcast i8* %7 to float*
  store float* %8, float** %c, align 8
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 4)
  store i32 0, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %20, %0
  %11 = load i32* %i, align 4
  %12 = icmp slt i32 %11, 600000000
  br i1 %12, label %13, label %23

; <label>:13                                      ; preds = %10
  %14 = load i32* %i, align 4
  %15 = sitofp i32 %14 to float
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = load float** %a, align 8
  %19 = getelementptr inbounds float* %18, i64 %17
  store float %15, float* %19, align 4
  br label %20

; <label>:20                                      ; preds = %13
  %21 = load i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %10

; <label>:23                                      ; preds = %10
  store i32 0, i32* %i, align 4
  br label %24

; <label>:24                                      ; preds = %34, %23
  %25 = load i32* %i, align 4
  %26 = icmp slt i32 %25, 1200000000
  br i1 %26, label %27, label %37

; <label>:27                                      ; preds = %24
  %28 = load i32* %i, align 4
  %29 = sitofp i32 %28 to float
  %30 = load i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = load float** %b, align 8
  %33 = getelementptr inbounds float* %32, i64 %31
  store float %29, float* %33, align 4
  br label %34

; <label>:34                                      ; preds = %27
  %35 = load i32* %i, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %i, align 4
  br label %24

; <label>:37                                      ; preds = %24
  store i32 0, i32* %i, align 4
  br label %38

; <label>:38                                      ; preds = %46, %37
  %39 = load i32* %i, align 4
  %40 = icmp slt i32 %39, 800000000
  br i1 %40, label %41, label %49

; <label>:41                                      ; preds = %38
  %42 = load i32* %i, align 4
  %43 = sext i32 %42 to i64
  %44 = load float** %c, align 8
  %45 = getelementptr inbounds float* %44, i64 %43
  store float 0.000000e+00, float* %45, align 4
  br label %46

; <label>:46                                      ; preds = %41
  %47 = load i32* %i, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %i, align 4
  br label %38

; <label>:49                                      ; preds = %38
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str1, i32 0, i32 0))
  %51 = load float** %a, align 8
  %52 = load float** %b, align 8
  %53 = load float** %c, align 8
  call void @tiling_mm(float* %51, float* %52, float* %53, i32 20000, i32 30000, i32 40000)
  %54 = call i64 @"\01_clock"()
  store i64 %54, i64* %end, align 8
  %55 = load i64* %end, align 8
  %56 = load i64* %begin, align 8
  %57 = sub i64 %55, %56
  %58 = uitofp i64 %57 to double
  %59 = fdiv double %58, 1.000000e+06
  store double %59, double* %time_spent, align 8
  %60 = load double* %time_spent, align 8
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0), double %60)
  %62 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str3, i32 0, i32 0))
  ret i32 0
}

declare i64 @"\01_clock"() #1

declare i8* @malloc(i64) #1

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind ssp uwtable
define void @tiling_mm(float* %mat1, float* %mat2, float* %result, i32 %i, i32 %j, i32 %k) #0 {
  %1 = alloca float*, align 8
  %2 = alloca float*, align 8
  %3 = alloca float*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %mm = alloca i32, align 4
  %nn = alloca i32, align 4
  %l = alloca i32, align 4
  %time_spent = alloca double, align 8
  %begin = alloca i64, align 8
  %end = alloca i64, align 8
  %total_blocks = alloca i32, align 4
  store float* %mat1, float** %1, align 8
  store float* %mat2, float** %2, align 8
  store float* %result, float** %3, align 8
  store i32 %i, i32* %4, align 4
  store i32 %j, i32* %5, align 4
  store i32 %k, i32* %6, align 4
  %7 = load i32* %4, align 4
  %8 = sdiv i32 %7, 100
  %9 = load i32* %6, align 4
  %10 = sdiv i32 %9, 100
  %11 = mul nsw i32 %8, %10
  store i32 %11, i32* %total_blocks, align 4
  store i32 0, i32* %m, align 4
  br label %12

; <label>:12                                      ; preds = %104, %0
  %13 = load i32* %m, align 4
  %14 = load i32* %4, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %107

; <label>:16                                      ; preds = %12
  store i32 0, i32* %l, align 4
  br label %17

; <label>:17                                      ; preds = %100, %16
  %18 = load i32* %l, align 4
  %19 = load i32* %6, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %103

; <label>:21                                      ; preds = %17
  %22 = call i64 @"\01_clock"()
  store i64 %22, i64* %begin, align 8
  store i32 0, i32* %n, align 4
  br label %23

; <label>:23                                      ; preds = %85, %21
  %24 = load i32* %n, align 4
  %25 = load i32* %5, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %88

; <label>:27                                      ; preds = %23
  store i32 0, i32* %mm, align 4
  br label %28

; <label>:28                                      ; preds = %81, %27
  %29 = load i32* %mm, align 4
  %30 = icmp slt i32 %29, 100
  br i1 %30, label %31, label %84

; <label>:31                                      ; preds = %28
  store i32 0, i32* %nn, align 4
  br label %32

; <label>:32                                      ; preds = %77, %31
  %33 = load i32* %nn, align 4
  %34 = icmp slt i32 %33, 100
  br i1 %34, label %35, label %80

; <label>:35                                      ; preds = %32
  %36 = load i32* %m, align 4
  %37 = load i32* %5, align 4
  %38 = mul nsw i32 %36, %37
  %39 = load i32* %mm, align 4
  %40 = load i32* %5, align 4
  %41 = mul nsw i32 %39, %40
  %42 = add nsw i32 %38, %41
  %43 = load i32* %n, align 4
  %44 = add nsw i32 %42, %43
  %45 = sext i32 %44 to i64
  %46 = load float** %1, align 8
  %47 = getelementptr inbounds float* %46, i64 %45
  %48 = load float* %47, align 4
  %49 = load i32* %nn, align 4
  %50 = load i32* %l, align 4
  %51 = add nsw i32 %49, %50
  %52 = load i32* %n, align 4
  %53 = load i32* %6, align 4
  %54 = mul nsw i32 %52, %53
  %55 = add nsw i32 %51, %54
  %56 = sext i32 %55 to i64
  %57 = load float** %2, align 8
  %58 = getelementptr inbounds float* %57, i64 %56
  %59 = load float* %58, align 4
  %60 = fmul float %48, %59
  %61 = load i32* %m, align 4
  %62 = load i32* %6, align 4
  %63 = mul nsw i32 %61, %62
  %64 = load i32* %mm, align 4
  %65 = load i32* %6, align 4
  %66 = mul nsw i32 %64, %65
  %67 = add nsw i32 %63, %66
  %68 = load i32* %nn, align 4
  %69 = add nsw i32 %67, %68
  %70 = load i32* %l, align 4
  %71 = add nsw i32 %69, %70
  %72 = sext i32 %71 to i64
  %73 = load float** %3, align 8
  %74 = getelementptr inbounds float* %73, i64 %72
  %75 = load float* %74, align 4
  %76 = fadd float %75, %60
  store float %76, float* %74, align 4
  br label %77

; <label>:77                                      ; preds = %35
  %78 = load i32* %nn, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %nn, align 4
  br label %32

; <label>:80                                      ; preds = %32
  br label %81

; <label>:81                                      ; preds = %80
  %82 = load i32* %mm, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* %mm, align 4
  br label %28

; <label>:84                                      ; preds = %28
  br label %85

; <label>:85                                      ; preds = %84
  %86 = load i32* %n, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %n, align 4
  br label %23

; <label>:88                                      ; preds = %23
  %89 = call i64 @"\01_clock"()
  store i64 %89, i64* %end, align 8
  %90 = load i64* %end, align 8
  %91 = load i64* %begin, align 8
  %92 = sub i64 %90, %91
  %93 = uitofp i64 %92 to double
  %94 = fdiv double %93, 1.000000e+06
  store double %94, double* %time_spent, align 8
  %95 = load i32* %m, align 4
  %96 = load i32* %l, align 4
  %97 = load i32* %total_blocks, align 4
  %98 = load double* %time_spent, align 8
  %99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0), i32 %95, i32 %96, i32 %97, double %98)
  br label %100

; <label>:100                                     ; preds = %88
  %101 = load i32* %l, align 4
  %102 = add nsw i32 %101, 100
  store i32 %102, i32* %l, align 4
  br label %17

; <label>:103                                     ; preds = %17
  br label %104

; <label>:104                                     ; preds = %103
  %105 = load i32* %m, align 4
  %106 = add nsw i32 %105, 100
  store i32 %106, i32* %m, align 4
  br label %12

; <label>:107                                     ; preds = %12
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @print_matrix(float* %mat, i32 %i, i32 %j) #0 {
  %1 = alloca float*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %k = alloca i32, align 4
  store float* %mat, float** %1, align 8
  store i32 %i, i32* %2, align 4
  store i32 %j, i32* %3, align 4
  %4 = load i32* %2, align 4
  %5 = load i32* %2, align 4
  %6 = mul nsw i32 %4, %5
  store i32 %6, i32* %k, align 4
  store i32 0, i32* %n, align 4
  br label %7

; <label>:7                                       ; preds = %36, %0
  %8 = load i32* %n, align 4
  %9 = load i32* %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %39

; <label>:11                                      ; preds = %7
  %12 = load i32* %n, align 4
  %13 = load i32* %3, align 4
  %14 = mul nsw i32 %12, %13
  store i32 %14, i32* %m, align 4
  br label %15

; <label>:15                                      ; preds = %31, %11
  %16 = load i32* %m, align 4
  %17 = load i32* %n, align 4
  %18 = load i32* %3, align 4
  %19 = mul nsw i32 %17, %18
  %20 = load i32* %3, align 4
  %21 = add nsw i32 %19, %20
  %22 = icmp slt i32 %16, %21
  br i1 %22, label %23, label %34

; <label>:23                                      ; preds = %15
  %24 = load i32* %m, align 4
  %25 = sext i32 %24 to i64
  %26 = load float** %1, align 8
  %27 = getelementptr inbounds float* %26, i64 %25
  %28 = load float* %27, align 4
  %29 = fpext float %28 to double
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i32 0, i32 0), double %29)
  br label %31

; <label>:31                                      ; preds = %23
  %32 = load i32* %m, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %m, align 4
  br label %15

; <label>:34                                      ; preds = %15
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0))
  br label %36

; <label>:36                                      ; preds = %34
  %37 = load i32* %n, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %n, align 4
  br label %7

; <label>:39                                      ; preds = %7
  %40 = load i32* %2, align 4
  %41 = load i32* %3, align 4
  %42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str6, i32 0, i32 0), i32 %40, i32 %41)
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @matrix_multiply(float* %mat1, float* %mat2, float* %result, i32 %i, i32 %j, i32 %k) #0 {
  %1 = alloca float*, align 8
  %2 = alloca float*, align 8
  %3 = alloca float*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  %l = alloca i32, align 4
  %time_spent = alloca double, align 8
  %begin = alloca i64, align 8
  %end = alloca i64, align 8
  store float* %mat1, float** %1, align 8
  store float* %mat2, float** %2, align 8
  store float* %result, float** %3, align 8
  store i32 %i, i32* %4, align 4
  store i32 %j, i32* %5, align 4
  store i32 %k, i32* %6, align 4
  store i32 0, i32* %m, align 4
  br label %7

; <label>:7                                       ; preds = %70, %0
  %8 = load i32* %m, align 4
  %9 = load i32* %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %73

; <label>:11                                      ; preds = %7
  %12 = call i64 @"\01_clock"()
  store i64 %12, i64* %begin, align 8
  store i32 0, i32* %n, align 4
  br label %13

; <label>:13                                      ; preds = %56, %11
  %14 = load i32* %n, align 4
  %15 = load i32* %6, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %59

; <label>:17                                      ; preds = %13
  store i32 0, i32* %l, align 4
  br label %18

; <label>:18                                      ; preds = %52, %17
  %19 = load i32* %l, align 4
  %20 = load i32* %5, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %55

; <label>:22                                      ; preds = %18
  %23 = load i32* %m, align 4
  %24 = load i32* %5, align 4
  %25 = mul nsw i32 %23, %24
  %26 = load i32* %l, align 4
  %27 = add nsw i32 %25, %26
  %28 = sext i32 %27 to i64
  %29 = load float** %1, align 8
  %30 = getelementptr inbounds float* %29, i64 %28
  %31 = load float* %30, align 4
  %32 = load i32* %l, align 4
  %33 = load i32* %6, align 4
  %34 = mul nsw i32 %32, %33
  %35 = load i32* %n, align 4
  %36 = add nsw i32 %34, %35
  %37 = sext i32 %36 to i64
  %38 = load float** %2, align 8
  %39 = getelementptr inbounds float* %38, i64 %37
  %40 = load float* %39, align 4
  %41 = fmul float %31, %40
  %42 = load i32* %m, align 4
  %43 = load i32* %6, align 4
  %44 = mul nsw i32 %42, %43
  %45 = load i32* %n, align 4
  %46 = add nsw i32 %44, %45
  %47 = sext i32 %46 to i64
  %48 = load float** %3, align 8
  %49 = getelementptr inbounds float* %48, i64 %47
  %50 = load float* %49, align 4
  %51 = fadd float %50, %41
  store float %51, float* %49, align 4
  br label %52

; <label>:52                                      ; preds = %22
  %53 = load i32* %l, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %l, align 4
  br label %18

; <label>:55                                      ; preds = %18
  br label %56

; <label>:56                                      ; preds = %55
  %57 = load i32* %n, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %n, align 4
  br label %13

; <label>:59                                      ; preds = %13
  %60 = call i64 @"\01_clock"()
  store i64 %60, i64* %end, align 8
  %61 = load i64* %end, align 8
  %62 = load i64* %begin, align 8
  %63 = sub i64 %61, %62
  %64 = uitofp i64 %63 to double
  %65 = fdiv double %64, 1.000000e+06
  store double %65, double* %time_spent, align 8
  %66 = load i32* %m, align 4
  %67 = load i32* %4, align 4
  %68 = load double* %time_spent, align 8
  %69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %66, i32 %67, double %68)
  br label %70

; <label>:70                                      ; preds = %59
  %71 = load i32* %m, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %m, align 4
  br label %7

; <label>:73                                      ; preds = %7
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @sync_mm(float* %mat1, float* %mat2, float* %result, i32 %i, i32 %j, i32 %k) #0 {
  %1 = alloca float*, align 8
  %2 = alloca float*, align 8
  %3 = alloca float*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store float* %mat1, float** %1, align 8
  store float* %mat2, float** %2, align 8
  store float* %result, float** %3, align 8
  store i32 %i, i32* %4, align 4
  store i32 %j, i32* %5, align 4
  store i32 %k, i32* %6, align 4
  ret void
}

; Function Attrs: nounwind ssp uwtable
define void @verification(float* %mat, float* %array1, float %array2) #0 {
  %1 = alloca float*, align 8
  %2 = alloca float*, align 8
  %3 = alloca float, align 4
  store float* %mat, float** %1, align 8
  store float* %array1, float** %2, align 8
  store float %array2, float* %3, align 4
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str9, i32 0, i32 0))
  ret void
}

attributes #0 = { nounwind ssp uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+sse,+sse2,+sse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+ssse3,+cx16,+sse,+sse2,+sse3" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"Apple LLVM version 7.0.2 (clang-700.1.81)"}
