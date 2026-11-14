// tb_adder4.v — 自己検査テストベンチ（W1 11/14）
//
// 方針
//   - a 0..15 × b 0..15 × cin 0..1 の全 512 通りを回す
//   - 期待値は TB 側で計算する（expected = a + b + cin。RTL 側は + 禁止）
//   - 1件でも違えば $display で出し、最後に pass 数を出す
//   - 合格の表示は "ALL PASS (512/512)"
//
// 実行: make sim TOP=adder4
// 波形: make wave TOP=adder4

`timescale 1ns/1ps

module tb_adder4;

    // ---- DUT につなぐ信号 ----
    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    // ---- ループ用 ----
    integer a_i, b_i, c_i;
    integer errors, checks;
    reg [4:0] expected;          // cout を含めた 5bit の期待値

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
                    #1;                              // 組み合わせ回路が落ち着くまで待つ

                    expected = a_i + b_i + c_i;      // TB 側だから + を使ってよい
                    checks   = checks + 1;

                    if ({cout, sum} !== expected) begin   // !== は X も不一致として扱う
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
