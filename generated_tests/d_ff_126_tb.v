`timescale 1ns/1ps

module tb_d_ff;

    reg in;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the D flip-flop
    d_ff uut (
        .in(in),
        .clk(clk),
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
        in = 0;
        rst = 0;

        // Test 1: Reset the flip-flop
        rst = 1; // Activate reset
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 2: Check qbar after reset
        if (qbar !== 1) begin
            $display("FAIL: qbar did not output 1 after reset");
            $finish;
        end

        // Test 3: Set input and clock
        rst = 0; // Deactivate reset
        in = 1; // Set input to 1
        #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: q did not update to 1");
            $finish;
        end

        // Test 4: Check qbar after input is set
        if (qbar !== 0) begin
            $display("FAIL: qbar did not output 0 after input is set to 1");
            $finish;
        end

        // Test 5: Change input and clock
        in = 0; // Change input to 0
        #10; // Wait for a clock edge
        if (q !== 0) begin
            $display("FAIL: q did not update to 0");
            $finish;
        end

        // Test 6: Check qbar after input is changed
        if (qbar !== 1) begin
            $display("FAIL: qbar did not output 1 after input is changed to 0");
            $finish;
        end

        // Test 7: Assert behavior with multiple clock cycles
        in = 1; // Set input to 1
        #10; // Wait for a clock edge
        if (q !== 1) begin
            $display("FAIL: q did not remain 1 after multiple clock cycles");
            $finish;
        end

        // Final check
        if (qbar !== 0) begin
            $display("FAIL: qbar did not remain 0 after multiple clock cycles");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule