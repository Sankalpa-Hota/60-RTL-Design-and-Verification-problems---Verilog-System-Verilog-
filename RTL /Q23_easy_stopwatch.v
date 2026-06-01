/* Build a module which controls a stopwatch timer.The timer starts counting when the start button (start) is pressed (pulses) and increases by 1 every clock cycle. When the stop button (stop) is pressed, the timer stops counting. When the reset button (reset) is pressed, the count resets to 0 and the timer stops counting.
If count ever reaches MAX, then it restarts from 0 on the next cycle. stop's functionality takes priority over start's functionality, and reset's functionality takes priority over both stop and start's functionality.*/

module model #(parameter
  DATA_WIDTH = 16,
  MAX = 99
) (
    input clk,
    input reset, start, stop,
    output logic [DATA_WIDTH-1:0] count
);
reg tag;
reg [DATA_WIDTH-1:0] count_1;
assign count = count_1 ;
always@(posedge clk)begin
  if (reset)begin
    count_1 <= 0;
    tag<= 0;
  end
  else if(stop)begin
      tag <= 0;
  end
  else if(start || tag)begin //This is to get the pulse and store it in tag bit
      tag<= 1'b1;
      count_1 <= (count_1< MAX)? count_1+ 1'b1 : 0;  //Priority sequence is handled by if else reset > Stop > start
  end
end
endmodule
