module sequence_memory (
    input  [1:0] address,
    output reg [7:0] duty0,
    output reg [7:0] duty1,
    output reg [7:0] duty2,
    output reg [7:0] duty3,
    output reg [7:0] duty4,
    output reg [7:0] duty5,
    output reg [7:0] duty6,
    output reg [7:0] duty7
);
always @(*) begin
    case (address)
        // Sequence 0
        2'd0: begin
            duty0 = 8'd64;    // 25%
            duty1 = 8'd128;   // 50%
            duty2 = 8'd192;   // 75%
            duty3 = 8'd255;   // ~100%
            duty4 = 8'd32;    // 12.5%
            duty5 = 8'd96;    // 37.5%
            duty6 = 8'd160;   // 62.5%
            duty7 = 8'd224;   // 87.5%
        end
        // Sequence 1
        2'd1: begin
            duty0 = 8'd128;   // 50%
            duty1 = 8'd192;   // 75%
            duty2 = 8'd64;    // 25%
            duty3 = 8'd0;     // 0%
            duty4 = 8'd64;
            duty5 = 8'd128;
            duty6 = 8'd192;
            duty7 = 8'd255;
        end
        // Sequence 2
        2'd2: begin
            duty0 = 8'd192;   // 75%
            duty1 = 8'd64;    // 25%
            duty2 = 8'd128;   // 50%
            duty3 = 8'd128;   // 50%
            duty4 = 8'd96;
            duty5 = 8'd160;
            duty6 = 8'd224;
            duty7 = 8'd32;
        end
        // Sequence 3
        2'd3: begin
            duty0 = 8'd255;   // ~100%
            duty1 = 8'd0;     // 0%
            duty2 = 8'd64;    // 25%
            duty3 = 8'd192;   // 75%
            duty4 = 8'd128;
            duty5 = 8'd64;
            duty6 = 8'd192;
            duty7 = 8'd96;
        end
        default: begin
            duty0 = 8'd0;
            duty1 = 8'd0;
            duty2 = 8'd0;
            duty3 = 8'd0;
            duty4 = 8'd0;
            duty5 = 8'd0;
            duty6 = 8'd0;
            duty7 = 8'd0;
        end
    endcase
end
endmodule
