
/*
      -- 1 --
     |       |
     6       2
     |       |
      -- 7 --
     |       |
     5       3
     |       |
      -- 4 --
*/

module seg7 (
    input wire [4:0] counter,
    input wire [2:0] name,
    output reg [6:0] segments
);

    always @(*) begin
        case(name)
            0:  // Gerry Chen
                case(counter)
                    //                7654321
                    0:  segments = 7'b0111101;  // G
                    1:  segments = 7'b1111011;  // e
                    2:  segments = 7'b1010000;  // r
                    3:  segments = 7'b1010000;  // r
                    4:  segments = 7'b1101110;  // y
                    5:  segments = 7'b0000000;  //
                    6:  segments = 7'b0111001;  // C
                    7:  segments = 7'b1110100;  // h
                    8:  segments = 7'b1111011;  // e
                    9:  segments = 7'b1010100;  // n
                    10: segments = 7'b0000000;  //
                    default:
                        segments = 7'b0000000;  //
                endcase
            1:  // Fonda Chen-Kelly
                case(counter)
                    //                7654321
                    0:  segments = 7'b1110001;  // F
                    1:  segments = 7'b1011100;  // o
                    2:  segments = 7'b1010100;  // n
                    3:  segments = 7'b1011110;  // d
                    4:  segments = 7'b1011111;  // a
                    5:  segments = 7'b0000000;  //
                    6:  segments = 7'b0111001;  // C
                    7:  segments = 7'b1110100;  // h
                    8:  segments = 7'b1111011;  // e
                    9:  segments = 7'b1010100;  // n
                    10: segments = 7'b0000000;  //
                    11: segments = 7'b1110101;  // K
                    12: segments = 7'b1111011;  // e
                    13: segments = 7'b0000110;  // l
                    14: segments = 7'b0000110;  // l
                    15: segments = 7'b1101110;  // y
                    16: segments = 7'b0000000;  //
                    default:
                        segments = 7'b0000000;  //
                endcase
            2:  // Jim Kelly
                case(counter)
                    //               7654321
                    0:  segments = 7'b0001110;  // J
                    1:  segments = 7'b0000100;  // i
                    2:  segments = 7'b0010100;  // m
                    3:  segments = 7'b0000000;  //
                    4:  segments = 7'b1110101;  // K
                    5:  segments = 7'b1111011;  // e
                    6:  segments = 7'b0000110;  // l
                    7:  segments = 7'b0000110;  // l
                    8:  segments = 7'b1101110;  // y
                    9:  segments = 7'b0000000;  //
                    default:
                        segments = 7'b0000000;  //
                endcase
            3:  // Aven Kelly
                case(counter)
                    //                7654321
                    0:  segments = 7'b1110111;  // A
                    1:  segments = 7'b0011100;  // v
                    2:  segments = 7'b1111011;  // e
                    3:  segments = 7'b1010100;  // n
                    4:  segments = 7'b0000000;  //
                    5:  segments = 7'b1110101;  // K
                    6:  segments = 7'b1111011;  // e
                    7:  segments = 7'b0000110;  // l
                    8:  segments = 7'b0000110;  // l
                    9:  segments = 7'b1101110;  // y
                    10: segments = 7'b0000000;  //
                    default:
                        segments = 7'b0000000;  //
                endcase
            4:  // Virginia Pan
                case(counter)
                    //                7654321
                    0:  segments = 7'b0111110;  // V
                    1:  segments = 7'b0000100;  // i
                    2:  segments = 7'b1010000;  // r
                    3:  segments = 7'b1101111;  // g
                    4:  segments = 7'b0000100;  // i
                    5:  segments = 7'b1010100;  // n
                    6:  segments = 7'b0000100;  // i
                    7:  segments = 7'b1011111;  // a
                    8:  segments = 7'b0000000;  //
                    9:  segments = 7'b1110011;  // P
                    10: segments = 7'b1011111;  // a
                    11: segments = 7'b1010100;  // n
                    12: segments = 7'b0000000;  //
                    default:
                        segments = 7'b0000000;  //
                endcase
            5:  // Hanna Chen
                case(counter)
                    //                7654321
                    0:  segments = 7'b1110110;  // H
                    1:  segments = 7'b1011111;  // a
                    2:  segments = 7'b1010100;  // n
                    3:  segments = 7'b1010100;  // n
                    4:  segments = 7'b1011111;  // a
                    5:  segments = 7'b0000000;  //
                    6:  segments = 7'b0111001;  // C
                    7:  segments = 7'b1110100;  // h
                    8:  segments = 7'b1111011;  // e
                    9:  segments = 7'b1010100;  // n
                    10: segments = 7'b0000000;  //
                    default:
                        segments = 7'b0000000;  //
                endcase
            6:  // Xinfu Chen
                case(counter)
                    //                7654321
                    0:  segments = 7'b1110110;  // X
                    1:  segments = 7'b0000100;  // i
                    2:  segments = 7'b1010100;  // n
                    3:  segments = 7'b1110001;  // f
                    4:  segments = 7'b0011100;  // u
                    5:  segments = 7'b0000000;  //
                    6:  segments = 7'b0111001;  // C
                    7:  segments = 7'b1110100;  // h
                    8:  segments = 7'b1111011;  // e
                    9:  segments = 7'b1010100;  // n
                    10: segments = 7'b0000000;  //
                    default:
                        segments = 7'b0000000;  //
                endcase
            7:  // Joyce Chen
                case(counter)
                    //                7654321
                    0:  segments = 7'b0001110;  // J
                    1:  segments = 7'b1011100;  // o
                    2:  segments = 7'b1101110;  // y
                    3:  segments = 7'b1011000;  // c
                    4:  segments = 7'b1111011;  // e
                    5:  segments = 7'b0000000;  //
                    6:  segments = 7'b0111001;  // C
                    7:  segments = 7'b1110100;  // h
                    8:  segments = 7'b1111011;  // e
                    9:  segments = 7'b1010100;  // n
                    10: segments = 7'b0000000;  //
                    default:
                        segments = 7'b0000000;  //
                endcase
            default:
                segments = 7'b0000000;  //
        endcase
    end
endmodule
