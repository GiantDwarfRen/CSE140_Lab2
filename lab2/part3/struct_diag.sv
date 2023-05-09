// CSE140L  
// see Structural Diagram in Lab2 assignment writeup
// fill in missing connections and parameters
module struct_diag #(parameter NS=60, NH=24, NW = 7, NM = 12)(
  input Reset,
        Timeset, 	  // manual buttons
        Alarmset,	  //	(five total)
		Minadv,
		Hrsadv,
		Dayadv,
		Dateadv,
		Monthadv,
		Alarmon,
		Pulse,		  // assume 1/sec.
// 6 decimal digit display (7 segment)
  output [6:0] S1disp, S0disp, 	   // 2-digit seconds display
               M1disp, M0disp, 
               H1disp, H0disp,
                       D0disp,   // for part 2
			   Month1disp, Month0disp,
			   Date1disp, Date0disp,
  output logic Buzz);	           // alarm sounds
// internal connections (may need more)
  logic[6:0] TSec, TMin, THrs, TDay, TDate, TMonth,     // clock/time 
             AMin, AHrs;		   // alarm setting
  logic[6:0] Min, Hrs, Day, Date, Month;
  logic Szero, Mzero, Hzero, Dzero, Datezero, 	   // "carry out" from sec -> min, min -> hrs, hrs -> days
        TMen, THen, TDen, TDateen, TMonthen, AMen, AHen; 

	always_comb begin
		TMen = Timeset? Minadv : Szero;
		THen = Timeset? Hrsadv : (Mzero && Szero);
		AMen = Alarmset && Minadv;
		AHen = Alarmset && Hrsadv;
		Min = (~Alarmset) ? TMin : AMin;
		Hrs = (~Alarmset) ? THrs : AHrs;
		Day = TDay;
		Date = TDate;
		Month = TMonth;
		TDen = Timeset? Dayadv : (Hzero && Mzero && Szero);
		TDateen = Timeset? Dateadv : (Hzero && Mzero && Szero);
		TMonthen = Timeset? Monthadv : (Datezero && Hzero && Mzero && Szero);
	end

// free-running seconds counter	-- be sure to set parameters on ct_mod_N modules
  ct_mod_N #(.N(NS)) Sct(
// input ports
    .clk(Pulse), .rst(Reset), .en(!Timeset), 
// output ports    
    .ct_out(TSec), .z(Szero)
    );
// minutes counter -- runs at either 1/sec or 1/60sec
  ct_mod_N #(.N(NS)) Mct(
    .clk(Pulse), .rst(Reset), .en(TMen), .ct_out(TMin), .z(Mzero)
    );
// hours counter -- runs at either 1/sec or 1/60min
  ct_mod_N #(.N(NH)) Hct(
	.clk(Pulse), .rst(Reset), .en(THen), .ct_out(THrs), .z(Hzero)
    );
// days counter -- runs at either 1/sec or 1/24hours
	ct_mod_N #(.N(NW)) Dct(
	.clk(Pulse), .rst(Reset), .en(TDen), .ct_out(TDay), .z(Dzero)
	);
// date counter -- runs at either 1/sec or 1/24hours
	ct_mod_date Datect(
	.clk(Pulse), .rst(Reset), .en(TDateen), .month(TMonth), .ct_out(TDate), .z(Datezero)
	);
// month counter -- runs at either 1/sec or 28/30/31days
	ct_mod_month #(.N(NM)) Monthct(
	.clk(Pulse), .rst(Reset), .en(TMonthen), .ct_out(TMonth), .z()
	);
// alarm set registers -- either hold or advance 1/sec
  ct_mod_N #(.N(NS)) Mreg(
// input ports
    .clk(Pulse), .rst(Reset), .en(AMen), 
// output ports    
    .ct_out(AMin), .z()
    ); 

  ct_mod_N #(.N(NH)) Hreg(
    .clk(Pulse), .rst(Reset), .en(AHen), .ct_out(AHrs), .z()
    ); 

// display drivers (2 digits each, 6 digits total)
  lcd_int Sdisp(
    .bin_in    (TSec)  ,
	.Segment1  (S1disp),
	.Segment0  (S0disp)
	);

  lcd_int Mdisp(
    .bin_in    (Min),
	.Segment1  (M1disp),
	.Segment0  (M0disp)
	);

  lcd_int Hdisp(
    .bin_in    (Hrs),
	.Segment1  (H1disp),
	.Segment0  (H0disp)
	);

  lcd_int Ddisp(
  	.bin_in		(Day),
	.Segment1	(),
	.Segment0	(D0disp)
	);
  lcd_int Datedisp(
	.bin_in		(Date),
	.Segment1	(Date1disp),
	.Segment0	(Date0disp)
	);
  lcd_int Monthdisp(
	.bin_in		(Month),
	.Segment1	(Month1disp),
	.Segment0	(Month0disp)
	);

// buzz off :)	  make the connections
  alarm a1(
    .tmin(TMin), .amin(AMin), .thrs(THrs), .ahrs(AHrs), .alarmon(Alarmon), .day(TDay), .buzz(Buzz)
	);

endmodule