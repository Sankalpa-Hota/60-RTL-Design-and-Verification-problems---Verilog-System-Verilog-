/* Given an input (din), output (dout) a 1 if its binary representation is a palindrome and a 0 otherwise.

A palindrome binary representation means that the binary representation has the same sequence of bits whether you read it from left to right or right to left. Leading 0s are considered part of the input binary representation.

Input and Output Signals
din - Input value
dout - 1 if the binary representation is a palindrome, 0 otherwise */

module model #(parameter
  DATA_WIDTH=32
) (
  input [DATA_WIDTH-1:0] din,
  output logic dout
);
integer i;
reg bit_1;
reg bit_0;
assign dout = bit_0;
always@(*)begin
  for(i=0;i<DATA_WIDTH;i=i+1)begin
    if(din[i]==din[DATA_WIDTH-1-i])begin //comparing first and last values
      bit_1 = 1'b1;
    end
    else begin
      bit_1 = 1'b0;
      i = DATA_WIDTH;  //breaking the loop concept
    end
  end
  bit_0 = bit_1;
end
    

endmodule
