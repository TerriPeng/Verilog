module reaction (time_out,tick_ms,reaction_time,trigger,reset);
input time_out,tick_ms,trigger,reset;
output [14:0] reaction_time;
reg [14:0] reaction_time;

initial reaction_time = 0;

reg sig;

initial sig =0;

always @ (posedge tick_ms) begin
	if(reset == 1)
		reaction_time <= 15'b0;
		
	if (time_out ==1)
		sig=1;
	if(trigger ==1)
		sig =0;
		
	if(sig ==1)
		reaction_time <= reaction_time +1;
end

endmodule 	
