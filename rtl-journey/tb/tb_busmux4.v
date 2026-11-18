`timescale 1ns/1ps
module tb_busmux4;
    reg  [1:0]  s;
    reg  [7:0]  d0, d1, d2, d3;
    wire [7:0]  y;
    reg  [7:0]  expected;

    reg  [15:0] e0, e1, e2, e3;
    wire [15:0] y16;
    reg  [15:0] expected16;

    integer sel, v;
    integer errors;
    integer checks;

    busmux4          dut   (.s(s), .d0(d0), .d1(d1), .d2(d2), .d3(d3), .y(y));
    busmux4 #(.W(16)) dut16 (.s(s), .d0(e0), .d1(e1), .d2(e2), .d3(e3), .y(y16));

    initial begin
        errors = 0;
        checks = 0;

        // main sweep: 4 selects x 256 values = 1024 checks
        for (sel = 0; sel < 4; sel = sel + 1) begin
            for (v = 0; v < 256; v = v + 1) begin
                case (sel)
                    0: begin d0 = v; d1 = 8'h00; d2 = 8'hFF; d3 = 8'h55; end
                    1: begin d1 = v; d0 = 8'h00; d2 = 8'hFF; d3 = 8'h55; end
                    2: begin d2 = v; d0 = 8'h00; d1 = 8'hFF; d3 = 8'h55; end
                    3: begin d3 = v; d0 = 8'h00; d1 = 8'hFF; d2 = 8'h55; end
                endcase
                s = sel;
                expected = v;
                #1;
                checks = checks + 1;
                if (y !== expected) begin
                    errors = errors + 1;
                    $display("FAIL sel=%0d v=%0d y=%h expected=%h", sel, v, y, expected);
                end
            end
        end

        // all inputs equal: y must equal that value
        for (sel = 0; sel < 4; sel = sel + 1) begin
            d0 = 8'hA3; d1 = 8'hA3; d2 = 8'hA3; d3 = 8'hA3;
            s = sel;
            #1;
            if (y !== 8'hA3) begin
                errors = errors + 1;
                $display("FAIL equal-inputs sel=%0d y=%h", sel, y);
            end
        end

        // W=16 instance: one set of distinct values through all four selects
        e0 = 16'h1111; e1 = 16'h2222; e2 = 16'h3333; e3 = 16'h4444;
        for (sel = 0; sel < 4; sel = sel + 1) begin
            s = sel;
            case (sel)
                0: expected16 = 16'h1111;
                1: expected16 = 16'h2222;
                2: expected16 = 16'h3333;
                3: expected16 = 16'h4444;
            endcase
            #1;
            if (y16 !== expected16) begin
                errors = errors + 1;
                $display("FAIL W16 sel=%0d y16=%h expected=%h", sel, y16, expected16);
            end
        end

        if (errors == 0) $display("ALL PASS (%0d/1024)", checks);
        else             $display("FAILED: %0d errors", errors);
        $finish;
    end
endmodule