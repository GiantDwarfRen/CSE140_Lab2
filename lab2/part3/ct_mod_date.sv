module ct_mod_date #(parameter X = 31, Y = 30, Z = 28)(
	input				clk,
						rst,
						en,
	input[3:0]			month,
	output logic[6:0]	ct_out,
	output logic		z
);

	logic[6:0] next_ct;
	logic[4:0] date_of_month = X;

	always_comb
		if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12)
			date_of_month = X;
		else if (month == 4 || month == 6 || month == 9 || month == 11)
			date_of_month = Y;
		else 
			date_of_month = Z;

	always_ff @(posedge clk)
		ct_out <= next_ct;

	always_comb
		if (rst) 
			next_ct = 1;
		else if (en)
			next_ct = (ct_out) % date_of_month + 1;
		else
			next_ct = ct_out;

	always_comb z = ct_out == (date_of_month);

endmodule