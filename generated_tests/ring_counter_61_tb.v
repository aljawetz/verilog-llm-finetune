`timescale 1ns/1ps

module tb_ring_counter;

    reg clk;
    reg init;
    wire [7:0] count;

    // Instantiate the ring_counter module
    ring_counter uut (
        .clk(clk),
        .init(init),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        init = 1;
        #10; // Wait for one clock cycle
        init = 0;

        // Check initial state
        if (count !== 8'b10000000) begin
            $display("FAIL: Initial count is not set correctly");
            $finish;
        end

        // Rotate the counter and check values
        #10; // Wait for next clock cycle
        if (count !== 8'b00000001) begin
            $display("FAIL: Count after 1 rotation is incorrect");
            $finish;
        end

        #10; // Wait for next clock cycle
        if (count !== 8'b00000010) begin
            $display("FAIL: Count after 2 rotations is incorrect");
            $finish;
        end

        #10; // Wait for next clock cycle
        if (count !== 8'b00000100) begin
            $display("FAIL: Count after 3 rotations is incorrect");
            $finish;
        end

        #10; // Wait for next clock cycle
        if (count !== 8'b00001000) begin
            $display("FAIL: Count after 4 rotations is incorrect");
            $finish;
        end

        #10; // Wait for next clock cycle
        if (count !== 8'b00010000) begin
            $display("FAIL: Count after 5 rotations is incorrect");
            $finish;
        end

        #10; // Wait for next clock cycle
        if (count !== 8'b00100000) begin
            $display("FAIL: Count after 6 rotations is incorrect");
            $finish;
        end

        #10; // Wait for next clock cycle
        if (count !== 8'b01000000) begin
            $display("FAIL: Count after 7 rotations is incorrect");
            $finish;
        end

        #10; // Wait for next clock cycle
        if (count !== 8'b10000000) begin
            $display("FAIL: Count after 8 rotations is incorrect");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule