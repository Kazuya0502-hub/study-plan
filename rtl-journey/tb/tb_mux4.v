`timescale 1ns/1ps
module tb_mux4;
    reg  [1:0] s;
    reg  a, b, c, d;
    wire y;
    reg  expected;
    integer i;
    integer errors;

    mux4 dut (.a(a), .b(b), .c(c), .d(d), .s(s), .y(y));

    initial begin
        errors = 0;
        for (i = 0; i < 64; i = i + 1) begin
            {s, a, b, c, d} = i;
            #1;

            // expected value decided by s, not by the mux2 tree
            case (s)
                2'b00: expected = a;
                2'b01: expected = b;
                2'b10: expected = c;
                2'b11: expected = d;
            endcase

            if (y !== expected) begin
                errors = errors + 1;
                $display("FAIL s=%b a=%b b=%b c=%b d=%b y=%b expected=%b", s, a, b, c, d, y, expected);
            end
        end

        if (errors == 0) $display("ALL PASS (64/64)");
        else             $display("FAILED: %0d errors", errors);
        $finish;
    end
endmodule