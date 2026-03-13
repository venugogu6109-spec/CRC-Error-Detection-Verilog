module crc_system(

input [7:0] data_in,
input [7:0] crc_in,
output error

);

crc_checker C1(
data_in,
crc_in,
error
);

endmodule