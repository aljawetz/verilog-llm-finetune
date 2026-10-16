`timescale 1ns/1ps

module tb_ChildLock;

    reg clk;
    reg reset;
    reg enable_lock;
    wire lock_active;

    // Instantiate the ChildLock module
    ChildLock uut (
        .clk(clk),
        .reset(reset),
        .enable_lock(enable_lock),
        .lock_active(lock_active)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        enable_lock = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: enable_lock = 0, expect lock_active = 0
        enable_lock = 0;
        #10;
        if (lock_active !== 0) begin
            $display("FAIL: Expected lock_active = 0 when enable_lock = 0");
            $finish;
        end

        // Test case 2: enable_lock = 1, expect lock_active = 1
        enable_lock = 1;
        #10;
        if (lock_active !== 1) begin
            $display("FAIL: Expected lock_active = 1 when enable_lock = 1");
            $finish;
        end

        // Test case 3: enable_lock = 0, expect lock_active = 0
        enable_lock = 0;
        #10;
        if (lock_active !== 0) begin
            $display("FAIL: Expected lock_active = 0 when enable_lock = 0");
            $finish;
        end

        // Test case 4: Reset the module
        reset = 1;
        #10;
        if (lock_active !== 0) begin
            $display("FAIL: Expected lock_active = 0 after reset");
            $finish;
        end

        // Test case 5: Check behavior after reset
        reset = 0;
        enable_lock = 1;
        #10;
        if (lock_active !== 1) begin
            $display("FAIL: Expected lock_active = 1 after reset and enable_lock = 1");
            $finish;
        end

        // Test case 6: Check behavior with reset and enable_lock
        reset = 1;
        #10;
        if (lock_active !== 0) begin
            $display("FAIL: Expected lock_active = 0 after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule