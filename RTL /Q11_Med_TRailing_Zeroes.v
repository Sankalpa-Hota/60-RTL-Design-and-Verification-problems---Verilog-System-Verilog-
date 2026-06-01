//Find the number of trailing 0s in the binary representation of the input (din). If the input value is all 0s, the number of trailing 0s is the data width (DATA_WIDTH)

module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);
integer i;
reg [$clog2(DATA_WIDTH):0] count_1;
assign dout = count_1;
always@(*)begin
  count_1 = 'b0;
  if (din == 'b0)begin
    count_1 = DATA_WIDTH ;
  end
  else begin
    for(i = 0 ; i < DATA_WIDTH ; i =i+1) begin
      if((din > 0) && (din[i] == 0 ))begin
        count_1 = count_1+1'b1;  //count all zeroes from LSB
      end
      else begin
        i = DATA_WIDTH;   // This is where you need to think -> When you hit first 1 end the FOR LOOP
      end
    end
  end
end
endmodule

//Learn to end FOR loop in verilog