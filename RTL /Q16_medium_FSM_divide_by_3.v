/* Design a circuit that determines whether an input value is evenly divisible by three.

The input value is of unknown length and is left-shifted one bit at a time into the circuit via the input (din). The circuit should output a 1 on the output (dout) if the current cumulative value is evenly divisible by three, and a 0 otherwise.

When resetn is asserted, all previous bits seen on the input are no longer considered. The 0 seen during reset should not be included when calculating the next value.

This problem is tricky, so it may help to think in terms of modulus and remainder states.*/

module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);
logic [1:0] state;
assign dout = (state == 2'b00);
always@(posedge clk)begin
  if(!resetn)begin
    state <= 2'b11;
  end
  else begin
    case(state)
    2'b00: state <= (din)? 2'b01 : 2'b00;
    2'b01: state <= (din)? 2'b00 : 2'b10;
    2'b10: state <= (din)? 2'b10 : 2'b01;
    2'b11: state <= (din)? 2'b01 : 2'b00; //After reset if we set to state 00 dout becomes 1 , to avoid that we need another state
    endcase
  end
end

endmodule
