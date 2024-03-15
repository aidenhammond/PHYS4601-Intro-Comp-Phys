      ! Aiden Hammond
      ! Homework 3 - Dr. Landau - Computational Physics
      program decay_simulation
      implicit none

      ! Declaration of variables
      double precision N
      double precision NA,NB
      double precision tA,tB,dt,t
      double precision NA_analytic,NB_analytic
      double precision dNA, dNB
      integer i, nsteps

      ! Variable initialization
      tA = 1.0d0
      tB = 2.0d0
      N  = 1000.0d0   ! Begin with 1000 nuclei
      NB = 0d0        ! No nuclei of type B initially
      dt = 0.01d0     ! Time step, in seconds
      nsteps = 100.0d0 / dt   ! Number of time steps to simulate
      NA = N          ! Assume all nuclei of type A initially

      print *, '# t NA NB NA_analytic NB_analytic dNA dNB'

      ! Loop
      do i = 1, nsteps
         t = i*dt
         NA = NA - (NA/tA)*dt
         NB = NB + (NA/tA)*dt - (NB/tB)*dt

         NA_analytic = N*EXP(-t/tA)
         NB_analytic = N*(tB/(tA-tB))*(EXP(-t/tA) - EXP(-t/tB))

         dNA = NA - NA_analytic ! difference between sim/analytic for NA
         dNB = NB - NB_analytic ! difference between sim/analytic for NB

         ! Print results for every 100th step as an example
         if (mod(i,100).eq.0) then
            !print *, 'Time:', t, 'NA:', NA, 'NB:', NB
            ! Print analytic solutions for comparison
            !print*,'Analytic NA:',NA_analytic,'Analytic NB:',NB_analytic
            !print *, 'dNA:', NA-NA_analytic, 'dNB:', NB-NB_analytic
            !print *, ''
            print*,t,NA,NB,NA_analytic,NB_analytic,dNA,dNB
         endif
      enddo

      stop
      end

