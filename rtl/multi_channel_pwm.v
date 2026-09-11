module multi_channel_pwm (
    input        clk,
    input        reset,
    input  [7:0] duty0,
    input  [7:0] duty1,
    input  [7:0] duty2,
    input  [7:0] duty3,
    input  [7:0] duty4,
    input  [7:0] duty5,
    input  [7:0] duty6,
    input  [7:0] duty7,
    output [7:0] pwm_out
);
pwm_8bit pwm0 (
    .clk(clk),
    .reset(reset),
    .duty_cycle(duty0),
    .pwm_out(pwm_out[0])
);
pwm_8bit pwm1 (
    .clk(clk),
    .reset(reset),
    .duty_cycle(duty1),
    .pwm_out(pwm_out[1])
);
pwm_8bit pwm2 (
    .clk(clk),
    .reset(reset),
    .duty_cycle(duty2),
    .pwm_out(pwm_out[2])
);
pwm_8bit pwm3 (
    .clk(clk),
    .reset(reset),
    .duty_cycle(duty3),
    .pwm_out(pwm_out[3])
);
pwm_8bit pwm4 (
    .clk(clk),
    .reset(reset),
    .duty_cycle(duty4),
    .pwm_out(pwm_out[4])
);
pwm_8bit pwm5 (
    .clk(clk),
    .reset(reset),
    .duty_cycle(duty5),
    .pwm_out(pwm_out[5])
);
pwm_8bit pwm6 (
    .clk(clk),
    .reset(reset),
    .duty_cycle(duty6),
    .pwm_out(pwm_out[6])
);
pwm_8bit pwm7 (
    .clk(clk),
    .reset(reset),
    .duty_cycle(duty7),
    .pwm_out(pwm_out[7])
);
endmodule
