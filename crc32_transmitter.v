module crc32_transmitter(
    input [31:0] data_in,
    output reg [31:0] crc_out,
    output [63:0] tx_packet
);

reg [31:0] crc;
integer i;

always @(*) begin
    crc = 32'hFFFFFFFF;

    for(i=0;i<32;i=i+1) begin
        if((crc[31] ^ data_in[31-i]) == 1'b1)
            crc = (crc << 1) ^ 32'h04C11DB7; // CRC-32 polynomial
        else
            crc = (crc << 1);
    end

    crc_out = crc;
end

assign tx_packet = {data_in, crc_out};

endmodule