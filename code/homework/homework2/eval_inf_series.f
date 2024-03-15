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
