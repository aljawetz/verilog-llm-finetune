`timescale 1ns/1ps

module tb_can_rx;
    reg clk;
    reg reset;
    reg can_in;
    wire [7:0] data_out;
    wire valid;

    // Instantiate the module under test (uut)
    can_rx uut (
        .clk(clk),
        .reset(reset),
        .can_in(can_in),
        .data_out(data_out),
        .valid(valid)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        can_in = 0;
        #10; // Wait for 10ns
        reset = 0;

        // Test case 1: Check reset behavior
        #10;
        if (data_out !== 8'b0 || valid !== 0) begin
            $display("FAIL: Reset did not clear outputs");
            $finish;
        end

        // Test case 2: Shift in data
        can_in = 1; // Simulate CAN input
        #10; // Wait for one clock cycle
        if (data_out !== 8'b00000001 || valid !== 1) begin
            $display("FAIL: Data out incorrect after first input");
            $finish;
        end

        can_in = 1; // Shift in another bit
        #10; // Wait for one clock cycle
        if (data_out !== 8'b00000011 || valid !== 1) begin
            $display("FAIL: Data out incorrect after second input");
            $finish;
        end

        can_in = 0; // No input
        #10; // Wait for one clock cycle
        if (valid !== 0) begin
            $display("FAIL: Valid signal should be low when can_in is 0");
            $finish;
        end

        // Test case 3: Shift in more data
        can_in = 1; // Shift in another bit
        #10; // Wait for one clock cycle
        if (data_out !== 8'b00000111 || valid !== 1) begin
            $display("FAIL: Data out incorrect after third input");
            $finish;
        end

        // Test case 4: Check that valid goes low when can_in is 0
        can_in = 0; // No input
        #10; // Wait for one clock cycle
        if (valid !== 0) begin
            $display("FAIL: Valid signal should be low when can_in is 0");
            $finish;
        end

        // Test case 5: Check data_out remains unchanged when can_in is 0
        #10; // Wait for one clock cycle
        if (data_out !== 8'b00000111) begin
            $display("FAIL: Data out should remain unchanged when can_in is 0");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end
endmodule