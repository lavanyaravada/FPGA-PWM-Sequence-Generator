module pwm_top (
    input        clk,
    input        reset,
    output [7:0] pwm_out
);
wire tick;
wire [1:0] sequence_address;
wire [7:0] duty0;
wire [7:0] duty1;
wire [7:0] duty2;
wire [7:0] duty3;
wire [7:0] duty4;
wire [7:0] duty5;
wire [7:0] duty6;
wire [7:0] duty7;
// Tick Generator
tick_generator #(
    .TICK_COUNT(100)
)
tick_gen (
    .clk(clk),
    .reset(reset),
    .tick(tick)
);
// Sequence Controller
sequence_controller seq_ctrl (
    .clk(clk),
    .reset(reset),
    .tick(tick),
    .sequence_address(sequence_address)
);
// Sequence Memory
sequence_memory seq_mem (
    .address(sequence_address),
    .duty0(duty0),
    .duty1(duty1),
    .duty2(duty2),
    .duty3(duty3),
    .duty4(duty4),
    .duty5(duty5),
    .duty6(duty6),
    .duty7(duty7)
);
// 8-Channel PWM
multi_channel_pwm pwm_channels (
    .clk(clk),
    .reset(reset),
    .duty0(duty0),
    .duty1(duty1),
    .duty2(duty2),
    .duty3(duty3),
    .duty4(duty4),
    .duty5(duty5),
    .duty6(duty6),
    .duty7(duty7),
    .pwm_out(pwm_out)
);

endmodule
