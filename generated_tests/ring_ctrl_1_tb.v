`timescale 1ns/1ps

module tb_ring_ctrl;

    // Inputs
    reg ring;
    reg vibrate_mode;

    // Outputs
    wire ringer;
    wire motor;

    // Instantiate the Unit Under Test (UUT)
    ring_ctrl uut (
        .ring(ring),
        .vibrate_mode(vibrate_mode),
        .ringer(ringer),
        .motor(motor)
    );

    initial begin
        // Initialize Inputs
        ring = 0;
        vibrate_mode = 0;

        // Test case 1: ring = 0, vibrate_mode = 0
        #10;
        if (ringer !== 0 || motor !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: ring = 1, vibrate_mode = 0
        ring = 1; vibrate_mode = 0;
        #10;
        if (ringer !== 1 || motor !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: ring = 0, vibrate_mode = 1
        ring = 0; vibrate_mode = 1;
        #10;
        if (ringer !== 0 || motor !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: ring = 1, vibrate_mode = 1
        ring = 1; vibrate_mode = 1;
        #10;
        if (ringer !== 0 || motor !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule