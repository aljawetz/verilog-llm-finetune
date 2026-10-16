`timescale 1ns/1ps

module tb_dff;

    reg d, set, reset, clk;
    wire q, qbar;

    // Instantiate the D flip-flop
    dff uut (
        .q(q),
        .qbar(qbar),
        .d(d),
        .set(set),
        .reset(reset),
        .clk(clk)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        d = 0; set = 1; reset = 1;

        // Test 1: Check reset functionality
        reset = 0; // Assert reset
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end
        reset = 1; // Deassert reset

        // Test 2: Check set functionality
        set = 0; // Assert set
        #10;
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: Set did not set q to 1");
            $finish;
        end
        set = 1; // Deassert set

        // Test 3: Check D input functionality
        d = 1; // Set D to 1
        #10; // Wait for clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: D input did not set q to 1");
            $finish;
        end

        d = 0; // Set D to 0
        #10; // Wait for clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: D input did not set q to 0");
            $finish;
        end

        // Test 4: Check behavior with multiple clock edges
        d = 1; // Set D to 1
        #10; // Wait for clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: D input did not set q to 1 on clock edge");
            $finish;
        end

        d = 0; // Set D to 0
        #10; // Wait for clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: D input did not set q to 0 on clock edge");
            $finish;
        end

        // Final check with reset
        reset = 0; // Assert reset
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule