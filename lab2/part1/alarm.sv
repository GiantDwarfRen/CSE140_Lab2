// CSE140 lab 2  
// How does this work? How long does the alarm stay on? 	// it would stay on for one minute
// (buzz is the alarm itself)
module alarm(
  input[6:0]   tmin,
               amin,
			   thrs,
			   ahrs,
			   alarmon,						 
  output logic buzz
);

  always_comb
    buzz = (alarmon) && (tmin==amin) && (thrs==ahrs);

endmodule