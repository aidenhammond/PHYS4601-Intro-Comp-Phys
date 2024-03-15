<!-- Created by Aiden Hammond -->
<!-- Note: Remember to comment your code -->
# Evaluating Infinite Series
## Introduction
### What is the problem?
In physics we often work with series expansions. Write a program in Fortran77 to evaluate the
infinite series
S = 1+x+x2+x3+…
for -1 < x < 1, and compare the results of your program using a finite number of terms N to the
closed-form expression
S = 1 / (1 - x)
obtained from the geometric series expression in the limit that the number of terms in the series
N → inf. After thinking about both the series and the exact expressions, perform the comparison
for 10 values of x that span the entire region -1 < x < 1, and be certain to include values that are
“interesting”. Justify why you chose the values of x that you used. Estimate how large N needs
to be in practice for different values of x to give “acceptable” results and justify your choices.
(State what you mean by “acceptable”.) Don’t forget to say something about the precision and
the accuracy of your results

## Methods
### What algorithms did we use?
I used a subroutine and GNUPlot, which differed from previous homeworks. GNUPlot is a tool that
I was instructed to get to learn, and I am hoping this is a good representation of using that
tool, however, I found it difficult to plot several tightly knit curves.

## Assumptions
### What assumptions and parameters did you use?
We assumed that S = 1 / (1-x) is correct for the infinite series.

## Data
### Sample results
These are sample results that are enough to support my conclusion:
amh37629@teach-sub1 homework2$ sh run.sh

The following have been reloaded with a version change:
  1) GCCcore/12.3.0 => GCCcore/11.3.0
  2) zlib/1.2.13-GCCcore-12.3.0 => zlib/1.2.12-GCCcore-11.3.0

 MAE for N=           2 :   0.710412502    
 MAE for N=           4 :    1.20594537    
 MAE for N=           6 :    1.57251763    
 MAE for N=           8 :    1.85230947    
 MAE for N=          10 :    2.07001805    
 MAE for N=          12 :    2.24161410    
 MAE for N=          14 :    2.37809491    
 MAE for N=          16 :    2.48736382    
 MAE for N=          18 :    2.57527876    
 MAE for N=          20 :    2.64627695    
 MAE for N=          22 :    2.70377874    
 MAE for N=          24 :    2.75045347    
 MAE for N=          26 :    2.78840590    
 MAE for N=          28 :    2.81930900    
 MAE for N=          30 :    2.84449887    
 MAE for N=          32 :    2.86504984    
 MAE for N=          34 :    2.88182735    
 MAE for N=          36 :    2.89553213    
 MAE for N=          38 :    2.90673113    
 MAE for N=          40 :    2.91588640    
 MAE for N=          42 :    2.92337227    
 MAE for N=          44 :    2.92949486    
 MAE for N=          46 :    2.93450332    
 MAE for N=          48 :    2.93860102    
 MAE for N=          50 :    2.94195414    
 MAE for N=          52 :    2.94469786    
 MAE for N=          54 :    2.94694281    
 MAE for N=          56 :    2.94878054    
 MAE for N=          58 :    2.95028448    
 MAE for N=          60 :    2.95151567    
 MAE for N=          62 :    2.95252299    
 MAE for N=          64 :    2.95334792    
 MAE for N=          66 :    2.95402288    
 MAE for N=          68 :    2.95457578    
 MAE for N=          70 :    2.95502830    
 MAE for N=          72 :    2.95539856    
 MAE for N=          74 :    2.95570183    
 MAE for N=          76 :    2.95595026    
 MAE for N=          78 :    2.95615339    
 MAE for N=          80 :    2.95632005    
 MAE for N=          82 :    2.95645642    
 MAE for N=          84 :    2.95656824    
 MAE for N=          86 :    2.95665979    
 MAE for N=          88 :    2.95673466    
 MAE for N=          90 :    2.95679593    
 MAE for N=          92 :    2.95684600    
 MAE for N=          94 :    2.95688725    
 MAE for N=          96 :    2.95692110    
 MAE for N=          98 :    2.95694876    
 MAE for N=         100 :    2.95697165    

real	0m0.039s
user	0m0.006s
sys	0m0.003s

The differences in the mean absolute error from one N value to the next is:
0.495532868
0.36657226
0.27979184
0.21770858
0.17159605
0.13648081
0.10926891
0.08791494
0.07099819
0.05750179
0.04667473
0.03795243
0.0309031
0.02518987
0.02055097
0.01677751
0.01370478
0.011199
0.00915527
0.00748587
0.00612259
0.00500846
0.0040977
0.00335312
0.00274372
0.00224495
0.00183773
0.00150394
0.00123119
0.00100732
0.00082493
0.00067496
0.0005529
0.00045252
0.00037026
0.00030327
0.00024843
0.00020313
0.00016666
0.00013637
0.00011182
0.00009155
0.00007487
0.00006127
0.00005007
0.00004125
0.00003385
0.00002766
0.00002289


