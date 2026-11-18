module mux4 (
    input a,
    input b,
    input c,
    input d,
    input [1:0] s,
    output y
);

wire [1:0] path;

    mux2 fa1 (.s(s[0]), .a(a), .b(b), .y(path[0]));
    mux2 fa2 (.s(s[0]), .a(c), .b(d), .y(path[1]));
    mux2 fa3 (.s(s[1]), .a(path[0]), .b(path[1]), .y(y));

endmodule


