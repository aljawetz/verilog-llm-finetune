`timescale 1ns/1ps

module tb_decoder8to3S;

reg [2:0] i;
wire [7:0] y;

// Instantiate the Unit Under Test (UUT)
decoder8to3S uut (
    .y(y),
    .i(i)
);

initial begin
    // Test all combinations of the 3-bit input
    i = 3'b000; #10;
    if (y !== 8'b00000001) $display("FAIL: Test case i=000 failed, y=%b", y);

    i = 3'b001; #10;
    if (y !== 8'b00000010) $display("FAIL: Test case i=001 failed, y=%b", y);

    i = 3'b010; #10;
    if (y !== 8'b00000100) $display("FAIL: Test case i=010 failed, y=%b", y);

    i = 3'b011; #10;
    if (y !== 8'b00001000) $display("FAIL: Test case i=011 failed, y=%b", y);

    i = 3'b100; #10;
    if (y !== 8'b00010000) $display("FAIL: Test case i=100 failed, y=%b", y);

    i = 3'b101; #10;
    if (y !== 8'b00100000) $display("FAIL: Test case i=101 failed, y=%b", y);

    i = 3'b110; #10;
    if (y !== 8'b01000000) $display("FAIL: Test case i=110 failed, y=%b", y);

    i = 3'b111; #10;
    if (y !== 8'b10000000) $display("FAIL: Test case i=111 failed, y=%b", y);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule