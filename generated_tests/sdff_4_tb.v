`timescale 1ns/1ps

module tb_sdff;
    reg clk;
    reg r;
    reg se;
    reg si;
    reg d;
    wire q;

    // Instantiate the module under test (uut)
    sdff uut (
        .clk(clk),
        .r(r),
        .se(se),
        .si(si),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        r = 0; se = 0; si = 0; d = 0;

        // Test 1: Check reset functionality
        r = 1; #10; // Assert reset
        if (q !== 1'b0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end
        r = 0; #10; // Deassert reset

        // Test 2: Check data input when se is low
        d = 1; #10; // Set d to 1
        if (q !== 1'b1) begin
            $display("FAIL: q did not follow d when se is low");
            $finish;
        end

        // Test 3: Check output when se is high
        se = 1; #10; // Set se to high
        if (q !== 1'b0) begin
            $display("FAIL: q did not set to 0 when se is high");
            $finish;
        end

        // Test 4: Check data input again when se is low
        se = 0; d = 0; #10; // Set d to 0
        if (q !== 1'b0) begin
            $display("FAIL: q did not follow d when se is low");
            $finish;
        end

        // Test 5: Check data input with si (not used in current implementation)
        d = 1; se = 0; #10; // Set d to 1 again
        if (q !== 1'b1) begin
            $display("FAIL: q did not follow d when se is low");
            $finish;
        end

        // Final check: Ensure q holds value after clock edge
        #10;
        if (q !== 1'b1) begin
            $display("FAIL: q did not hold value after clock edge");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule