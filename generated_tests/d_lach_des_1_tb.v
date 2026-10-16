`timescale 1ns/1ps

module tb_d_lach_des;

    reg d;
    reg en;
    reg rst;
    wire q;

    // Instantiate the module under test (uut)
    d_lach_des uut (
        .d(d),
        .en(en),
        .rst(rst),
        .q(q)
    );

    initial begin
        // Initialize inputs
        d = 0;
        en = 0;
        rst = 0;

        // Test sequence
        // Test 1: Check reset functionality
        rst = 1; #10; // Assert reset
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 2: Check behavior when enable is low
        rst = 0; en = 0; d = 1; #10; // d = 1, en = 0
        if (q !== 0) begin
            $display("FAIL: q should remain 0 when en is low");
            $finish;
        end

        // Test 3: Check behavior when enable is high
        en = 1; #10; // d = 1, en = 1
        if (q !== 1) begin
            $display("FAIL: q should be updated to d when en is high");
            $finish;
        end

        // Test 4: Check behavior with different d values
        d = 0; #10; // d = 0, en = 1
        if (q !== 0) begin
            $display("FAIL: q should be updated to d when d is 0 and en is high");
            $finish;
        end

        // Test 5: Check reset functionality again
        rst = 1; #10; // Assert reset
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 6: Check behavior when enable is low after reset
        rst = 0; en = 0; d = 1; #10; // d = 1, en = 0
        if (q !== 0) begin
            $display("FAIL: q should remain 0 when en is low after reset");
            $finish;
        end

        // Test 7: Check behavior when enable is high after reset
        en = 1; #10; // d = 1, en = 1
        if (q !== 1) begin
            $display("FAIL: q should be updated to d when en is high after reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule