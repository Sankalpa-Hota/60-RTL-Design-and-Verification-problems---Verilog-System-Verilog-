//Async FIFO Design
module ( input clk , rst_n , d ,
        output qb,
        output reg q );
  assign qb = ~q;
        always@ (posedge clk ,negedge rst_n)begin
    if ( !rst_n ) begin
      q  <= 0;
    end
    else begin
      q <= d;
    end
endmodule

// Industry standard is using negedge rst as asynchronous so that they reduce power loss. 1->0 has low power loss compared to 0->1

    
