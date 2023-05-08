// CSE140 lab 2  
// How does this work? How long does the alarm stay on? 
// (buzz is the alarm itself)
module alarm(
  input[6:0]   tmin,
               amin,
			   thrs,
			   ahrs,
			   day,
  input 	   alarmon,						 
  output logic buzz
);

  always_comb begin
	 if (day <5) buzz = (alarmon) && (tmin == amin) && (thrs == ahrs);
	 else buzz = 0;
  end
endmodule