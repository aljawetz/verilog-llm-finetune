`timescale 1ns/1ps

module tb_dff;

    reg d;
    reg clk;
    reg set;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the D flip-flop
    dff uut (
        .d(d),
        .clk(clk),
        .set(set),
        .rst(rst),
        .q(q),
        .qbar(qbar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        d = 0;
        set = 1;
        rst = 1;

        // Test 1: Normal operation with set and rst high
        #10;
        d = 1; // Set d to 1
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test 1 failed");
            $finish;
        end

        // Test 2: Reset condition
        #10;
        rst = 0; // Activate reset
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test 2 failed");
            $finish;
        end
        rst = 1; // Deactivate reset

        // Test 3: Set condition
        #10;
        set = 0; // Activate set
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test 3 failed");
            $finish;
        end
        set = 1; // Deactivate set

        // Test 4: Latch d value
        #10;
        d = 0; // Set d to 0
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Test 4 failed");
            $finish;
        end

        // Test 5: Change d value
        #10;
        d = 1; // Set d to 1
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Test 5 failed");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule