`timescale 1ns/1ps

module tb_aik2b;

    reg [3:0] aiken;
    wire invalid;
    wire [3:0] bin;

    // Instantiate the module under test
    aik2b uut (
        .aiken(aiken),
        .invalid(invalid),
        .bin(bin)
    );

    initial begin
        // Test valid Aiken codes
        aiken = 4'b0000; #10;
        if (bin !== 4'b0000 || invalid !== 0) $display("FAIL: Test case 1 failed");

        aiken = 4'b0001; #10;
        if (bin !== 4'b0001 || invalid !== 0) $display("FAIL: Test case 2 failed");

        aiken = 4'b0010; #10;
        if (bin !== 4'b0010 || invalid !== 0) $display("FAIL: Test case 3 failed");

        aiken = 4'b0011; #10;
        if (bin !== 4'b0011 || invalid !== 0) $display("FAIL: Test case 4 failed");

        aiken = 4'b0100; #10;
        if (bin !== 4'b0100 || invalid !== 0) $display("FAIL: Test case 5 failed");

        aiken = 4'b1011; #10;
        if (bin !== 4'b0101 || invalid !== 0) $display("FAIL: Test case 6 failed");

        aiken = 4'b1100; #10;
        if (bin !== 4'b0110 || invalid !== 0) $display("FAIL: Test case 7 failed");

        aiken = 4'b1101; #10;
        if (bin !== 4'b0111 || invalid !== 0) $display("FAIL: Test case 8 failed");

        aiken = 4'b1110; #10;
        if (bin !== 4'b1000 || invalid !== 0) $display("FAIL: Test case 9 failed");

        aiken = 4'b1111; #10;
        if (bin !== 4'b1001 || invalid !== 0) $display("FAIL: Test case 10 failed");

        // Test invalid Aiken codes
        aiken = 4'b000X; #10;
        if (invalid !== 1) $display("FAIL: Test case 11 failed");

        aiken = 4'b0101; #10; // Invalid Aiken code
        if (invalid !== 1) $display("FAIL: Test case 12 failed");

        aiken = 4'b0110; #10; // Invalid Aiken code
        if (invalid !== 1) $display("FAIL: Test case 13 failed");

        aiken = 4'b0111; #10; // Invalid Aiken code
        if (invalid !== 1) $display("FAIL: Test case 14 failed");

        aiken = 4'b1000; #10; // Invalid Aiken code
        if (invalid !== 1) $display("FAIL: Test case 15 failed");

        aiken = 4'b1001; #10; // Invalid Aiken code
        if (invalid !== 1) $display("FAIL: Test case 16 failed");

        aiken = 4'b1010; #10; // Invalid Aiken code
        if (invalid !== 1) $display("FAIL: Test case 17 failed");

        aiken = 4'b1111; #10; // Valid Aiken code
        if (bin !== 4'b1001 || invalid !== 0) $display("FAIL: Test case 18 failed");

        $display("PASS");
        $finish;
    end

endmodule