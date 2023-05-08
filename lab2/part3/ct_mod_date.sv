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
		case(month)
			'd1: date_of_month = X;
			'd3: date_of_month = X;
			'd5: date_of_month = X;
			'd7: date_of_month = X;
			'd8: date_of_month = X;
			'd10: date_of_month = X;
			'd12: date_of_month = X;
			'd4: date_of_month = Y;
			'd6: date_of_month = Y;
			'd9: date_of_month = Y;
			'd11: date_of_month = Y;
			'd2: date_of_month = Z;
		endcase

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