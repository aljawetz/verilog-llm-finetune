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

        // Test 1: Check reset functionality
        rst = 0; // Activate reset
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test 2: Check set functionality
        rst = 1; // Deactivate reset
        set = 0; // Activate set
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Set did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test 3: Check normal operation
        set = 1; // Deactivate set
        d = 1;   // Set d to 1
        #10;     // Wait for clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: D flip-flop did not capture d correctly");
            $finish;
        end

        // Test 4: Check with d = 0
        d = 0;   // Set d to 0
        #10;     // Wait for clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: D flip-flop did not capture d correctly");
            $finish;
        end

        // Test 5: Check reset during normal operation
        rst = 0; // Activate reset
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset during operation did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test 6: Check set during normal operation
        rst = 1; // Deactivate reset
        set = 0; // Activate set
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Set during operation did not set q to 0 and qbar to 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule