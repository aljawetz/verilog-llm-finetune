`timescale 1ns/1ps

module tb_d_ff;

    // Inputs
    reg in;
    reg clk;
    reg rst;

    // Outputs
    wire q;
    wire qbar;

    // Instantiate the Unit Under Test (UUT)
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
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Deactivate reset
        rst = 0;
        #10; // Wait for one clock cycle

        // Test 2: Check D flip-flop functionality
        in = 1; // Set input to 1
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not capture input value 1");
            $finish;
        end

        // Test 3: Change input to 0
        in = 0; 
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not capture input value 0");
            $finish;
        end

        // Test 4: Assert reset again
        rst = 1; // Activate reset
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // Test 5: Check qbar output
        rst = 0; // Deactivate reset
        in = 1; // Set input to 1
        #10; // Wait for one clock cycle
        if (qbar !== 0) begin
            $display("FAIL: qbar did not output the inverted value of q");
            $finish;
        end

        // Final check
        in = 0; 
        #10; // Wait for one clock cycle
        if (qbar !== 1) begin
            $display("FAIL: qbar did not output the inverted value of q after input change");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule