`default_nettype none

module tt_um_gchenfc_seven_segment_gerry #( parameter MAX_COUNT = 24'd10_000_000 ) (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire reset = ! rst_n;
    wire [6:0] led_out;
    assign uo_out[6:0] = led_out;
    assign uo_out[7] = 1'b0;

    // use bidirectionals as outputs
    assign uio_oe = 8'b11111111;

    // put bottom 8 bits of second counter out on the bidirectional gpio
    assign uio_out = second_counter[7:0];

    // Which name to display
    wire [2:0] name;
    assign name = ui_in[7:5];
    reg [2:0] prev_name;

    // external clock is 10MHz, so need 24 bit counter
    reg [23:0] second_counter;
    reg [4:0] digit;
    wire [4:0] digit_limit;

    // if external inputs are set then use that as compare count
    // otherwise use the hard coded MAX_COUNT
    wire [23:0] compare = ui_in[5:0] == 0 ? MAX_COUNT: {ui_in[4:2], 19'b0, ui_in[1:0]};

    always @(posedge clk) begin
        // if reset, set counter to 0
        if (reset || (name != prev_name)) begin
            second_counter <= 0;
            digit <= 0;
        end else begin
            // if up to 16e6
            if (second_counter == compare) begin
                // reset
                second_counter <= 0;

                // increment digit
                digit <= digit + 1'b1;

                // When the word is done, reset the digit
                if (digit >= digit_limit)
                    digit <= 0;

            end else
                // increment counter
                second_counter <= second_counter + 1'b1;
        end
        prev_name <= name;
    end

    // instantiate segment display
    seg7 seg7(.counter(digit), .name(name), .segments(led_out));

    rollover rollover(.name(name), .limit(digit_limit));

endmodule
