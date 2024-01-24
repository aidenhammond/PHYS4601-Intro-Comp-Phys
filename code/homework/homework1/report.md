<!-- Created by Aiden Hammond -->
<!-- Note: Remember to comment your code -->
# Title
## Introduction
### What is the problem?
Write a computer program in Fortran77 to evaluate the sum of the odd integers between 0 and 32. You must run the program on *Teaching Cluster* to determine the answer. Your report should include the answers to the following questions:
1. What is the sum of the odd integers between 0 and 32?
2. What is the accuracy of your answer?
3. What is the precision of your answer?
You are to submit a brief report which includes a description of the method used, results, analysis, discussion, an annotated copy of your program, and a copy of a *summary.log* file.

*Please make your report concise but describe how you analyzed your results and how you reached your conclusions. Make any comments that you feel are relevant. Include an annotated copy of your program and a copy of a summary.log.*

*Your report should be submitted as a single pdf to dlandau@uga.edu. The filename should be 'your_last_hame'_PHYS6601_prob1.pdf. Please remember to put your name on your report!*
## Methods
### What algorithms did we use?
We are using a loop over I of integers starting from 1 and ending at 32.
Then we are adding ( I % 2 ) * I to integer value SUM on each iteration of that loop. The idea is that if I is even, I % 2 = 0, and nothing is added to SUM. If I is odd, then I % 2 = 1, thus ( I % 2 ) * I = I, and I is added to SUM.
## Assumptions
### What assumptions and parameters did you use?
We used the assumption that the memory pointed to by I is overwritten to 0x00000001 at the start of the DO loop, because I is not initially declared, meaning it could be pointing to random memory on the initial loop, leading to unknown behavior. 
## Data
### Sample results
| 256 |
|-----|
This output can be found in *summary.log* or by running *a.out*.

## Discussion
### What do the results mean?
The result of 256 means that the sum of the odd numbers between 1 and 32 is 256.
### What are the errors?
1 + 3 + 5 + 7 + 9 + 11 + 13 + 15 + 17 + 19 + 21 + 23 + 25 + 27 + 29 + 31 =
25 + 11 + 13 + 15 + 17 + 19 + 21 + 23 + 25 + 27 + 29 + 31 =
200 + 5 + 1 + 3 + 5 + 7 + 9 + 1 + 3 + 5+ 7 + 9 + 1 =
200 + 10 + 10 + 10 + 10 + 10+ 5 + 1 = 256
Via manual verification we are correct and have no error, thus we are accurate and percise.

## Conclusion
The sum of odd integers between 0 and 32 is 256.


## Code
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
