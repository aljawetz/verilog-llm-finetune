`timescale 1ns/1ps

module tb_tri_state_buffer;

    // Inputs
    reg a;
    reg enable;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    tri_state_buffer uut (
        .a(a),
        .enable(enable),
        .y(y)
    );

    initial begin
        // Initialize Inputs
        a = 0;
        enable = 0;

        // Test Case 1: Enable is low, y should be high impedance
        #10;
        if (y !== 1'bz) begin
            $display("FAIL: Test Case 1 failed, expected y = Z, got y = %b", y);
            $finish;
        end

        // Test Case 2: Enable is high, a = 0, y should be 0
        enable = 1;
        a = 0;
        #10;
        if (y !== 0) begin
            $display("FAIL: Test Case 2 failed, expected y = 0, got y = %b", y);
            $finish;
        end

        // Test Case 3: Enable is high, a = 1, y should be 1
        a = 1;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test Case 3 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // Test Case 4: Enable is low, y should be high impedance again
        enable = 0;
        #10;
        if (y !== 1'bz) begin
            $display("FAIL: Test Case 4 failed, expected y = Z, got y = %b", y);
            $finish;
        end

        // Test Case 5: Enable is high, a = 0 again, y should be 0
        enable = 1;
        a = 0;
        #10;
        if (y !== 0) begin
            $display("FAIL: Test Case 5 failed, expected y = 0, got y = %b", y);
            $finish;
        end

        // Test Case 6: Enable is high, a = 1 again, y should be 1
        a = 1;
        #10;
        if (y !== 1) begin
            $display("FAIL: Test Case 6 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule