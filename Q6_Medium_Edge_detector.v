/* Build a circuit that pulses dout one cycle after the rising edge of din. A pulse is defined as writing a single-cycle 1 as shown in the examples below. When resetn is asserted, the value of din should be treated as 0. */

module model (
  input clk,
  input resetn,
  input din,
  output dout
);

//Start here ->
reg temp;
reg temp_pulse;
assign dout = temp_pulse;
always@(posedge clk )begin
  if(!resetn)begin                 //Sync reset
    temp = 1'b0;
    temp_pulse = 1'b0;
  end
  else begin
    temp <= din;                  //Adding delay
    temp_pulse <= din & ~(temp);  //Pulse
  end
end


endmodule

//Learn on how to get a plus = (Current Value) & (Prev Value)
//Sync reset
//Delay = Using an extra reg