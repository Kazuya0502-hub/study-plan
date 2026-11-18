`timescale 1ns/1ps
module tb_dec2_4;
    reg        en;
    reg  [1:0] a;
    wire [3:0] y;
    reg  [3:0] expected;
    integer i;
    integer errors;

    dec2_4 dut (.en(en), .a(a), .y(y));

    initial begin
        errors = 0;
        for (i = 0; i < 8; i = i + 1) begin
            {en, a} = i;
            #1;

            // expected value from the truth table
            case ({en, a})
                3'b000: expected = 4'b0000;
                3'b001: expected = 4'b0000;
                3'b010: expected = 4'b0000;
                3'b011: expected = 4'b0000;
                3'b100: expected = 4'b0001;
                3'b101: expected = 4'b0010;
                3'b110: expected = 4'b0100;
                3'b111: expected = 4'b1000;
            endcase

            if (y !== expected) begin
                errors = errors + 1;
                $display("FAIL en=%b a=%b y=%b expected=%b", en, a, y, expected);
            end
        end

        if (errors == 0) $display("ALL PASS (8/8)");
        else             $display("FAILED: %0d errors", errors);
        $finish;
    end
endmodule