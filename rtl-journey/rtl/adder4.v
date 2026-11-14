// adder4.v — 4bit リプルキャリー加算器（W1 11/14）
//
// 仕様
//   a[3:0], b[3:0], cin  ->  sum[3:0], cout
//   cout は「最上位からあふれた桁」。15 + 15 + 1 = 31 なので 5bit で受ける。
//
// 書く順番（この順で、1つずつシミュレーションを通す）
//   1) half_adder : sum = a ^ b,  cout = a & b   ← 完了
//   2) full_adder : half_adder 2個 + OR（cin を含める）
//   3) adder4     : full_adder 4段のリプルキャリー
//
// 禁止: + 演算子（構造で組むのが今日の目的）

// ---- 1) half_adder : 1bit + 1bit（繰り上がり入力なし） ----
module half_adder (
    input  wire a,
    input  wire b,
    output wire sum,
    output wire cout
);
    assign sum  = a ^ b;
    assign cout = a & b;
endmodule

// ---- 2) full_adder : a + b + cin ----
//   フラットな論理式で書いた版（half_adder 2個で組む版と等価）
module full_adder (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

// ---- 3) TODO: adder4 : 4bit のトップ ----
//   full_adder を4段たてに繋ぎ、下位の cout を上位の cin に入れる
module adder4 (
  input wire [3:0]a,
  input wire [3:0]b,
  input wire cin,
  output wire cout,
  output wire [3:0] sum
);

  wire c1, c2, c3;
  full_adder fa0 (.a(a[0]), .b(b[0]), .cin(cin), .cout(c1), .sum(sum[0]));
  full_adder fa1 (.a(a[1]), .b(b[1]), .cin(c1), .cout(c2), .sum(sum[1]));
  full_adder fa2 (.a(a[2]), .b(b[2]), .cin(c2), .cout(c3), .sum(sum[2]));
  full_adder fa3 (.a(a[3]), .b(b[3]), .cin(c3), .cout(cout), .sum(sum[3]));
endmodule