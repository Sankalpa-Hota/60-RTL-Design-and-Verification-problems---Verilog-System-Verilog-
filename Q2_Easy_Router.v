//Example of Router with EN signal , Address to decide where din goes
//Classic Example of Case base code design

/*Build a router circuit which forwards data from the input (din) to one of four outputs (dout0, dout1, dout2, or dout3), specified by the address input (addr).

The address is a two bit value whose decimal representation determines which output value to use. Append to dout the decimal representation of addr to get the output signal name dout{address decimal value}. For example, if addr=b11 then the decimal representation of addr is 3, so the output signal name is dout3.

The input has an enable signal (din_en), which allows the input to be forwarded to an output when enabled. If an output is not currently being driven to, then it should be set to 0.

Input and Output Signals
din - Input data.
din_en - Enable signal for din. Forwards data from input to an output if 1, does not forward data otherwise.
addr - Two bit destination address. For example addr = b11 = 3 indicates din should be forwarded to output value 3 (dout3).
dout0 - Output 0. Corresponds to addr = b00.
dout1 - Output 1. Corresponds to addr = b01.
dout2 - Output 2. Corresponds to addr = b10.
dout3 - Output 3. Corresponds to addr = b11.
*/
module Router model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  input  din_en,
  input  [1:0] addr,
  output logic [DATA_WIDTH-1:0] dout0,
  output logic [DATA_WIDTH-1:0] dout1,
  output logic [DATA_WIDTH-1:0] dout2,
  output logic [DATA_WIDTH-1:0] dout3
);

always@(addr) begin
  if (din_en)begin
    case(addr)
      2'b00 : begin //Method to use multiple commands for case
        dout0 = din ; 
        dout1 = 32'b0 ; 
        dout2 = 32'b0 ;
        dout3 = 32'b0;
      end
      2'b01 : begin 
        dout1 = din ; 
        dout0 = 32'b0 ; 
        dout2 = 32'b0 ;
        dout3 = 32'b0;
      end
      2'b10 : begin 
        dout2 = din ; 
        dout1 = 32'b0 ; 
        dout0 = 32'b0 ;
        dout3 = 32'b0;
      end
      2'b11 : begin 
        dout3 = din ; 
        dout1 = 32'b0 ; 
        dout2 = 32'b0 ;
        dout0 = 32'b0;
      end
    endcase
  end
  else begin
    dout2 = 32'b0; 
    dout1 = 32'b0 ; 
    dout0 = 32'b0 ;
    dout3 = 32'b0;
  end
end
endmodule
