/*Design a simple 1-read/write (1RW) register file (RF) by using a multidimentional array of flip-flops in Verilog.
The RF should have 8 entries with each entry being an 8-bit digital word.  The input word din is written to one of the 8 entries of the RF by using the 3-bit port addr and asserting signal wr.  An entry is retrieved from the RF by selecting the address and asserting the rd signal.  If one tries to read from an address that has never been written to, then dout and error should both output zero.
This is a simple RF so it should support only one operation per clock cycle, either a read or write.  If both rd and wr ports are set to logic level high in a cycle, then error is asserted, and dout is set to zero in order to indicate the operation has failed.

Input and Output Signals
din - Input data port
addr - Address input to the flip-flop array
wr - Write-enable input signal
rd - Read-enable input signal
clk - Clock signal
resetn - Synchronous, active-low, reset signal
dout - Output data port
error - Error signal - Invalid operation

Output signals during reset
dout - 0
error - 0*/

module model (
    input [7:0] din,
    input [2:0] addr,
    input wr,
    input rd,
    input clk,
    input resetn,
    output logic [7:0] dout,
    output logic error
);
integer i;
reg [7:0]Fifo_array[7:0];
always@(posedge clk)begin
    if(!resetn)begin
        dout<= 0;
        error <=0;
      for (i = 0; i < 8; i = i + 1) begin  //For a 2D array make sure inputs also go in a 2D fashion. I did mistake by sending 64'b0;
            Fifo_array[i] <= 8'b0;  
        end
    end
    else begin
      if(wr && !rd)begin  //Write criteria
            error<= 1'b0;
            Fifo_array[addr]<=din;
            dout<=8'b0;
        end
      else if(rd && !wr)begin //Read Criteria
            error<= 1'b0;
            dout<=Fifo_array[addr];
            
        end
      else if (rd && wr)begin //Error Criteria
            error<= 1'b1;
            dout<=8'b0;   //I missed this
        end
      else if(!rd && !wr)begin //No operation criteria //I missed this
            error <= 1'b0;
            dout<=8'b0;
        end
    end
end

endmodule
