module dec3_8 (
    input        en,
    input  [2:0] a,
    output [7:0] y
);

wire en_lo;
wire en_hi;

assign en_lo = en & ~a[2];
assign en_hi = en & a[2];


dec2_4 fa1(.en(en_hi), .a(a[1:0]), .y(y[7:4]));
dec2_4 fa2(.en(en_lo), .a(a[1:0]), .y(y[3:0]));


endmodule