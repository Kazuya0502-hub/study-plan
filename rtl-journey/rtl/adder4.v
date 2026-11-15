// adder4.v - 4-bit ripple-carry adder (W1, 11/14)
//
// Spec
//   a[3:0], b[3:0], cin  ->  sum[3:0], cout
//   cout is the bit that overflowed the top. 15 + 15 + 1 = 31, so the result needs 5 bits.
//
// Build order (one stage at a time, simulating after each)
//   1) half_adder : sum = a ^ b,  cout = a & b
//   2) full_adder : two half adders + OR (including cin)
//   3) adder4     : four full adders in a ripple-carry chain
//
// Forbidden: the + operator. Building the structure is the point of the exercise.

// ---- 1) half_adder : 1 bit + 1 bit (no carry in) ----
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
//   Written as a flat boolean expression (equivalent to two half adders)
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

// ---- 3) adder4 : the 4-bit top level ----
//   Stack four full adders and feed each carry out into the next carry in
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
