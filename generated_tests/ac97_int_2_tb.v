`timescale 1ns/1ps

module tb_ac97_int;

    // Parameters
    reg clk;
    reg rst;
    wire [2:0] int_set;
    reg [7:0] cfg;
    reg [1:0] status;
    reg full_empty;
    reg full;
    reg empty;
    reg re;
    reg we;

    // Instantiate the Unit Under Test (UUT)
    ac97_int uut (
        .clk(clk),
        .rst(rst),
        .int_set(int_set),
        .cfg(cfg),
        .status(status),
        .full_empty(full_empty),
        .full(full),
        .empty(empty),
        .re(re),
        .we(we)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst = 0;
        cfg = 8'b00000000;
        status = 2'b00;
        full_empty = 0;
        full = 0;
        empty = 0;
        re = 0;
        we = 0;

        // Release reset
        #10;
        rst = 1;

        // Test case 1: Check interrupt for 1/4 full/empty
        cfg = 8'b00000001; // Enable interrupt
        status = 2'b00; // FIFO status
        full_empty = 1; // FIFO is full
        #10;
        if (int_set != 3'b000) $display("FAIL: Test case 1 failed, expected int_set = 000, got %b", int_set);

        // Test case 2: Check interrupt for 1/2 full/empty
        cfg = 8'b00000001; // Enable interrupt
        status = 2'b01; // FIFO status
        full_empty = 1; // FIFO is full
        #10;
        if (int_set != 3'b000) $display("FAIL: Test case 2 failed, expected int_set = 000, got %b", int_set);

        // Test case 3: Check interrupt for 3/4 full/empty
        cfg = 8'b00000001; // Enable interrupt
        status = 2'b10; // FIFO status
        full_empty = 1; // FIFO is full
        #10;
        if (int_set != 3'b000) $display("FAIL: Test case 3 failed, expected int_set = 000, got %b", int_set);

        // Test case 4: Check empty interrupt
        cfg = 8'b00000001; // Enable interrupt
        empty = 1; // FIFO is empty
        re = 1; // Read enable
        #10;
        if (int_set[1] != 1'b1) $display("FAIL: Test case 4 failed, expected int_set[1] = 1, got %b", int_set);

        // Test case 5: Check full interrupt
        cfg = 8'b00000001; // Enable interrupt
        full = 1; // FIFO is full
        we = 1; // Write enable
        #10;
        if (int_set[2] != 1'b1) $display("FAIL: Test case 5 failed, expected int_set[2] = 1, got %b", int_set);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule