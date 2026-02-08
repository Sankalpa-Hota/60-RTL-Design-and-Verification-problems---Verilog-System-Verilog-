module model #(parameter
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
      2'b00 : begin 
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