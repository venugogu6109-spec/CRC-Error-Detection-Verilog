module tb_crc16;

reg [15:0] data;
wire [15:0] crc;
wire [31:0] packet;

reg [31:0] rx_packet;
wire error;

crc16_transmitter TX(
.data(data),
.crc(crc),
.packet(packet)
);

crc16_receiver RX(
.rx_packet(rx_packet),
.error(error)
);

initial begin

data = 16'hB4B5;

#10

// Case 1 : No Error
rx_packet = packet;

#20

// Case 2 : Error introduced
rx_packet = packet;
rx_packet[3] = ~rx_packet[3];

#20 $finish;

end

endmodule