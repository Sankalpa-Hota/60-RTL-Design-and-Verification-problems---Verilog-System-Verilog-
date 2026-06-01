/*Given an input binary value, output the number of bits that are equal to 1.*/

module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);
//Start here ->
integer i;
reg [$clog2(DATA_WIDTH):0] counter1;
assign dout = counter1;

always@(*) begin
  counter1 = 0;
  for(i=0 ;i<DATA_WIDTH; i= i+1)begin //This is how you use a for in combinatorial with always@ (*)
    if (din[i] & 1)begin
      counter1 = counter1 +1'b1;
    end
    else begin
      counter1 = counter1;
    end
  end
end
endmodule

//For get 1 we just need an condition statement for AND for updating counter