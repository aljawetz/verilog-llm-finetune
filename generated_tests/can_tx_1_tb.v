`timescale 1ns/1ps

module tb_can_tx;
    reg clk;
    reg reset;
    reg [7:0] data_in;
    reg send;
    wire can_out;
    wire busy;

    // Instantiate the module under test (uut)
    can_tx uut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .send(send),
        .can_out(can_out),
        .busy(busy)
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
        send = 0;
        data_in = 8'h00;

        // Wait for a clock cycle
        #10;
        reset = 0;

        // Test 1: Check reset state
        #10;
        if (can_out !== 1'b1 || busy !== 1'b0) begin
            $display("FAIL: Reset state incorrect");
            $finish;
        end

        // Test 2: Send data
        data_in = 8'hA5; // Example data
        send = 1;
        #10; // Wait for one clock cycle

        // Check busy and can_out after sending
        if (busy !== 1'b1) begin
            $display("FAIL: Busy signal not set during send");
            $finish;
        end

        // Check can_out toggling
        if (can_out !== 1'b0) begin
            $display("FAIL: can_out did not toggle as expected");
            $finish;
        end

        // Test 3: Stop sending
        send = 0;
        #10; // Wait for one clock cycle

        // Check busy and can_out after stopping send
        if (busy !== 1'b0) begin
            $display("FAIL: Busy signal not cleared after send stopped");
            $finish;
        end

        if (can_out !== 1'b0) begin
            $display("FAIL: can_out did not remain stable after send stopped");
            $finish;
        end

        // Test 4: Assert reset again
        reset = 1;
        #10; // Wait for one clock cycle
        reset = 0;

        // Check reset state again
        if (can_out !== 1'b1 || busy !== 1'b0) begin
            $display("FAIL: Reset state incorrect after reasserting reset");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule