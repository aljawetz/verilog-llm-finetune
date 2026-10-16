`timescale 1ns/1ps

module tb_my_dff_en;

    reg DFF_CLOCK;
    reg clock_enable;
    reg D;
    wire Q;

    // Instantiate the module under test (uut)
    my_dff_en uut (
        .DFF_CLOCK(DFF_CLOCK),
        .clock_enable(clock_enable),
        .D(D),
        .Q(Q)
    );

    // Clock generation
    initial begin
        DFF_CLOCK = 0;
        forever #5 DFF_CLOCK = ~DFF_CLOCK; // 10ns period
    end

    initial begin
        // Initialize inputs
        clock_enable = 0;
        D = 0;

        // Test sequence
        #10; // Wait for the first clock edge

        // Test 1: Check that Q remains 0 when clock_enable is low
        D = 1;
        #10; // Wait for the next clock edge
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 when clock_enable is low");
            $finish;
        end

        // Test 2: Enable clock and check that Q updates
        clock_enable = 1;
        #10; // Wait for the next clock edge
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when clock_enable is high and D is 1");
            $finish;
        end

        // Test 3: Change D while clock_enable is high
        D = 0;
        #10; // Wait for the next clock edge
        if (Q !== 0) begin
            $display("FAIL: Q should be 0 after D changes to 0 with clock_enable high");
            $finish;
        end

        // Test 4: Disable clock and check that Q remains unchanged
        clock_enable = 0;
        #10; // Wait for the next clock edge
        if (Q !== 0) begin
            $display("FAIL: Q should remain 0 when clock_enable is low");
            $finish;
        end

        // Test 5: Re-enable clock and check that Q updates again
        clock_enable = 1;
        D = 1;
        #10; // Wait for the next clock edge
        if (Q !== 1) begin
            $display("FAIL: Q should be 1 when clock_enable is high and D is 1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule