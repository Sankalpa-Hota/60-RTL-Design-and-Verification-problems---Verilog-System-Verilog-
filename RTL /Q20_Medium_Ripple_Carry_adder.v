/*A Ripple Carry Adder (RCA) is a multi-bit addition circuit composed of a number of cascaded full adders (FAs).  In an RCA, the carry-out bit of stage i is propagated to the carry-in port, cin, of stage i+1 so that the carry bit ripples through the entire chain of FAs, from the least significant bit (LSB) to the most significant bit (MSB).
This question must be solved using a multimodule approach.  That is, there must be a module for a single-bit FA that is instantiated DATA_WIDTH times in order to build a multi-bit RCA.  You will be able to use the (Full Adder)module as the single-bit FA module.
*/


`include "full_adder.sv"
module model #(parameter
    DATA_WIDTH=8
) (
    input [DATA_WIDTH-1:0] a,
    input [DATA_WIDTH-1:0] b,
    output logic [DATA_WIDTH-0:0] sum,
    output logic [DATA_WIDTH-1:0] cout_int
);
genvar i ;
generate
    for(i=0;i<DATA_WIDTH;i=i+1)begin
        if(i==0)begin
          full_adder f0(.a(a[i]),.b(b[i]),.cin(1'b0),.sum(sum[i]),.cout(cout_int[i]));  //0th bit doesnt have an c_in
        end
        else begin
          full_adder f0(.a(a[i]),.b(b[i]),.cin(cout_int[i-1]),.sum(sum[i]),.cout(cout_int[i])); //Instantiating another FA adder
        end
    end
endgenerate
  assign sum[DATA_WIDTH]=cout_int[DATA_WIDTH-1]; //MSB of Sum == MSB of Cout (i = DATA_WIDTH not covered in the for loop)
endmodule
