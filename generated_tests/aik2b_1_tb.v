`timescale 1ns/1ps

module tb_aik2b;

    reg [3:0] aiken;
    wire invalid;
    wire [3:0] bin;

    // Instantiate the module under test (uut)
    aik2b uut (
        .aiken(aiken),
        .invalid(invalid),
        .bin(bin)
    );

    initial begin
        // Test valid Aiken codes
        aiken = 4'b0000; #10;
        if (bin !== 4'b0000 || invalid !== 0) $display("FAIL: Test case 0000 failed");

        aiken = 4'b0001; #10;
        if (bin !== 4'b0001 || invalid !== 0) $display("FAIL: Test case 0001 failed");

        aiken = 4'b0010; #10;
        if (bin !== 4'b0010 || invalid !== 0) $display("FAIL: Test case 0010 failed");

        aiken = 4'b0011; #10;
        if (bin !== 4'b0011 || invalid !== 0) $display("FAIL: Test case 0011 failed");

        aiken = 4'b0100; #10;
        if (bin !== 4'b0100 || invalid !== 0) $display("FAIL: Test case 0100 failed");

        aiken = 4'b1011; #10;
        if (bin !== 4'b0101 || invalid !== 0) $display("FAIL: Test case 1011 failed");

        aiken = 4'b1100; #10;
        if (bin !== 4'b0110 || invalid !== 0) $display("FAIL: Test case 1100 failed");

        aiken = 4'b1101; #10;
        if (bin !== 4'b0111 || invalid !== 0) $display("FAIL: Test case 1101 failed");

        aiken = 4'b1110; #10;
        if (bin !== 4'b1000 || invalid !== 0) $display("FAIL: Test case 1110 failed");

        aiken = 4'b1111; #10;
        if (bin !== 4'b1001 || invalid !== 0) $display("FAIL: Test case 1111 failed");

        // Test invalid Aiken codes
        aiken = 4'b0101; #10;
        if (bin !== 4'bxxxx || invalid !== 1) $display("FAIL: Test case 0101 failed");

        aiken = 4'b0110; #10;
        if (bin !== 4'bxxxx || invalid !== 1) $display("FAIL: Test case 0110 failed");

        aiken = 4'b0111; #10;
        if (bin !== 4'bxxxx || invalid !== 1) $display("FAIL: Test case 0111 failed");

        aiken = 4'b1000; #10;
        if (bin !== 4'bxxxx || invalid !== 1) $display("FAIL: Test case 1000 failed");

        aiken = 4'b1001; #10;
        if (bin !== 4'bxxxx || invalid !== 1) $display("FAIL: Test case 1001 failed");

        aiken = 4'b1010; #10;
        if (bin !== 4'bxxxx || invalid !== 1) $display("FAIL: Test case 1010 failed");

        aiken = 4'b1101; #10;
        if (bin !== 4'bxxxx || invalid !== 1) $display("FAIL: Test case 1101 failed");

        aiken = 4'b1111; #10;
        if (bin !== 4'bxxxx || invalid !== 1) $display("FAIL: Test case 1111 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule