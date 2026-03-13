module crc32_receiver(
    input [63:0] rx_packet,
    output reg error
);

reg [31:0] crc;
reg [31:0] data;
integer i;

always @(*) begin

    data = rx_packet[63:32];
    crc = rx_packet[31:0];

    for(i=0;i<32;i=i+1) begin
        if((crc[31] ^ data[31-i]) == 1'b1)
            crc = (crc << 1) ^ 32'h04C11DB7;
        else
            crc = (crc << 1);
    end

    if(crc == 0)
        error = 0;   // No error
    else
        error = 1;   // Error detected

end

endmodule