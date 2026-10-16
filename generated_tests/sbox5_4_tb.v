`timescale 1ns/1ps

module tb_sbox5;

reg [1:0] addr;
wire [1:0] dout;
reg [1:0] expected_dout;

sbox5 uut (
    .addr(addr),
    .dout(dout)
);

initial begin
    // Test vector 0
    addr = 2'b00; expected_dout = 2'b10; #10;
    if (dout !== expected_dout) $display("FAIL: addr=00, expected=%b, got=%b", expected_dout, dout);

    // Test vector 1
    addr = 2'b01; expected_dout = 2'b00; #10;
    if (dout !== expected_dout) $display("FAIL: addr=01, expected=%b, got=%b", expected_dout, dout);

    // Test vector 2
    addr = 2'b10; expected_dout = 2'b01; #10;
    if (dout !== expected_dout) $display("FAIL: addr=10, expected=%b, got=%b", expected_dout, dout);

    // Test vector 3
    addr = 2'b11; expected_dout = 2'b11; #10;
    if (dout !== expected_dout) $display("FAIL: addr=11, expected=%b, got=%b", expected_dout, dout);

    // Test vector 4
    addr = 2'b00; expected_dout = 2'b10; #10;
    if (dout !== expected_dout) $display("FAIL: addr=00, expected=%b, got=%b", expected_dout, dout);

    // Test vector 5
    addr = 2'b01; expected_dout = 2'b00; #10;
    if (dout !== expected_dout) $display("FAIL: addr=01, expected=%b, got=%b", expected_dout, dout);

    // Test vector 6
    addr = 2'b10; expected_dout = 2'b01; #10;
    if (dout !== expected_dout) $display("FAIL: addr=10, expected=%b, got=%b", expected_dout, dout);

    // Test vector 7
    addr = 2'b11; expected_dout = 2'b11; #10;
    if (dout !== expected_dout) $display("FAIL: addr=11, expected=%b, got=%b", expected_dout, dout);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule