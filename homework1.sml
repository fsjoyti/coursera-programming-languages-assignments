fun is_older(date1:int*int*int,date2:int*int*int)=
    if (#1 date1) < (#1 date2)
       andalso(#2 date1) < (#2 date2)
       andalso (#3 date1) < (#3 date2)
    then true
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
	
fun number_before_reaching_sum(sum,numbers:int list)=
    if null numbers
    then 0
    else
	let val counter = number_before_reaching_sum(sum,tl numbers)
	in
	    if (counter < sum)
	    then counter+ hd numbers
	    else
		hd numbers
	end
   
		
	
    
				      
    




