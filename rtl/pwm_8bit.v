module pwm_8bit (
    input        clk,
    input        reset,
    input  [7:0]  duty_cycle,
    output       pwm_out
);
reg [7:0] pwm_counter;
always @(posedge clk or posedge reset) begin
    if (reset)
        pwm_counter <= 8'd0;
    else
    pwm_counter <= pwm_counter + 8'd1;
end
assign pwm_out = (pwm_counter < duty_cycle);
endmodule
