`timescale 1ns/1ps

module tb_Sqrt1_Coeffs;

reg [5:0] address;
wire [31:0] data;

// Instantiate the module under test (uut)
Sqrt1_Coeffs uut (
    .address(address),
    .data(data)
);

initial begin
    // Test all address values from 0 to 63
    address = 6'b000000; // Start with address 0
    #10; // Wait for a short time to allow data to settle
    if (data !== 32'b00010110100000101101011011100010) begin
        $display("FAIL: Address 0 expected 00010110100000101101011011100010 but got %b", data);
        $finish;
    end

    address = 6'b000001; // Address 1
    #10;
    if (data !== 32'b00010110010100101101110001111111) begin
        $display("FAIL: Address 1 expected 00010110010100101101110001111111 but got %b", data);
        $finish;
    end

    address = 6'b000010; // Address 2
    #10;
    if (data !== 32'b00010110001100101110001000010001) begin
        $display("FAIL: Address 2 expected 00010110001100101110001000010001 but got %b", data);
        $finish;
    end

    address = 6'b000011; // Address 3
    #10;
    if (data !== 32'b00010110000000101110011110011000) begin
        $display("FAIL: Address 3 expected 00010110000000101110011110011000 but got %b", data);
        $finish;
    end

    address = 6'b000100; // Address 4
    #10;
    if (data !== 32'b00010101110100101110110100010101) begin
        $display("FAIL: Address 4 expected 00010101110100101110110100010101 but got %b", data);
        $finish;
    end

    address = 6'b111111; // Address 63
    #10;
    if (data !== 32'b00010000000000111111110111111101) begin
        $display("FAIL: Address 63 expected 00010000000000111111110111111101 but got %b", data);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule