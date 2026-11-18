`timescale 1ns/1ps
module tb_dec3_8;
    reg        en;
    reg  [2:0] a;
    wire [7:0] y;
    reg  [7:0] expected;
    integer i;
    integer errors;

    dec3_8 dut (.en(en), .a(a), .y(y));

    initial begin
        errors = 0;
        for (i = 0; i < 16; i = i + 1) begin
            {en, a} = i;
            #1;

            // expected value from the truth table: y[a] = en
            expected = 8'b0000_0000;
            if (en) expected[a] = 1'b1;

            if (y !== expected) begin
                errors = errors + 1;
                $display("FAIL en=%b a=%b y=%b expected=%b", en, a, y, expected);
            end
        end

        if (errors == 0) $display("ALL PASS (16/16)");
        else             $display("FAILED: %0d errors", errors);
        $finish;
    end
endmodule