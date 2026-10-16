`timescale 1ns/1ps

module tb_mux_2to1;

    // Inputs
    reg [1:0] d;
    reg s;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    mux_2to1 uut (
        .d(d),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select input d[0]
        d = 2'b01; // d[0] = 1, d[1] = 0
        s = 1'b0;  // Select d[0]
        #10;       // Wait for 10 time units
        if (y !== 1'b1) $display("FAIL: Test case 1 failed, expected y = 1, got y = %b", y);

        // Test case 2: Select input d[1]
        d = 2'b10; // d[0] = 0, d[1] = 1
        s = 1'b1;  // Select d[1]
        #10;       // Wait for 10 time units
        if (y !== 1'b1) $display("FAIL: Test case 2 failed, expected y = 1, got y = %b", y);

        // Test case 3: Select input d[0] again
        d = 2'b00; // d[0] = 0, d[1] = 0
        s = 1'b0;  // Select d[0]
        #10;       // Wait for 10 time units
        if (y !== 1'b0) $display("FAIL: Test case 3 failed, expected y = 0, got y = %b", y);

        // Test case 4: Select input d[1] again
        d = 2'b11; // d[0] = 1, d[1] = 1
        s = 1'b1;  // Select d[1]
        #10;       // Wait for 10 time units
        if (y !== 1'b1) $display("FAIL: Test case 4 failed, expected y = 1, got y = %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule