module rollover (
    input wire [2:0] name,
    output wire [4:0] limit
);

    always @(*) begin
        case(name)         // 012345678901234567
            0: limit = 11; // Gerry Chen .
            1: limit = 17; // Fonda Chen Kelly .
            2: limit = 10; // Jim Kelly .
            3: limit = 11; // Aven Kelly .
                           // 012345678901234567
            4: limit = 13; // Virginia Pan .
            5: limit = 11; // Hanna Chen .
            6: limit = 11; // Xinfu Chen .
            7: limit = 11; // Joyce Chen .
        endcase
    end

endmodule
