`timescale 1ns/1ps

module tb_MainControl;

    // Inputs
    reg start;
    reg reset;
    reg clock1;
    reg clock2;
    reg errdetect;
    reg finish_kes;
    reg [2:0] rootcntr;
    reg [2:0] lambda_degree;

    // Outputs
    wire active_sc;
    wire active_kes;
    wire active_csee;
    wire ready;
    wire evalsynd;
    wire holdsynd;
    wire errfound;
    wire decode_fail;
    wire dataoutstart;
    wire dataoutend;
    wire shift_fifo;
    wire hold_fifo;
    wire en_infifo;
    wire en_outfifo;
    wire lastdataout;
    wire evalerror;

    // Instantiate the Unit Under Test (UUT)
    MainControl uut (
        .start(start),
        .reset(reset),
        .clock1(clock1),
        .clock2(clock2),
        .finish_kes(finish_kes),
        .errdetect(errdetect),
        .rootcntr(rootcntr),
        .lambda_degree(lambda_degree),
        .active_sc(active_sc),
        .active_kes(active_kes),
        .active_csee(active_csee),
        .ready(ready),
        .evalsynd(evalsynd),
        .holdsynd(holdsynd),
        .errfound(errfound),
        .decode_fail(decode_fail),
        .dataoutstart(dataoutstart),
        .dataoutend(dataoutend),
        .shift_fifo(shift_fifo),
        .hold_fifo(hold_fifo),
        .en_infifo(en_infifo),
        .en_outfifo(en_outfifo),
        .lastdataout(lastdataout),
        .evalerror(evalerror)
    );

    // Clock generation
    initial begin
        clock1 = 0;
        forever #5 clock1 = ~clock1; // 100MHz clock
    end

    initial begin
        clock2 = 0;
        forever #7 clock2 = ~clock2; // 71.43MHz clock
    end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 0;
        start = 0;
        errdetect = 0;
        finish_kes = 0;
        rootcntr = 3'b000;
        lambda_degree = 3'b000;

        // Apply reset
        #10 reset = 1;
        #10 reset = 0;
        #10 reset = 1;

        // Test case 1: Start the FSM
        #10 start = 1;
        #10 start = 0;

        // Wait for some time to observe behavior
        #100;

        // Test case 2: Simulate error detection
        #10 errdetect = 1;
        #10 errdetect = 0;

        // Wait for some time to observe behavior
        #100;

        // Test case 3: Finish KES
        #10 finish_kes = 1;
        #10 finish_kes = 0;

        // Wait for some time to observe behavior
        #100;

        // Test case 4: Change root counter and lambda degree
        #10 rootcntr = 3'b010;
        lambda_degree = 3'b010;

        // Wait for some time to observe behavior
        #100;

        // Check outputs
        if (active_sc !== 0 || active_kes !== 0 || ready !== 1) begin
            $display("FAIL: Initial state check failed");
            $finish;
        end

        // Check for evaluation syndrome
        if (evalsynd !== 0) begin
            $display("FAIL: evalsynd should be 0 in initial state");
            $finish;
        end

        // Check for error found
        if (errfound !== 0) begin
            $display("FAIL: errfound should be 0 in initial state");
            $finish;
        end

        // Check for decode fail
        if (decode_fail !== 0) begin
            $display("FAIL: decode_fail should be 0 in initial state");
            $finish;
        end

        // End simulation
        $display("PASS");
        $finish;
    end

endmodule