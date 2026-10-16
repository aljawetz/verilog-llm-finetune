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
        r = 0;
        se = 0;
        si = 0;
        d = 0;

        // Test case 1: Reset functionality
        r = 1; #10; // Assert reset
        if (q !== 1'b0) $display("FAIL: Reset did not set q to 0");
        
        r = 0; #10; // Deassert reset

        // Test case 2: Check d input when se is low
        d = 1; se = 0; #10; // Set d to 1
        if (q !== 1'b1) $display("FAIL: q did not follow d when se is low");

        // Test case 3: Check se functionality
        se = 1; #10; // Set se high
        if (q !== 1'b0) $display("FAIL: q did not set to 0 when se is high");

        // Test case 4: Check d input again when se is low
        se = 0; d = 0; #10; // Set d to 0
        if (q !== 1'b0) $display("FAIL: q did not follow d when se is low");

        d = 1; #10; // Set d to 1
        if (q !== 1'b1) $display("FAIL: q did not follow d when se is low");

        // Test case 5: Check reset again
        r = 1; #10; // Assert reset
        if (q !== 1'b0) $display("FAIL: Reset did not set q to 0");

        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule