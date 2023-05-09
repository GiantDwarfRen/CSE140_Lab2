// task which drives five consecutive 7=segment displays
// CSE140L  Lab 2  Part 2 
// $fdisplay performs a return / new line feed; $fwrite does not
task display_tb(input[6:0] seg_j, seg_d,
  seg_e, seg_f, seg_g, seg_h, seg_i
  );
  int h1;
  begin
  h1 = $fopen("output2.txt");
 // segment A (top bar of 7-segment)
      if(seg_j[6]) $fwrite(h1," _ ");		// day of week 
      else         $fwrite(h1,"   ");		//  
      $fwrite(h1,"  ");						//  
      if(seg_d[6]) $fwrite(h1," _ ");		// hour of day
      else         $fwrite(h1,"   ");
      $fwrite(h1," ");
	  if(seg_e[6]) $fwrite(h1," _ ");		// ones digit of hour
	  else         $fwrite(h1,"   ");
	  $fwrite(h1,"  ");
	  if(seg_f[6]) $fwrite(h1," _ ");		// minute 10s digit
	  else         $fwrite(h1,"   ");
      $fwrite(h1," ");
	  if(seg_g[6]) $fwrite(h1," _ ");	    // minute 1s digit
	  else         $fwrite(h1,"   ");
/*	  $fwrite(h1,"  ");				        // optional seconds disp
	  if(seg_h[6]) $fwrite(h1," _ ");		_
	  else         $fwrite(h1,"   ");		 
      $fwrite(h1," ");
	  if(seg_i[6]) $fwrite(h1," _ ");
	  else         $fwrite(h1,"   ");
*/      $fdisplay(h1,);					    // line feed
 // segments FGB						// top verticals, center
 	  if(seg_j[1]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_j[0]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_j[5]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  $fwrite(h1,"  ");                     // days-hrs double space
	  if(seg_d[1]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_d[0]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_d[5]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  $fwrite(h1," ");
	  if(seg_e[1]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_e[0]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_e[5]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  $fwrite(h1,"  ");	                    // hrs-mins double space
	  if(seg_f[1]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_f[0]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_f[5]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  $fwrite(h1," ");
	  if(seg_g[1]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_g[0]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_g[5]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  $fdisplay(h1,);
  // segments EDC                       // lower sides, bottom     
      if(seg_j[2]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_j[3]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_j[4]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  $fwrite(h1,"  ");
     if(seg_d[2]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_d[3]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_d[4]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  $fwrite(h1," ");
      if(seg_e[2]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_e[3]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_e[4]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  $fwrite(h1,"  ");
      if(seg_f[2]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_f[3]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_f[4]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  $fwrite(h1," ");
      if(seg_g[2]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  if(seg_g[3]) $fwrite(h1,"_");
	  else $fwrite(h1," ");
	  if(seg_g[4]) $fwrite(h1,"|");
	  else $fwrite(h1," ");
	  $fdisplay(h1,);
	end
endtask