module sequence_controller (
    input       clk,
    input       reset,
    input       tick,
    output reg [1:0] sequence_address
);
always @(posedge clk or posedge reset) begin
    if (reset)
        sequence_address <= 2'd0;
    else if (tick) begin
        if (sequence_address == 2'd3)
            sequence_address <= 2'd0;
        else
            sequence_address <= sequence_address + 2'd1;
    end
end
endmodule



