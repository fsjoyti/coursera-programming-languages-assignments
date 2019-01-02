fun returnYear(date:int * int * int)=
    #1 date

fun returnMonth(date:int*int*int)=
    #2 date

fun returnDate(date:int*int*int)=
    #3 date


fun is_older(date1:int*int*int,date2:int*int*int)=
    if returnYear(date1) < returnYear(date2) then true
    else if returnYear(date1) > returnYear(date2) then false
    else if returnMonth(date1) < returnMonth(date2) then true
    else if returnMonth(date1) > returnMonth(date2)then false
    else if returnDate(date1) < returnDate(date2) then true
    else false
	     
fun number_in_month(dates:(int*int*int)list,month:int)=
    if null dates
    then 0
    else   
	let val number = number_in_month(tl dates,month)
	in
	    if (#2 (hd dates)) = month
	    then number + 1
	    else number
	end

fun number_in_months(dates:(int*int*int)list,months:int list)=
    if null months
    then 0
    else
	number_in_month(dates,hd(months))+number_in_months(dates,tl months)

fun dates_in_month(dates:(int*int*int)list,month:int)=
    if null dates
    then []
    else
	let val list_of_dates = dates_in_month(tl dates,month)
	in
	   if (#2 (hd dates)) = month
	    then  (hd dates):: list_of_dates
	   else  list_of_dates
	end

fun dates_in_months(dates:(int*int*int)list,months:int list)=
    if null months
    then []
    else
	dates_in_month(dates,hd months) @ dates_in_months(dates,tl months)
    
fun get_nth(strings:string list,n:int)=
    if n=1
    then hd strings
    else
	get_nth(tl strings,n-1)

fun date_to_string(date:int*int*int)=
    let val months=["January",
		    "February",
		    "March",
		    "April",
		    "May",
		    "June",
		    "July",
		    "August",
		    "September",
		    "October",
		    "November",
		    "December"
		   ]
     
   in  get_nth(months,#2 date)^" "^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
   end
	
fun number_before_reaching_sum(sum:int,numbers:int list)=
    if sum - hd numbers <=0
    then 0
    else
	1+number_before_reaching_sum(sum - hd numbers, tl numbers)
			      
fun what_month(day:int)=
    number_before_reaching_sum(day,[31,28,31,30,31,30,31,31,30,31,30,31])+1

fun month_range(day1:int,day2:int)=
    if day1 > day2
    then []
    else
	what_month(day1)::month_range(day1+1,day2)
    
fun oldest(dates:(int*int*int)list)=
    if null dates
    then NONE
    else let
	fun oldest_nonempty(dates:(int*int*int)list)=
			    if null (tl dates)
			    then (hd dates)
			    else let val tl_ans = oldest_nonempty(tl dates)
				 in
				     if is_older(hd dates,tl_ans)
				     then hd dates
				     else tl_ans
				     
				 end
	  in
	  SOME(oldest_nonempty dates)
	  end
				
			
	
				   
				  
			
				   
				   
	
	
    
				      
    




