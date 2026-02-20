/*Build a circuit that takes the multi-bit input (din) and shifts the input value’s least significant bit (rightmost bit) to the single-bit output (dout) one bit at a time.

The circuit should begin shifting the input’s least significant bit when the the input enable signal (din_en) goes high. In other words, the input enable signal going high indicates that this circuit should start shifting the current input signal from it’s least significant bit, regardless of which bits the circuit has already shifted.

If all the input’s bits have been shifted to the output so that there are no more bits to shift, the output must output 0.

When reset (resetn) is active, the input value that is being shifted is treated as 0. Even when reset goes back to being inactive, the input value will still be treated as 0, unless the input enable signal makes the circuit begin shifting from the input again.*/

module model #(parameter
  DATA_WIDTH = 16
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  input din_en,
  output logic dout
);
reg [DATA_WIDTH-1:0] temp;
always@(posedge clk)begin
  if(!resetn)begin
    temp <= {DATA_WIDTH{1'b0}};
    dout <= 1'b0;
  end
  else if (din_en) begin.  //Only if enable is 1 then only we store the input in buffer temp for PISO
  
   dout<=din[0];           //Since the requirement is the cycle we get EN we need the latest o/p
   temp <= din >> 1;

  end
  else begin
    dout <= temp[0];     //output is getting the last bit data
    temp <= temp >> 1;  //To push the data to right as out needs the last bit of data
  end
end
endmodule

//Learn Left and right shift
//Learn PISO Architecture
