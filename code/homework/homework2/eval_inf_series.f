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
                        DO XEXP = 0, N
                                S = S + X**XEXP
                        ENDDO
                        FCLOSEDLOOPFORMS = 1 / ( 1 - X )
                        DIFF = S - FCLOSEDLOOPFORMS
cc                        WRITE(*,*) S
cc                        WRITE(*,*) FCLOSEDLOOPFORMS
                        COMPARISONS(I) = DIFF
                        ERRORSUM = ERRORSUM + DIFF
                        X = X + DX
                        I = I + 1
                ENDDO

                MEANERROR = ERRORSUM / NUMCOMP 
                FILENAME = ' '
                WRITE(*,*) 'MAE for N=', N, ': ', MEANERROR
                WRITE(FILENAME, '(A,I0,A)') 'comparisons_', N, '.dat'
                FILENAME = TRIM(ADJUSTL(FILENAME))
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
        NUMCOMP = 20
        DO N = 2, 20, 2
                CALL COMPARISONLOOP(NUMCOMP, N)
        END DO

        END PROGRAM EVALINFSERIES
