`timescale 1ns/1ps

module tb_b2aik;

    reg [3:0] bin;
    wire invalid;
    wire [3:0] aiken;

    // Instantiate the module under test (uut)
    b2aik uut (
        .bin(bin),
        .invalid(invalid),
        .aiken(aiken)
    );

    initial begin
        // Test valid inputs
        bin = 4'b0000; #10;
        if (invalid !== 0 || aiken !== 4'b0000) $display("FAIL: Test case bin=0 failed");

        bin = 4'b0001; #10;
        if (invalid !== 0 || aiken !== 4'b0001) $display("FAIL: Test case bin=1 failed");

        bin = 4'b0010; #10;
        if (invalid !== 0 || aiken !== 4'b0010) $display("FAIL: Test case bin=2 failed");

        bin = 4'b0011; #10;
        if (invalid !== 0 || aiken !== 4'b0011) $display("FAIL: Test case bin=3 failed");

        bin = 4'b0100; #10;
        if (invalid !== 0 || aiken !== 4'b0100) $display("FAIL: Test case bin=4 failed");

        bin = 4'b0101; #10;
        if (invalid !== 0 || aiken !== 4'b1011) $display("FAIL: Test case bin=5 failed");

        bin = 4'b0110; #10;
        if (invalid !== 0 || aiken !== 4'b1100) $display("FAIL: Test case bin=6 failed");

        bin = 4'b0111; #10;
        if (invalid !== 0 || aiken !== 4'b1101) $display("FAIL: Test case bin=7 failed");

        bin = 4'b1000; #10;
        if (invalid !== 0 || aiken !== 4'b1110) $display("FAIL: Test case bin=8 failed");

        bin = 4'b1001; #10;
        if (invalid !== 0 || aiken !== 4'b1111) $display("FAIL: Test case bin=9 failed");

        // Test invalid inputs
        bin = 4'b1010; #10;
        if (invalid !== 1) $display("FAIL: Test case bin=10 failed");
        
        bin = 4'b1111; #10;
        if (invalid !== 1) $display("FAIL: Test case bin=15 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule