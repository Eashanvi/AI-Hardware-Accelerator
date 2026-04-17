module neuron(
    input clk,
    input signed [7:0] x1, x2, x3,
    input signed [7:0] w1, w2, w3,
    output reg signed [15:0] out
);

reg signed [15:0] mult1, mult2, mult3;

always @(posedge clk) begin
    mult1 <= x1 * w1;
    mult2 <= x2 * w2;
    mult3 <= x3 * w3;

    out <= mult1 + mult2 + mult3;
end

endmodule
