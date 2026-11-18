module busmux4 #(parameter W = 8) (
    input  [1:0]   s,
    input  [W-1:0] d0,
    input  [W-1:0] d1,
    input  [W-1:0] d2,
    input  [W-1:0] d3,
    output [W-1:0] y
);

assign y = s[1] ? (s[0] ? d3 : d2)
                : (s[0] ? d1 : d0);

endmodule

