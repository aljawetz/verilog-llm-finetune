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
        // Initialize inputs
        rst = 1;
        go = 0;
        wt = 0;

        // Apply reset
        #10 rst = 0; // Assert reset
        #10 rst = 1; // Deassert reset

        // Test sequence 1: Transition from IDLE to READ
        #10 go = 1; // Trigger go
        #10 go = 0; // Release go
        #10 if (uut.state !== 2'b01) $display("FAIL: Expected state READ after go");
        
        // Test sequence 2: Transition from READ to WAIT
        #10 if (uut.state !== 2'b11) $display("FAIL: Expected state WAIT after READ");

        // Test sequence 3: Transition from WAIT to DONE
        #10 wt = 1; // Keep wt high
        #10 if (uut.state !== 2'b11) $display("FAIL: Expected state WAIT while wt is high");
        #10 wt = 0; // Release wt
        #10 if (uut.state !== 2'b10) $display("FAIL: Expected state DONE after wt goes low");

        // Test sequence 4: Transition from DONE to IDLE
        #10 if (uut.state !== 2'b00) $display("FAIL: Expected state IDLE after DONE");

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule