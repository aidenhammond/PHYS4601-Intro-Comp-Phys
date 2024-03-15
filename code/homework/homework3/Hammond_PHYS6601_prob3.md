<!-- Created by Aiden Hammond -->
<!-- Note: Remember to comment your code -->
# PHYS6601 Homework 3 - Radioactive Decay Simulation
## Introduction
### What is the problem?
The problem we are facing is the radioactive decay of *N* nuclei of type *A* into nuclei of type *B* with time constant $\tau_A$ that thus further decays from type *B* with time constant $\tau_B$. Our job is to model the number of type *A* nuclei ($N_A$) and type *B* nuclei ($N_B$) over time.

We do this with the below methods.
## Methods
### What algorithms did we use?
The behavior of this system is given by the differential equations
$$
\frac{dN_A}{dt} = - \frac{N_A}{\tau_A}, \space \space \space \space
\frac{dN_B}{dt} = \frac{N_A}{\tau_A} - \frac{N_B}{\tau_B}
$$
> [!NOTE]
> These equations can be solved into the following form using Euler's method
> $$
> \frac{dN_A}{dt} = -\frac{N_A}{\tau_A} \implies N_{A,t+1} = N_{A,t} + (-\frac{N_A}{\tau_A})*dt
> $$
> $$
> \frac{dN_B}{dt} = \frac{N_A}{\tau_A}-\frac{N_B}{\tau_B} \implies N_{B,t+1} = N_{B,t} + (\frac{N_A}{\tau_A}-\frac{N_B}{\tau_B})*dt
> $$
## Assumptions
### What assumptions and parameters did you use?
## Data
### Sample results
These are sample results that are enough to support my conclusion
## Discussion
### What do the results mean?
### What are the errors?
## Conclusion
