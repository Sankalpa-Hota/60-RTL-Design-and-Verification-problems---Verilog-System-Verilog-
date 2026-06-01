/*Reverse the bits of an input value's binary representation.*/

module model #(parameter
  DATA_WIDTH=32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);
//Start here
reg [DATA_WIDTH-1:0] temp;
genvar i ;  //Genvar use in hardware
assign dout = temp;
generate //Generate and end generate are neccesary for hardware
  for(i=0; i<DATA_WIDTH ; i=i+1)begin
    assign temp[i]=din[DATA_WIDTH-i-1];  //Learn Indexing
  end
endgenerate

endmodule

//We learnt genvar and generate are non procedural only only for combinatorial
//We can access a Reg / wire at its bit level with X[i]
//Use of assign statement for combinatorial logics
//For loop in hardware
//Indexing -> din[DATA_WIDTH] is out of bounds -> din[DATA_WIDTH-1] is correct