`timescale 1ns / 100ps //unit time in 1ns, resolution 100ps

module counter_16 (
	clock,
	enable,
	reset,
	count,
	);

	parameter BIT_SZ =16;
	input clock;
	input enable;
	input reset;
	
	output [BIT_SZ-1:0] count;

	//count needs to be declared as reg
	reg [BIT_SZ-1:0] count;

	//always initialise storage elements such as D-FF
	initial count = 0;

	//---main body of module---

	always @ (posedge clock)
	if (reset == 1'b1)
		count <= 0;
	else  if (enable == 1'b1 )
			count <= count + 1'b1;
		
			
	   
			
endmodule
		