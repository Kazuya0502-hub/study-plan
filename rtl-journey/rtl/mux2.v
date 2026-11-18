`timescale 1ns/1ps
module mux2 (
    input  s,
    input  a,
    input  b,
    output y
);
    assign y = s ? b : a;
endmodule
