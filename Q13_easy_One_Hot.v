/* One-hot values have a single bit that is a 1 with all other bits being 0. Output a 1 if the input (din) is a one-hot value, and output a 0 otherwise.*/

module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic onehot
);
reg [DATA_WIDTH-1:0] count_1;
integer i;
always@(*)begin
  count_1 = 0;
  for(i=0;i<DATA_WIDTH;i=i+1) begin
    if (din[i]==1'b1)begin
      count_1 = count_1+ 1'b1;
    end
    else begin
      count_1 = count_1;
    end
  end
  if(count_1 != 1'b1)begin
    onehot = 1'b0;
  end
  else begin
    onehot = 1'b1;
  end
end
endmodule
