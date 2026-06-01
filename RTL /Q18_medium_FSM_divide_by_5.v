module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);
logic [2:0] state;
assign dout = (state == 3'b000);
always@(posedge clk)begin
  if(!resetn)begin
    state <= 3'b101;
  end
  else begin
    case(state)
    3'b000: state <= (din)? 3'b001 : 3'b000;
    3'b001: state <= (din)? 3'b011 : 3'b010;
    3'b010: state <= (din)? 3'b000 : 3'b100;
    3'b011: state <= (din)? 3'b010 : 3'b001;
    3'b100: state <= (din)? 3'b100 : 3'b011;
    3'b101: state <= (din)? 3'b001 : 3'b000; //After reset if we set to state 00 dout becomes 1 , to avoid that we need another state
    endcase
  end
end

endmodule
