module rollover (
    input wire [2:0] name,
    output wire [4:0] limit
);

    assign limit = (name == 3'b000) ? 11 :  // Gerry Chen
                   (name == 3'b001) ? 17 :  // Fonda Chen-Kelly
                   (name == 3'b010) ? 10 :  // Jim Kelly
                   (name == 3'b011) ? 11 :  // Aven Kelly
                   (name == 3'b100) ? 13 :  // Virginia Pan
                   (name == 3'b101) ? 11 :  // Hanna Chen
                   (name == 3'b110) ? 11 :  // Xinfu Chen
                   (name == 3'b111) ? 11 :  // Joyce Chen
                    5'b11111;  // default

endmodule
