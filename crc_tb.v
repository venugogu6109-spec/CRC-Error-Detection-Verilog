
module crc_tb;

reg [7:0] data;
reg [7:0] corrupted_data;

wire [7:0] crc;
wire error;

crc8 CRC_GEN(
data,
crc
);

crc_checker CRC_CHECK(
corrupted_data,
crc,
error
);

initial begin

// --------------------
// No Error
// --------------------
data = 8'b10101010;
corrupted_data = data;

#20;

// --------------------
// Single Bit Error
// --------------------
corrupted_data = data ^ 8'b00000001;

#20;

// --------------------
// Double Bit Error
// --------------------
corrupted_data = data ^ 8'b00000011;

#20;

// --------------------
// Burst Error
// --------------------
corrupted_data = data ^ 8'b00011100;

#20;

$finish;

end

endmodule
