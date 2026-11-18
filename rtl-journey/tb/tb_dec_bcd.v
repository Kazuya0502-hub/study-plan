`timescale 1ns/1ps
module tb_dec_bcd;
    reg  [3:0] a;
    wire [9:0] y;
    wire       err;
    reg  [9:0] exp_y;
    reg        exp_err;
    integer i;
    integer errors;

    dec_bcd dut (.a(a), .y(y), .err(err));

    initial begin
        errors = 0;
        for (i = 0; i < 16; i = i + 1) begin
            a = i;
            #1;

            // expected: BCD digit 0..9 -> one-hot, no error; 10..15 -> all zero, error
            exp_y = 10'b0;
            exp_err = 1'b0;
            if (i <= 9) exp_y[i] = 1'b1;
            else        exp_err = 1'b1;

            if (y !== exp_y || err !== exp_err) begin
                errors = errors + 1;
                $display("FAIL a=%0d y=%b err=%b expected y=%b err=%b", i, y, err, exp_y, exp_err);
            end
        end

        if (errors == 0) $display("ALL PASS (16/16)");
        else             $display("FAILED: %0d errors", errors);
        $finish;
    end
endmodule