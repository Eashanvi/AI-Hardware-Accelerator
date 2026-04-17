module mac(
    input signed [7:0] a, b,
    input signed [15:0] acc_in,
    output signed [15:0] acc_out
);

assign acc_out = acc_in + (a * b);

endmodule
