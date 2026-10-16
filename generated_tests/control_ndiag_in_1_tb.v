`timescale 1ns/1ps

module tb_control_ndiag_in;

    // Testbench signals
    reg clock;
    reg areset;
    reg diag_done;
    reg [31:0] bu1, bu2, bu3, bu4;
    wire [31:0] ndiag_out;

    // Instantiate the module under test (uut)
    control_ndiag_in uut (
        .clock(clock),
        .areset(areset),
        .diag_done(diag_done),
        .bu1(bu1),
        .bu2(bu2),
        .bu3(bu3),
        .bu4(bu4),
        .ndiag_out(ndiag_out)
    );

    // Clock generation
    initial begin
        clock = 0;
        forever #5 clock = ~clock; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        areset = 1;
        diag_done = 0;
        bu1 = 32'hA1A1A1A1;
        bu2 = 32'hB2B2B2B2;
        bu3 = 32'hC3C3C3C3;
        bu4 = 32'hD4D4D4D4;

        // Release reset
        #10 areset = 0;

        // Check initial state (should output bu1)
        #10;
        if (ndiag_out !== bu1) begin
            $display("FAIL: Initial output is incorrect");
            $finish;
        end

        // Transition to state 2
        diag_done = 1; #10;
        diag_done = 0; #10;
        if (ndiag_out !== bu2) begin
            $display("FAIL: Output after first diag_done is incorrect");
            $finish;
        end

        // Transition to state 3
        diag_done = 1; #10;
        diag_done = 0; #10;
        if (ndiag_out !== bu3) begin
            $display("FAIL: Output after second diag_done is incorrect");
            $finish;
        end

        // Transition to state 4
        diag_done = 1; #10;
        diag_done = 0; #10;
        if (ndiag_out !== bu4) begin
            $display("FAIL: Output after third diag_done is incorrect");
            $finish;
        end

        // Transition back to state 1
        diag_done = 1; #10;
        diag_done = 0; #10;
        if (ndiag_out !== bu1) begin
            $display("FAIL: Output after fourth diag_done is incorrect");
            $finish;
        end

        // Test asynchronous reset
        areset = 1; #10;
        areset = 0; #10;
        if (ndiag_out !== bu1) begin
            $display("FAIL: Output after reset is incorrect");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule