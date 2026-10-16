`timescale 1ns/1ps

module tb_odd_N;

    parameter N = 8; // Change N as needed for testing
    reg [N-1:0] d_in;
    wire y_out;

    // Instantiate the module under test
    odd_N uut (
        .d_in(d_in),
        .y_out(y_out)
    );

    initial begin
        // Test case 1: All bits are 0
        d_in = 8'b00000000; // Even number of 1's (0)
        #10;
        if (y_out !== 1'b0) $display("FAIL: Test case 1 failed, expected 0, got %b", y_out);

        // Test case 2: One bit is 1
        d_in = 8'b00000001; // Odd number of 1's (1)
        #10;
        if (y_out !== 1'b1) $display("FAIL: Test case 2 failed, expected 1, got %b", y_out);

        // Test case 3: Two bits are 1
        d_in = 8'b00000011; // Even number of 1's (2)
        #10;
        if (y_out !== 1'b0) $display("FAIL: Test case 3 failed, expected 0, got %b", y_out);

        // Test case 4: Three bits are 1
        d_in = 8'b00000111; // Odd number of 1's (3)
        #10;
        if (y_out !== 1'b1) $display("FAIL: Test case 4 failed, expected 1, got %b", y_out);

        // Test case 5: Four bits are 1
        d_in = 8'b00001111; // Even number of 1's (4)
        #10;
        if (y_out !== 1'b0) $display("FAIL: Test case 5 failed, expected 0, got %b", y_out);

        // Test case 6: Five bits are 1
        d_in = 8'b00011111; // Odd number of 1's (5)
        #10;
        if (y_out !== 1'b1) $display("FAIL: Test case 6 failed, expected 1, got %b", y_out);

        // Test case 7: Six bits are 1
        d_in = 8'b00111111; // Even number of 1's (6)
        #10;
        if (y_out !== 1'b0) $display("FAIL: Test case 7 failed, expected 0, got %b", y_out);

        // Test case 8: Seven bits are 1
        d_in = 8'b01111111; // Odd number of 1's (7)
        #10;
        if (y_out !== 1'b1) $display("FAIL: Test case 8 failed, expected 1, got %b", y_out);

        // Test case 9: All bits are 1
        d_in = 8'b11111111; // Even number of 1's (8)
        #10;
        if (y_out !== 1'b0) $display("FAIL: Test case 9 failed, expected 0, got %b", y_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule