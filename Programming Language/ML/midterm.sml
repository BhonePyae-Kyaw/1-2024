fun member (e, nil) = false
| member (e, x::xs) = 
if (e = x) then true else member(e,xs);

fun less (e, nil) = nil
| less (e, x::xs) = 
if (e > x) then x:: less(e,xs) else
less(e,xs);

fun repeats nil = false
| repeats [_] = false
| repeats (a::b::L) =
if (a =b) then true else 
repeats (b::L);

fun eval (nil, _) = 0.0
| eval (coeff::rest, x) = coeff + x * eval(rest, x);