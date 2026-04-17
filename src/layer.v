module layer(
    input clk,

    input signed [7:0] x1, x2, x3,

    input signed [7:0] w11, w12, w13,
    input signed [7:0] w21, w22, w23,
    input signed [7:0] w31, w32, w33,

    output signed [15:0] out1, out2, out3
);

neuron n1 (.clk(clk), .x1(x1), .x2(x2), .x3(x3),
           .w1(w11), .w2(w12), .w3(w13),
           .out(out1));

neuron n2 (.clk(clk), .x1(x1), .x2(x2), .x3(x3),
           .w1(w21), .w2(w22), .w3(w23),
           .out(out2));

neuron n3 (.clk(clk), .x1(x1), .x2(x2), .x3(x3),
           .w1(w31), .w2(w32), .w3(w33),
           .out(out3));

endmodule
