module crc_checker(
    input [7:0] data,
    input [7:0] crc_rx,
    output reg error
);

wire [7:0] crc_calc;

crc8 C1(data,crc_calc);

always @(*) begin
    if(crc_calc == crc_rx)
        error = 0;
    else
        error = 1;
end

endmodule