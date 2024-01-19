# Introduction to Computer Programming
## Planning
### *psudocode*
To begin, write a series of statements that describe the individual steps that you wish to implement.
* *insert* - Comment text to describe the nature of the program. 
* *Declare* all necessary variables
<!-- DNF -->
### Flow chart
UML Diagram's, etc. Should use doxygen?
> Example:
> !> @brief inserts a value into an ordered array
> !!
> !! An array "list" consisting of n ascending ordered values. The method insert a
> !! "new_entry" into the array.
> !! hint: use cshift and eo-shift
> !!
> !! @param[in,out]   list    a real array, size: max_size
> !! @param[in]       n       current values in the array
> !! @param[in]       max_size    size if the array
> !! @param[in]       new_entry   the value to insert
> subroutine insert(list, n, max_size, new_entry)
>     implicit none
>     real, dimension (:), intent (inout) :: list
>     integer, intent (in) :: n, max_size
>     real, intent (in) :: new_entry
>
>    ! code ........
> end subroutine insert


