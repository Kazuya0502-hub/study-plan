module dec_bcd (
    input  [3:0] a,
    output reg [9:0] y,
    output reg       err
);

always @(*) begin
    case (a)
        4'd0: begin y = 10'b0000000001; err = 1'b0; end
        4'd1: begin y = 10'b0000000010; err = 1'b0; end
        4'd2: begin y = 10'b0000000100; err = 1'b0; end
        4'd3: begin y = 10'b0000001000; err = 1'b0; end
        4'd4: begin y = 10'b0000010000; err = 1'b0; end
        4'd5: begin y = 10'b0000100000; err = 1'b0; end
        4'd6: begin y = 10'b0001000000; err = 1'b0; end
        4'd7: begin y = 10'b0010000000; err = 1'b0; end
        4'd8: begin y = 10'b0100000000; err = 1'b0; end
        4'd9: begin y = 10'b1000000000; err = 1'b0; end
        default: begin
            y   = 10'b0;
            err = 1'b1;
        end
    endcase
end

    // case (a) で、0〜9 の10通りを書く
    // それぞれの枝で y と err の両方に値を入れる
    // default では y = 10'b0; err = 1'b1;
    // ここを書く

endmodule
