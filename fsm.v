module fsm (clk,tick,trigger,time_out,en_lfsr,start_delay,LEDR);

	input clk,tick,trigger,time_out;
	
	output en_lfsr,start_delay;
	
	output [9:0] LEDR; 


	reg [11:0] state; //4 bit state
	reg [9:0] LEDR;
	reg en_lfsr,start_delay;
	parameter 
	IDLE = 12'b000000000001, 
	S_1 = 12'b000000000010,
	S_2 = 12'b000000000100,
	S_3 = 12'b000000001000,
	S_4 = 12'b000000010000,
	S_5 = 12'b000000100000,
	S_6 = 12'b000001000000,
	S_7 = 12'b000010000000,
	S_8 = 12'b000100000000,
	S_9 = 12'b001000000000,
	S_10 = 12'b010000000000,
	S_11 = 12'b100000000000;
	
	
	
	
initial begin
en_lfsr = 1'b0;
start_delay = 1'b0;

state = IDLE;
end



always @ (posedge clk)
		case(state)
		IDLE: if (trigger == 1 && tick == 1'b1)
		         state <= S_1;
		S_1: if(tick == 1)
		         state <= S_2;
		S_2: if(tick == 1)
		         state <= S_3;
		S_3: if(tick == 1)
		         state <= S_4;
		S_4: if(tick == 1)
		         state <= S_5;
		S_5: if(tick == 1)
		         state <= S_6;
		S_6: if(tick == 1)
		         state <= S_7;
		S_7: if(tick == 1)
		         state <= S_8;
		S_8: if(tick == 1)
		         state <= S_9;
		S_9: if(tick == 1)
		         state <= S_10;
		S_10: if(tick == 1)
		         state <= S_11;
		S_11: if(time_out == 1)
		         state <= IDLE;
	
		default:  ;	
		endcase


	always @ (*)
		case(state)
			IDLE: begin
			      LEDR [9:0] <= 10'b0000000000;	
					start_delay <= 1'b0;
				
				   end	
			S_1 : begin
			      LEDR [9:0] <= 10'b1000000000; 
					en_lfsr <= 1'b1;
					end	
			S_2 : LEDR [9:0] <= 10'b1100000000; 
			S_3 : LEDR [9:0] <= 10'b1110000000;
			S_4 : LEDR [9:0] <= 10'b1111000000; 
			S_5 : LEDR [9:0] <= 10'b1111100000; 
			S_6 : LEDR [9:0] <= 10'b1111110000; 
			S_7 : LEDR [9:0] <= 10'b1111111000; 
			S_8 : LEDR [9:0] <= 10'b1111111100; 
			S_9 : LEDR [9:0] <= 10'b1111111110; 
			S_10 : begin
			       LEDR [9:0] <= 10'b1111111111; 	
					 en_lfsr <= 1'b0;
					 start_delay <= 1'b1;
					 	
					 end
			S_11 :  LEDR [9:0] <= 10'b1111111111;
				
			endcase
			
endmodule