## Discussion
### What do the results mean?
At the N=24 iteration, the difference between it and the next iteration (N=26) was <0.05, which I am concluding is precise enough (closeness between the measurements) and accurate enough (closeness of the estimated value to the actual) to be acceptable.

The MAE increased over time not due to it being generally worse, but because it was incrementing
on the previous differences as well. The important information comes from the differences between
the MAE values, as that should, and provably does, approach 0.
### What are the errors?
The errors could come in through floating point arithmetic. It could also be due to simply not enough N values being present.

Also, I noticed that the absolute error always spiked to large values as X->1. As I increased the number of comparisons, I saw that it actually increased the integrable factor of the curves.

## Conclusion
The infinite series becomes more accurate and precise as more N values are introduced. I.E. the
values become closer to the actual value and start to approach the actual value slower.


## Code
```f
cc Created by Aiden Hammond
cc Subroutine for finding the diff between actual and estimated values
cc Created the subroutine beceause I couldn't otherwise create an array
cc whose length was given by a variable
        SUBROUTINE COMPARISONLOOP(NUMCOMP, N)
                IMPLICIT NONE
                INTEGER, INTENT(IN) :: NUMCOMP, N
                INTEGER :: XEXP, I
                REAL :: DX, FCLOSEDLOOPFORMS, S, DIFF, X
                REAL :: ERRORSUM, MEANERROR
                REAL, ALLOCATABLE :: COMPARISONS(:)
                CHARACTER(LEN=30) :: FILENAME
                ALLOCATE(COMPARISONS(NUMCOMP))

cc Adding one to number of comparisons to correct for the loss of the
cc case where X = -1 (fixed below)
                DX = 2.0 / REAL(NUMCOMP + 1)

cc Since -1 < X < 1, X != [-1, 1] rather X == (-1, 1)
cc Adding DX corrects for case where X == -1
                X = -1.0 + DX

cc Check to make sure DX != 0, which would cause an infinite loop.
                IF (DX .EQ. 0) THEN
                        write(*,*) "Exited with error: DX == 0"
                        CALL EXIT(1) 
                END IF

                I = 1

cc Main DO loop. Continues while X is in domain (-1, 1)
                DO WHILE(X < 1 .AND. I <= NUMCOMP)
                        S = 0.0
cc DO loop for computing the estimated infinite series
                        DO XEXP = 0, N
                                S = S + X**XEXP
                        ENDDO
cc Compute the actual value to compare against
                        FCLOSEDLOOPFORMS = 1 / ( 1 - X )
cc Find the absolute difference
                        DIFF = ABS(S - FCLOSEDLOOPFORMS)
cc Add to COMPARISONS list
                        COMPARISONS(I) = DIFF
cc Add sum to ERRORSUM
                        ERRORSUM = ERRORSUM + DIFF
cc Increment X and I
                        X = X + DX
                        I = I + 1
                ENDDO
cc Find and print MEANERROR
                MEANERROR = ERRORSUM / NUMCOMP 
                WRITE(*,*) MEANERROR
cc Reset FILENAME (likely unnecessary)
                FILENAME = ' '
cc Concat filename components
                WRITE(FILENAME, '(A,I0,A)') 'comparisons_', N, '.dat'
                FILENAME = TRIM(ADJUSTL(FILENAME))
cc Write diff array to file
                OPEN(UNIT=10, FILE=FILENAME)
                DO I = 1, NUMCOMP
                        WRITE(10, *) I, COMPARISONS(I)
                END DO
                CLOSE(UNIT=10)
                RETURN
        END SUBROUTINE COMPARISONLOOP

        PROGRAM EVALINFSERIES
        IMPLICIT NONE

        INTEGER :: N, NUMCOMP
cc Number of comparisons
        NUMCOMP = 20
        DO N = 2, 100, 2
                CALL COMPARISONLOOP(NUMCOMP, N)
        END DO

        END PROGRAM EVALINFSERIES
```
## Summary.log


        JobID         JobName      User  Partition NNode NCPUS   ReqMem    CPUTime    Elapsed  Timelimit      State ExitCode   NodeList 
------------- --------------- --------- ---------- ----- ----- -------- ---------- ---------- ---------- ---------- -------- ---------- 
         7026 aiden-hammond-+  amh37629      batch     1     1       1M   00:00:06   00:00:06   00:01:00  COMPLETED      0:0      rb1-3 
   7026.batch           batch                          1     1            00:00:06   00:00:06             COMPLETED      0:0      rb1-3 
  7026.extern          extern                          1     1            00:00:06   00:00:06             COMPLETED      0:0      rb1-3 
