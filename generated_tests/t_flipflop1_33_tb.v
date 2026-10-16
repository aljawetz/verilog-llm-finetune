`timescale 1ns/1ps

module tb_t_flipflop1;

    reg t;
    reg clk;
    reg rst;
    wire q;
    wire qbar;

    // Instantiate the T flip-flop
    t_flipflop1 uut (
        .t(t),
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
        // Initialize signals
        rst = 1; t = 0;
        #10; // Wait for a clock cycle
        rst = 0; // Release reset

        // Test case 1: Check reset functionality
        #10;
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1");
            $finish;
        end

        // Test case 2: Toggle q with t = 1
        t = 1; // Set t high
        #10; // Wait for clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: q did not toggle to 1 when t is 1");
            $finish;
        end

        // Test case 3: Toggle q with t = 0
        t = 0; // Set t low
        #10; // Wait for clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: q did not remain 1 when t is 0");
            $finish;
        end

        // Test case 4: Toggle q with t = 1 again
        t = 1; // Set t high
        #10; // Wait for clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: q did not toggle to 0 when t is 1 again");
            $finish;
        end

        // Test case 5: Check reset functionality again
        rst = 1; // Assert reset
        #10; // Wait for a clock edge
        if (q !== 0 || qbar !== 1) begin
            $display("FAIL: Reset did not set q to 0 and qbar to 1 again");
            $finish;
        end

        // Test case 6: Check toggling after reset
        rst = 0; // Release reset
        t = 1; // Set t high
        #10; // Wait for clock edge
        if (q !== 1 || qbar !== 0) begin
            $display("FAIL: q did not toggle to 1 after reset when t is 1");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule