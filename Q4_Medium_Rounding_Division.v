/* Divide an input number by a power of two and round the result to the nearest integer. The power of two is calculated using 2DIV_LOG2 where DIV_LOG2 is a module parameter. Remainders of 0.5 or greater should be rounded up to the nearest integer. If the output were to overflow, then the result should be saturated instead. */

module model #(parameter
  DIV_LOG2=3,
  OUT_WIDTH=32,
  IN_WIDTH=OUT_WIDTH+DIV_LOG2
) (
  input [IN_WIDTH-1:0] din,
  output logic [OUT_WIDTH-1:0] dout
);
always@(*)begin
  if (din/(2<<(DIV_LOG2-1)) >= (2<<(OUT_WIDTH-1))-1 )begin //It is the saturation logic
    dout = (2<<(OUT_WIDTH-1))-1;
  end
  else begin
    assign dout = (din%(2<<(DIV_LOG2-1))>=(2<<(DIV_LOG2-2))) ? ((din/(2<<(DIV_LOG2-1)))+1): (din/(2<<(DIV_LOG2-1))); // It is the rounding off logic
  end
end 
endmodule

//For rounding off we are gettting the remainder using % and comparing it to divisor/2 to round off.
//In case of saturation we are just setting up max value
//Note 2<< X -> 2*(2^X) not 2^X -> So beware 