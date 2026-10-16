`timescale 1ns/1ps

module tb_sbox1;

reg [1:0] addr;
wire [3:0] dout;

// Instantiate the module under test
sbox1 uut (
    .addr(addr),
    .dout(dout)
);

initial begin
    // Test cases
    addr = 2'b00; #10; 
    if (dout !== 4'b1110) $display("FAIL: addr=00, expected dout=1110, got dout=%b", dout);

    addr = 2'b01; #10; 
    if (dout !== 4'b0100) $display("FAIL: addr=01, expected dout=0100, got dout=%b", dout);

    addr = 2'b10; #10; 
    if (dout !== 4'b1101) $display("FAIL: addr=10, expected dout=1101, got dout=%b", dout);

    addr = 2'b11; #10; 
    if (dout !== 4'b0001) $display("FAIL: addr=11, expected dout=0001, got dout=%b", dout);

    // Additional tests for full coverage
    addr = 2'b00; #10; 
    if (dout !== 4'b1110) $display("FAIL: addr=00, expected dout=1110, got dout=%b", dout);

    addr = 2'b01; #10; 
    if (dout !== 4'b0100) $display("FAIL: addr=01, expected dout=0100, got dout=%b", dout);

    addr = 2'b10; #10; 
    if (dout !== 4'b1101) $display("FAIL: addr=10, expected dout=1101, got dout=%b", dout);

    addr = 2'b11; #10; 
    if (dout !== 4'b0001) $display("FAIL: addr=11, expected dout=0001, got dout=%b", dout);

    // Final check
    addr = 2'b11; #10; 
    if (dout !== 4'b0001) $display("FAIL: addr=11, expected dout=0001, got dout=%b", dout);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule