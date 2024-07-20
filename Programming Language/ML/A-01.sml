(* Exercise 1: Write a functio cube of type int -> in that returns the cube of its parameter. *)
fun cube x = x * x * x;
(* Exercise 2 : Write a function cuber of type real -> real that returns the cube of its parameter *)
fun cuber (x: real) = x * x * x;
(* Exercise 3:  Write a function of type 'a list -> 'a that returns the fourth element of a list. Your function need not behave well on lists with less than four elements *)
fun fourth (x: 'a list) = hd(tl(tl(tl x)));
(* Exercise 4:  Write a function min3 of type int *int *int -> int that returns the smallest of three integers *)
fun min3 (a, b, c) = 
    if a < b andalso a < c then a
    else if b < a andalso b < c then b
    else c;
(* Exercise 5: Write a function red3 of type `a * `b * `c -> 'a * * `c that converts a tuple with three dements into one with two by eliminating the second element . *)
fun red3(a,b,c) = (a,c);
(* Exercise 6: Write a function thirds of typestring -> char that retums the third character of a string. Your function need not behave well on strings with lengths less than 3. *)
fun thirds x = hd(tl(tl(explode x)));
(* Question 7: Write a function cycle of type 'a list -> 'a list whose output list is the same as the input list but with the first element of the list moved to the end. For example, cycle [1,2,3,4] should return [2,3,4,1]. *)
fun cycle x = tl x @ [hd x];
(* Question 8: Write a function sort3 of type real * real * real -> real list that returns a list of three real numbers, in sorted order with the smallest first. *)
fun sort3 (a:real, b:real, c:real) = 
    if a < b andalso a <c then 
        if b < c then [a,b,c]
        else [a,c,b]
    else if b < a andalso b < c then 
        if a < c then [b,a,c]
        else [b,c,a]
    else 
        if a < b then [c,a,b]
        else [c,b,a];
(* Exercise 9: Write a function del3 of type 'a list -> 'a list whose output list is the same as the input list, but with the third element deleted. Your function need not behave well on lists with lengths less than 3. *)
fun del3 x = hd x :: hd (tl x) :: tl(tl(tl x));
(* Exercise 10: Write a function sqsum of type int -> int that takes a non-negative integer n and returns the sum of the squares of all the integers from 0 through n. *)
fun sqsm x = 
    if x = 0 then 0 
    else (x*x) + sqsm(x-1);
