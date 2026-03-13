module crc8(
    input [7:0] data,
    output reg [7:0] crc
);

integer i;
reg [7:0] temp;

always @(*) begin
    crc = 8'h00;
    temp = data;

    for(i=0;i<8;i=i+1) begin
        if((crc[7] ^ temp[7]) == 1)
            crc = {crc[6:0],1'b0} ^ 8'h07;
        else
            crc = {crc[6:0],1'b0};

        temp = temp << 1;
    end
end

endmodule