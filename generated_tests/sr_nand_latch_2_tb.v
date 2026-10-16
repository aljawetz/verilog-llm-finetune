`timescale 1ns/1ps

module tb_sr_nand_latch;

    // Inputs
    reg s;
    reg r;

    // Outputs
    wire q;
    wire qbar;

    // Instantiate the Unit Under Test (UUT)
    sr_nand_latch uut (
        .s(s),
        .r(r),
        .q(q),
        .qbar(qbar)
    );

    initial begin
        // Initialize inputs
        s = 1;
        r = 1;

        // Wait for some time to stabilize
        #10;

        // Test case 1: Set the latch
        s = 0; r = 1; // Set condition
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 1 failed (Set condition)");
            $finish;
        end

        // Test case 2: Reset the latch
        s = 1; r = 0; // Reset condition
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 2 failed (Reset condition)");
            $finish;
        end

        // Test case 3: Hold state
        s = 1; r = 1; // Hold state
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 3 failed (Hold state)");
            $finish;
        end

        // Test case 4: Set again
        s = 0; r = 1; // Set condition
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test case 4 failed (Set condition again)");
            $finish;
        end

        // Test case 5: Reset again
        s = 1; r = 0; // Reset condition
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test case 5 failed (Reset condition again)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule