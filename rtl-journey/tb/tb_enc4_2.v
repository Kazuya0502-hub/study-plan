`timescale 1ns/1ps
module tb_enc4_2;
    reg  [3:0] d;
    wire [1:0] y;
    wire       valid;
    reg  [1:0] exp_y;
    reg        exp_valid;
    integer i;
    integer errors;

    enc4_2 dut (.d(d), .y(y), .valid(valid));

    initial begin
        errors = 0;
        for (i = 0; i < 16; i = i + 1) begin
            d = i;
            #1;

            // expected values: only the four one-hot patterns are valid
            case (d)
                4'b0001: begin exp_y = 2'b00; exp_valid = 1'b1; end
                4'b0010: begin exp_y = 2'b01; exp_valid = 1'b1; end
                4'b0100: begin exp_y = 2'b10; exp_valid = 1'b1; end
                4'b1000: begin exp_y = 2'b11; exp_valid = 1'b1; end
                default: begin exp_y = 2'b00; exp_valid = 1'b0; end
            endcase

            if (y !== exp_y || valid !== exp_valid) begin
                errors = errors + 1;
                $display("FAIL d=%b y=%b valid=%b expected y=%b valid=%b", d, y, valid, exp_y, exp_valid);
            end
        end

        if (errors == 0) $display("ALL PASS (16/16)");
        else             $display("FAILED: %0d errors", errors);
        $finish;
    end
endmodule