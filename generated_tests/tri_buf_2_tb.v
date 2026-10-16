`timescale 1ns/1ps

module tb_tri_buf;

    // Inputs
    reg d_in;
    reg c;

    // Outputs
    wire d_out;

    // Instantiate the Unit Under Test (UUT)
    tri_buf uut (
        .d_in(d_in),
        .c(c),
        .d_out(d_out)
    );

    initial begin
        // Initialize Inputs
        d_in = 0;
        c = 0;

        // Test Case 1: Control signal low (c = 0), expect d_out = high impedance
        #10;
        if (d_out !== 1'bz) begin
            $display("FAIL: Test Case 1 failed, expected high impedance (z) when c = 0");
            $finish;
        end

        // Test Case 2: Control signal high (c = 1), d_in = 0, expect d_out = 0
        c = 1; d_in = 0;
        #10;
        if (d_out !== 0) begin
            $display("FAIL: Test Case 2 failed, expected d_out = 0 when d_in = 0 and c = 1");
            $finish;
        end

        // Test Case 3: Control signal high (c = 1), d_in = 1, expect d_out = 1
        d_in = 1;
        #10;
        if (d_out !== 1) begin
            $display("FAIL: Test Case 3 failed, expected d_out = 1 when d_in = 1 and c = 1");
            $finish;
        end

        // Test Case 4: Change control signal to low (c = 0), expect d_out = high impedance
        c = 0;
        #10;
        if (d_out !== 1'bz) begin
            $display("FAIL: Test Case 4 failed, expected high impedance (z) when c = 0");
            $finish;
        end

        // Test Case 5: Control signal high (c = 1), d_in = 0, expect d_out = 0 again
        c = 1; d_in = 0;
        #10;
        if (d_out !== 0) begin
            $display("FAIL: Test Case 5 failed, expected d_out = 0 when d_in = 0 and c = 1");
            $finish;
        end

        // Test Case 6: Control signal high (c = 1), d_in = 1, expect d_out = 1 again
        d_in = 1;
        #10;
        if (d_out !== 1) begin
            $display("FAIL: Test Case 6 failed, expected d_out = 1 when d_in = 1 and c = 1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule