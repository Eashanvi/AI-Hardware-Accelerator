module accelerator_tb;

reg clk;
reg start;

reg signed [7:0] x1, x2, x3;

wire done;
wire signed [15:0] out1, out2, out3;

// Instantiate
accelerator uut (
    .clk(clk),
    .start(start),
    .x1(x1), .x2(x2), .x3(x3),
    .done(done),
    .out1(out1),
    .out2(out2),
    .out3(out3)
);

// Clock
always #5 clk = ~clk;

initial begin
    clk = 0;
    start = 0;

    x1 = 1;
    x2 = 2;
    x3 = 3;

    #10;
    start = 1;

    #10;
    start = 0;

    #100;
    $finish;
end

endmodule
