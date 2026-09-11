module tick_generator #(
    parameter TICK_COUNT = 100
)(
    input  clk,
    input  reset,
    output reg tick
);
reg [31:0] counter;
  always @(posedge clk or posedge reset) begin
 if (reset) begin
        counter <= 32'd0;
        tick    <= 1'b0;
    end
  else begin
    if (counter == TICK_COUNT - 1) begin
         counter <= 32'd0;
         tick    <= 1'b1;
     end
   else begin
       counter <= counter + 32'd1;
         tick    <= 1'b0;
    end
    end
end
endmodule
