module weight_rom(
    input [1:0] addr,
    output reg [7:0] w1, w2, w3
);

always @(*) begin
    case(addr)
        2'b00: begin w1=1; w2=1; w3=1; end
        2'b01: begin w1=2; w2=2; w3=2; end
        2'b10: begin w1=3; w2=3; w3=3; end
        default: begin w1=0; w2=0; w3=0; end
    endcase
end

endmodule
