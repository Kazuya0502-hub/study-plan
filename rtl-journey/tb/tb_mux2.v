`timescale 1ns/1ps
module tb_mux2;
    reg  s, a, b;
    wire y;
    reg  expected;
    integer i;
    integer errors;

    mux2 dut (.s(s), .a(a), .b(b), .y(y));

    initial begin
        errors = 0;
        for (i = 0; i < 8; i = i + 1) begin
            {s, a, b} = i;
            #1;

            case ({s, a, b})
                3'b000: expected = 1'b0;
                3'b001: expected = 1'b0;
                3'b010: expected = 1'b1;
                3'b011: expected = 1'b1;
                3'b100: expected = 1'b0;
                3'b101: expected = 1'b1;
                3'b110: expected = 1'b0;
                3'b111: expected = 1'b1;
            endcase

            if (y !== expected) begin
                errors = errors + 1;
                $display("FAIL s=%b a=%b b=%b y=%b expected=%b", s, a, b, y, expected);
            end
        end

        if (errors == 0) $display("ALL PASS (8/8)");
        else             $display("FAILED: %0d errors", errors);
        $finish;
    end
endmodule