// task which drives six consecutive 7=segment displays
// CSE140L  Lab 2 
// $fdisplay performs a return / new line feed; $fwrite does not
task display_2_3_tb(input[6:0] seg_month1, seg_month0, 
                           seg_date1,  seg_date0, 
                           seg_j, 						  // day of week
                           seg_d,      seg_e, 			  // hours
                           seg_f,      seg_g, 			  // minutes
                           seg_h,      seg_i
  );
  int h1;
  h1 = $fopen("output3.txt");
 // segment A
      if(seg_month1[6]) $fwrite(h1, " _ ");
      else         $fwrite(h1, "   ");
      $fwrite(h1, " ");
	  if(seg_month0[6]) $fwrite(h1, " _ ");
      else         $fwrite(h1, "   ");
      $fwrite(h1, "  ");

	  if(seg_date1[6]) $fwrite(h1, " _ ");
      else         $fwrite(h1, "   ");
      $fwrite(h1, " ");
      if(seg_date0[6]) $fwrite(h1, " _ ");
      else         $fwrite(h1, "   ");
      $fwrite(h1, "  ");
// day of week		
      if(seg_j[6]) $fwrite(h1, " _ ");
      else         $fwrite(h1, "   ");
      $fwrite(h1, "  ");
// hours
      if(seg_d[6]) $fwrite(h1, " _ ");
      else         $fwrite(h1, "   ");
	  $fwrite(h1, " ");
	  if(seg_e[6]) $fwrite(h1, " _ ");
	  else         $fwrite(h1, "   ");
	  $fwrite(h1, "  ");
// minutes
	  if(seg_f[6]) $fwrite(h1, " _ ");
	  else         $fwrite(h1, "   ");
      $fwrite(h1, " ");
	  if(seg_g[6]) $fwrite(h1, " _ ");
	  else         $fwrite(h1, "   ");
/*	  $fwrite(h1, "  ");
	  if(seg_h[6]) $fwrite(h1, " _ ");
	  else         $fwrite(h1, "   ");
      $fwrite(h1, " ");
	  if(seg_i[6]) $fwrite(h1, " _ ");
	  else         $fwrite(h1, "   ");
*/      $fdisplay(h1, );
 // segments FGB
  	  if(seg_month1[1]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_month1[0]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_month1[5]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fwrite(h1, " ");
	  if(seg_month0[1]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_month0[0]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_month0[5]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fwrite(h1, "  ");

	  if(seg_date1[1]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_date1[0]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_date1[5]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fwrite(h1, " ");
	  if(seg_date0[1]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_date0[0]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_date0[5]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fwrite(h1, "  ");
	  
 	  if(seg_j[1]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_j[0]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_j[5]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fwrite(h1, "  ");

	  if(seg_d[1]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_d[0]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_d[5]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fwrite(h1, " ");
	  if(seg_e[1]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_e[0]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_e[5]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fwrite(h1, "  ");

	  if(seg_f[1]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_f[0]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_f[5]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fwrite(h1, " ");
	  if(seg_g[1]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_g[0]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_g[5]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fdisplay(h1, );
  // segments EDC
      if(seg_month1[2]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_month1[3]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_month1[4]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fwrite(h1, " ");
      if(seg_month0[2]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_month0[3]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_month0[4]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fwrite(h1, "  ");
	  
      if(seg_date1[2]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_date1[3]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_date1[4]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fwrite(h1, " ");
      if(seg_date0[2]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_date0[3]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_date0[4]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fwrite(h1, "  ");
// day	  
      if(seg_j[2]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_j[3]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_j[4]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fwrite(h1, "  ");
// hours
     if(seg_d[2]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_d[3]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_d[4]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fwrite(h1, " ");
      if(seg_e[2]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_e[3]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_e[4]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fwrite(h1, "  ");
// minutes
      if(seg_f[2]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_f[3]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_f[4]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fwrite(h1, " ");
      if(seg_g[2]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  if(seg_g[3]) $fwrite(h1, "_");
	  else $fwrite(h1, " ");
	  if(seg_g[4]) $fwrite(h1, "|");
	  else $fwrite(h1, " ");
	  $fdisplay(h1, );

endtask