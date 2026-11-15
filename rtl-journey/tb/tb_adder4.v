// tb_adder4.v - self-checking testbench (W1, 11/14)
//
// Approach
//   - Sweep all 512 combinations: a 0..15 x b 0..15 x cin 0..1
//   - Compute the expected value in the testbench (expected = a + b + cin; the RTL may not use +)
//   - Print every mismatch, then report the number of checks that passed
//   - The success line is "ALL PASS (512/512)"
//
// Run:    make sim TOP=adder4
// Wave:   make wave TOP=adder4

`timescale 1ns/1ps

module tb_adder4;

    // ---- signals wired to the DUT ----
    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    // ---- loop counters ----
    integer a_i, b_i, c_i;
    integer errors, checks;
    reg [4:0] expected;          // 5-bit expected value, cout included

    // ---- DUT ----
    adder4 dut (
        .a(a), .b(b), .cin(cin),
        .sum(sum), .cout(cout)
    );

    initial begin
        $dumpfile("build/adder4.vcd");
        $dumpvars(0, tb_adder4);

        errors = 0;
        checks = 0;

        for (a_i = 0; a_i < 16; a_i = a_i + 1) begin
            for (b_i = 0; b_i < 16; b_i = b_i + 1) begin
                for (c_i = 0; c_i < 2; c_i = c_i + 1) begin

                    a   = a_i;
                    b   = b_i;
                    cin = c_i;
                    #1;                              // let the combinational logic settle

                    expected = a_i + b_i + c_i;      // fine here: this is the testbench
                    checks   = checks + 1;

                    if ({cout, sum} !== expected) begin   // !== treats an X as a mismatch
                        errors = errors + 1;
                        $display("FAIL a=%2d b=%2d cin=%0d : got %2d, expected %2d",
                                 a, b, cin, {cout, sum}, expected);
                    end
                end
            end
        end

        if (errors == 0)
            $display("ALL PASS (%0d/%0d)", checks, checks);
        else
            $display("FAILED %0d / %0d", errors, checks);
        $finish;
    end

endmodule
