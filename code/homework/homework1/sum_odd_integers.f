cc Aiden Hammond

        PROGRAM SUM_ODD_INTEGERS

        ! Declaring variables
        INTEGER :: SUM = 0
        INTEGER :: I

        ! If I is even, then
        ! I % 2 = 0, I * 0 = 0
        ! thus 0 will be added
        ! to SUM
        ! If I is odd, then
        ! I % 2 = 1, I * 1 = I
        ! thus I will be added
        ! to SUM
        DO I = 1, 32
                SUM = SUM + MOD(I, 2) * I
        END DO
        print *, SUM
        END
