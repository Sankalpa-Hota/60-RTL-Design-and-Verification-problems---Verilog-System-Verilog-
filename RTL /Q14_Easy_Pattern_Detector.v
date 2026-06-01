/*Given a stream of input bits, pulse a 1 on the output (dout) whenever a b1010 sequence is detected on the input (din).
When the reset-low signal (resetn) goes active, all previously seen bits on the input are no longer considered when searching for b1010. */
module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);
reg [2:0]state ;
assign dout = (state == 3'b100)? 1'b1 : 1'b0;  // Assignment logic , Also can be inside always blocks inside the case statements

always@ (posedge clk) begin
  if(!resetn)begin
    state <= 3'b000;
  end
  else begin
    case( state)  //FSM state transitions
      3'b000 : state <= (din) ? 3'b001 : 3'b000 ; 
      3'b001 : state <= (din) ? 3'b001 : 3'b010;
      3'b010 : state <= (din) ? 3'b011 : 3'b000 ;
      3'b011 : state <= (din) ? 3'b001 : 3'b100 ;
      3'b100 : state <= (din) ? 3'b011 : 3'b000;
      default : state <= 3'b000;
    endcase
  end
end

endmodule
