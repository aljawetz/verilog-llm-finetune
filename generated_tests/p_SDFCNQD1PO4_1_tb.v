`timescale 1ns/1ps

module tb_p_SDFCNQD1PO4;

    reg D;
    reg CP;
    reg CDN;
    wire Q;

    // Instantiate the module under test
    p_SDFCNQD1PO4 uut (
        .D(D),
        .CP(CP),
        .CDN(CDN),
        .Q(Q)
    );

    // Clock generation
    initial begin
        CP = 0;
        forever #5 CP = ~CP; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        D = 0;
        CDN = 1;

        // Test 1: Check reset functionality
        CDN = 0; // Assert reset
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not clear Q to 0");
            $finish;
        end

        // Test 2: Check D input on clock edge
        CDN = 1; // Deassert reset
        D = 1; // Set D to 1
        #10; // Wait for clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not update to D on clock edge");
            $finish;
        end

        // Test 3: Check D input changes on clock edge
        D = 0; // Change D to 0
        #10; // Wait for clock edge
        if (Q !== 1'b0) begin
            $display("FAIL: Q did not update to D on clock edge");
            $finish;
        end

        // Test 4: Check reset functionality again
        CDN = 0; // Assert reset
        #10;
        if (Q !== 1'b0) begin
            $display("FAIL: Reset did not clear Q to 0");
            $finish;
        end

        // Test 5: Check D input after reset
        CDN = 1; // Deassert reset
        D = 1; // Set D to 1
        #10; // Wait for clock edge
        if (Q !== 1'b1) begin
            $display("FAIL: Q did not update to D on clock edge after reset");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule