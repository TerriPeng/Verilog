 module lfsr15 (CLK,enable,data_out);
	//input clk;
	input CLK,enable;
	output [14:1] data_out;
	
	reg [14:1] sreg;

	initial sreg = 14'b1;
	
	always @ (posedge CLK)	
			if(enable == 1'b1) begin
			 sreg <= {sreg[13:1],sreg[14]^sreg[1]};
				end
	
	assign data_out = sreg;
				
endmodule 