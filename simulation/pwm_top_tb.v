module pwm_top_tb;
reg clk;
reg reset;
wire [7:0] pwm_out;
// Instantiate DUT
pwm_top uut (
    .clk(clk),
    .reset(reset),
    .pwm_out(pwm_out)
);
// Clock Generation
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
// Reset
initial begin
    reset = 1'b1;
    #20;
    reset = 1'b0;
end
// Simulation
initial begin
    #5000;
    $finish;
end
endmodule
