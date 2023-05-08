module ct_mod_month #(parameter N = 12) (
	input 					clk,
							rst,
							en,
	output logic[6:0]		ct_out,
	output logic			z);

	logic[6:0] next_ct;

	always_ff @(posedge clk)
		ct_out <= next_ct;

	always_comb
		if (rst)
			next_ct = 1;
		else if (en)
			next_ct = (ct_out) % N + 1;
		else 
			next_ct = ct_out;

	always_comb z = ct_out == N;

endmodule


				