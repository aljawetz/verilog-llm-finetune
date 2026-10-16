`timescale 1ns/1ps

module tb_fsm;

    reg clk;
    reg rst;
    reg go;
    reg wt;
    wire ds;
    wire rd;

    // Instantiate the module under test (uut)
    fsm uut (
        .clk(clk),
        .rst(rst),
        .go(go),
        .wt(wt),
        .ds(ds),
        .rd(rd)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 1;
        go = 0;
        wt = 0;

        // Apply reset
        #10 rst = 0; // Assert reset
        #10 rst = 1; // Deassert reset

        // Test 1: Transition from IDLE to READ
        #10 go = 1; // Set go to trigger transition
        #10 go = 0; // Clear go
        if (uut.state !== 2'b01) $display("FAIL: Expected state READ after go asserted");

        // Test 2: Transition from READ to WAIT
        #10;
        if (uut.state !== 2'b11) $display("FAIL: Expected state WAIT after READ");

        // Test 3: Transition from WAIT to DONE
        #10 wt = 1; // Keep wt high
        #10 wt = 0; // Clear wt
        if (uut.state !== 2'b10) $display("FAIL: Expected state DONE after wt cleared");

        // Test 4: Transition from DONE to IDLE
        #10;
        if (uut.state !== 2'b00) $display("FAIL: Expected state IDLE after DONE");

        // Test 5: Check outputs
        #10;
        if (rd !== 0) $display("FAIL: Expected rd to be 0 in IDLE state");
        if (ds !== 0) $display("FAIL: Expected ds to be 0 in IDLE state");

        // Final checks
        #10 go = 1; // Trigger again
        #10 go = 0;
        #10;
        if (rd !== 1) $display("FAIL: Expected rd to be 1 in READ state");
        if (ds !== 0) $display("FAIL: Expected ds to be 0 in READ state");

        #10 wt = 1; // Trigger WAIT
        #10;
        if (rd !== 1) $display("FAIL: Expected rd to be 1 in WAIT state");
        if (ds !== 0) $display("FAIL: Expected ds to be 0 in WAIT state");

        #10 wt = 0; // Trigger DONE
        #10;
        if (rd !== 0) $display("FAIL: Expected rd to be 0 in DONE state");
        if (ds !== 1) $display("FAIL: Expected ds to be 1 in DONE state");

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule