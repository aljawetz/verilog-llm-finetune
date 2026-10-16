`timescale 1ns/1ps

module tb_e1;
    reg [31:0] x;
    wire [31:0] y;

    // Instantiate the module under test (uut)
    e1 uut (
        .x(x),
        .y(y)
    );

    initial begin
        // Test case 1
        x = 32'h00000000; // Input all zeros
        #10;
        if (y !== 32'h00000000) $display("FAIL: Test case 1 failed, expected 0x00000000, got %h", y);

        // Test case 2
        x = 32'hFFFFFFFF; // Input all ones
        #10;
        if (y !== 32'hFFFFFFFF) $display("FAIL: Test case 2 failed, expected 0xFFFFFFFF, got %h", y);

        // Test case 3
        x = 32'h12345678; // Arbitrary input
        #10;
        if (y !== 32'h1E6A7B8C) $display("FAIL: Test case 3 failed, expected 0x1E6A7B8C, got %h", y);

        // Test case 4
        x = 32'hA5A5A5A5; // Another arbitrary input
        #10;
        if (y !== 32'h5A5A5A5A) $display("FAIL: Test case 4 failed, expected 0x5A5A5A5A, got %h", y);

        // Test case 5
        x = 32'hDEADBEEF; // Another arbitrary input
        #10;
        if (y !== 32'h7B7B7B7B) $display("FAIL: Test case 5 failed, expected 0x7B7B7B7B, got %h", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule