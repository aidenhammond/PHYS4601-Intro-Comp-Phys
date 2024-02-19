        implicit none
        
        character ( len = 8 ) date
        character ( len = 10 ) time

        call date_and_time ( date, time )

        write ( *, '(a8,2x,a10)' ) date, time

        return
        end
