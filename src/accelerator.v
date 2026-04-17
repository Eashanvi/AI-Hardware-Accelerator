module accelerator(
    input clk,
    input start,

    input signed [7:0] x1, x2, x3,

    output reg done,
    output signed [15:0] out1, out2, out3
);

// FSM
reg [1:0] state;

parameter IDLE    = 2'b00,
          LOAD    = 2'b01,
          COMPUTE= 2'b10,
          DONE_S  = 2'b11;

initial begin
    state = IDLE;
end

// Weight wires
wire [7:0] w11, w12, w13;
wire [7:0] w21, w22, w23;
wire [7:0] w31, w32, w33;

// ROM
weight_rom r1 (.addr(2'b00), .w1(w11), .w2(w12), .w3(w13));
weight_rom r2 (.addr(2'b01), .w1(w21), .w2(w22), .w3(w23));
weight_rom r3 (.addr(2'b10), .w1(w31), .w2(w32), .w3(w33));

// FSM control
always @(posedge clk) begin
    case(state)

        IDLE: begin
            done <= 0;
            if (start)
                state <= LOAD;
        end

        LOAD: begin
            state <= COMPUTE;
        end

        COMPUTE: begin
            state <= DONE_S;
        end

        DONE_S: begin
            done <= 1;
            state <= IDLE;
        end

        default: state <= IDLE;

    endcase
end

// Datapath
layer l1 (
    .clk(clk),

    .x1(x1), .x2(x2), .x3(x3),

    .w11(w11), .w12(w12), .w13(w13),
    .w21(w21), .w22(w22), .w23(w23),
    .w31(w31), .w32(w32), .w33(w33),

    .out1(out1),
    .out2(out2),
    .out3(out3)
);

endmodule
