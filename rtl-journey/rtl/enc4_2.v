module enc4_2 (
    input [3:0] d,
    output reg [1:0] y,
    output reg valid
);

always @(*) begin
    case (d) 
        4'b0001: begin 
            y = 2'b00;
            valid = 1'b1;
        end
        4'b0010: begin 
            y = 2'b01;
            valid = 1'b1;
        end
        4'b0100: begin 
            y = 2'b10;
            valid = 1'b1;
        end
        4'b1000: begin 
            y = 2'b11;
            valid = 1'b1;
        end
        default: begin 
            y = 2'b00;
            valid = 1'b0;
        end
    endcase
end

endmodule

