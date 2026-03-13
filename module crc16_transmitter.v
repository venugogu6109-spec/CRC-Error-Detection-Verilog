module crc16_transmitter(
input  [15:0] data,
output [15:0] crc,
output [31:0] packet
);

reg [15:0] crc_reg;
integer i;

always @(*) begin
    crc_reg = 16'hFFFF;

    for(i=0;i<16;i=i+1) begin
        if((crc_reg[15] ^ data[15-i]) == 1)
            crc_reg = (crc_reg << 1) ^ 16'h8005;
        else
            crc_reg = crc_reg << 1;
    end
end

assign crc = crc_reg;
assign packet = {data,crc};

endmodule