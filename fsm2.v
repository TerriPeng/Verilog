module fsm2 (clk,tick,trigger,time_out,react,en_lfsr,start_delay,LEDR,enable,reset);

	input clk,tick,trigger,time_out,react;
	
	output en_lfsr,start_delay,enable,reset;
	
	output [9:0] LEDR; 


	reg [12:0] state; //4 bit state
	reg [9:0] LEDR;
	reg en_lfsr,start_delay,enable,reset;
	
	parameter 
	IDLE = 13'b0000000000001, 
	S_1 =  13'b0000000000010,
	S_2 =  13'b0000000000100,
	S_3 =  13'b0000000001000,
	S_4 =  13'b0000000010000,
	S_5 =  13'b0000000100000,
	S_6 =  13'b0000001000000,
	S_7 =  13'b0000010000000,
	S_8 =  13'b0000100000000,
	S_9 =  13'b0001000000000,
	S_10 = 13'b0010000000000,
	S_11 = 13'b0100000000000,
	S_12 = 13'b1000000000000;
	
	
	
initial begin
en_lfsr <= 1'b0;
start_delay <= 1'b0;
// enable =1'b0;
//reset = 1'b0;
state <= IDLE;
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
		         state <= S_12;
		S_12: if(react==1)
					state <= IDLE;
		default:  ;	
		endcase


	always @ (*)
		case(state)
			IDLE: begin
			      LEDR [9:0] <= 10'b0000000000;	
					start_delay <= 1'b0;
					
					enable<=1'b0;
				   end	
			S_1 : begin
			      LEDR [9:0] <= 10'b1000000000; 
					en_lfsr <= 1'b1;
					reset<=1'b1;
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
			S_11 :  begin LEDR [9:0] <= 10'b1111111111;
							start_delay <= 0;
	         end
			 S_12: begin
					 LEDR[9:0] <= 10'b0000000000;
					 enable <= 1'b1;
					 end		
		endcase
			
endmodule
