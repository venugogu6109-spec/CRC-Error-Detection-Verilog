module crc16_receiver(
input [31:0] rx_packet,
output reg error
);

reg [15:0] crc_reg;
integer i;

always @(*) begin

crc_reg = 16'hFFFF;

for(i=0;i<32;i=i+1) begin
    if((crc_reg[15] ^ rx_packet[31-i]) == 1)
        crc_reg = (crc_reg << 1) ^ 16'h8005;
    else
        crc_reg = crc_reg << 1;
end

if(crc_reg == 16'h0000)
    error = 0;
else
    error = 1;

end

endmodule