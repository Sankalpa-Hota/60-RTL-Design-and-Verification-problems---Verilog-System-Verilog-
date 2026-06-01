/* Build a circuit that reads a sequence of bits (one bit per clock cycle) from the input (din), and shifts the bits into the least significant bit of the output (dout). Assume all bits of the output are 0 to begin with.

Once the number of input bits received is larger than DATA_WIDTH, only the DATA_WIDTH most recent bits are kept in the output. */

module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input din,
  output logic [DATA_WIDTH-1:0] dout
);
reg [DATA_WIDTH-1:0] temp;
assign dout = temp;  //Dont assign <= , combinatorial always = 
always@(posedge clk)begin
  if(!resetn)begin
    dout <= 0;
    temp <= 0;

  end
  else begin
    temp<=temp<<1; //As per question for left shift
    temp[0]<=din;  //As per question to add at the LSB (The incoming bit)
  end
end
endmodule