`timescale 1ns/1ps

module tb_can_tx;
    reg clk;
    reg reset;
    reg [7:0] data_in;
    reg send;
    wire can_out;
    wire busy;

    // Instantiate the Unit Under Test (UUT)
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
        
        // Release reset
        reset = 0;
        #10;

        // Test case 1: Assert busy and toggle can_out when send is high
        send = 1;
        #10;
        if (busy !== 1) begin
            $display("FAIL: busy should be asserted when sending");
            $finish;
        end
        if (can_out !== 0) begin
            $display("FAIL: can_out should toggle to 0 when sending");
            $finish;
        end

        // Wait for another clock cycle to toggle can_out
        #10;
        if (can_out !== 1) begin
            $display("FAIL: can_out should toggle to 1 after another clock cycle");
            $finish;
        end

        // Test case 2: Deassert send and check busy
        send = 0;
        #10;
        if (busy !== 0) begin
            $display("FAIL: busy should be deasserted when not sending");
            $finish;
        end

        // Test case 3: Assert reset and check outputs
        reset = 1;
        #10;
        if (can_out !== 1) begin
            $display("FAIL: can_out should be 1 after reset");
            $finish;
        end
        if (busy !== 0) begin
            $display("FAIL: busy should be 0 after reset");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end
endmodule