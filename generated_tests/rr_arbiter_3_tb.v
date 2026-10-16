`timescale 1ns/1ps

module tb_rr_arbiter;

    // Parameters
    reg clk;
    reg reset;
    reg req0;
    reg req1;
    reg req2;
    reg req3;
    wire gnt0;
    wire gnt1;
    wire gnt2;
    wire gnt3;

    // Instantiate the Unit Under Test (UUT)
    rr_arbiter uut (
        .clk(clk),
        .reset(reset),
        .req0(req0),
        .req1(req1),
        .req2(req2),
        .req3(req3),
        .gnt0(gnt0),
        .gnt1(gnt1),
        .gnt2(gnt2),
        .gnt3(gnt3)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1;
        req0 = 0;
        req1 = 0;
        req2 = 0;
        req3 = 0;

        // Release reset
        #10;
        reset = 0;

        // Test case 1: Single request
        req0 = 1; #10;
        if (gnt0 !== 1) $display("FAIL: Test case 1 failed, expected gnt0=1, got gnt0=%b", gnt0);

        // Test case 2: Rotate to next request
        req0 = 0; req1 = 1; #10;
        if (gnt1 !== 1) $display("FAIL: Test case 2 failed, expected gnt1=1, got gnt1=%b", gnt1);

        // Test case 3: Rotate to next request
        req1 = 0; req2 = 1; #10;
        if (gnt2 !== 1) $display("FAIL: Test case 3 failed, expected gnt2=1, got gnt2=%b", gnt2);

        // Test case 4: Rotate to next request
        req2 = 0; req3 = 1; #10;
        if (gnt3 !== 1) $display("FAIL: Test case 4 failed, expected gnt3=1, got gnt3=%b", gnt3);

        // Test case 5: All requests
        req0 = 1; req1 = 1; req2 = 1; req3 = 1; #10;
        if (gnt0 !== 1) $display("FAIL: Test case 5 failed, expected gnt0=1, got gnt0=%b", gnt0);
        #10;
        if (gnt1 !== 1) $display("FAIL: Test case 5 failed, expected gnt1=1, got gnt1=%b", gnt1);
        #10;
        if (gnt2 !== 1) $display("FAIL: Test case 5 failed, expected gnt2=1, got gnt2=%b", gnt2);
        #10;
        if (gnt3 !== 1) $display("FAIL: Test case 5 failed, expected gnt3=1, got gnt3=%b", gnt3);

        // Test case 6: No requests
        req0 = 0; req1 = 0; req2 = 0; req3 = 0; #10;
        if (gnt0 !== 0 || gnt1 !== 0 || gnt2 !== 0 || gnt3 !== 0) 
            $display("FAIL: Test case 6 failed, expected all grants to be 0, got gnt0=%b, gnt1=%b, gnt2=%b, gnt3=%b", gnt0, gnt1, gnt2, gnt3);

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule