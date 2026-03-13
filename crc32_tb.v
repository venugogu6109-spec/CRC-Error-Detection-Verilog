module crc32_tb;

reg [31:0] data;
wire [31:0] crc;
wire [63:0] packet;

reg [63:0] rx_packet;
wire error;

crc32_transmitter tx(
    .data_in(data),
    .crc_out(crc),
    .tx_packet(packet)
);

crc32_receiver rx(
    .rx_packet(rx_packet),
    .error(error)
);

initial begin

$display("CRC-32 GPS Data Transmission Simulation");

data = 32'b10101010101010101010101010101010;

#10

// Case 1: No Error
rx_packet = packet;

#10
$display("Case 1: No Error -> error signal = %b", error);

// Case 2: Introduce Error
rx_packet = packet;
rx_packet[5] = ~rx_packet[5];

#10
$display("Case 2: Error Detected -> error signal = %b", error);

#10 $finish;

end

endmodule