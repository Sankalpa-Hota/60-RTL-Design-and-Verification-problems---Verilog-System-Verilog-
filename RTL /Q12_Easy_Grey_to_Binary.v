module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] gray,
  output logic [DATA_WIDTH-1:0] bin
);
integer i;
always@ (*)begin
  for(i =DATA_WIDTH-1 ; i >= 0 ; i=i-1)begin  //for in reverse order
    if(i == DATA_WIDTH -1)begin
      bin[DATA_WIDTH-1]=gray[DATA_WIDTH-1];
    end
    else begin
      bin[i]=bin[i+1]^gray[i];  //Logic for conversion of grey to binary
    end
  end

  
 end
endmodule
