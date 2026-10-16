`timescale 1ns/1ps

module tb_down_counter;

    reg clk;
    reg reset;
    reg en;
    wire [2:0] data_out;

    // Instantiate the down_counter module
    down_counter uut (
        .clk(clk),
        .reset(reset),
        .en(en),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 0;
        en = 0;

        // Apply reset
        #10 reset = 1; // Release reset after 10ns
        #10;

        // Check initial value after reset
        if (data_out !== 3'b111) begin
            $display("FAIL: Initial value after reset is not 111");
            $finish;
        end

        // Enable the counter
        en = 1;

        // Count down from 111 to 000
        #10;
        if (data_out !== 3'b110) begin
            $display("FAIL: Expected 110, got %b", data_out);
            $finish;
        end

        #10;
        if (data_out !== 3'b101) begin
            $display("FAIL: Expected 101, got %b", data_out);
            $finish;
        end

        #10;
        if (data_out !== 3'b100) begin
            $display("FAIL: Expected 100, got %b", data_out);
            $finish;
        end

        #10;
        if (data_out !== 3'b011) begin
            $display("FAIL: Expected 011, got %b", data_out);
            $finish;
        end

        #10;
        if (data_out !== 3'b010) begin
            $display("FAIL: Expected 010, got %b", data_out);
            $finish;
        end

        #10;
        if (data_out !== 3'b001) begin
            $display("FAIL: Expected 001, got %b", data_out);
            $finish;
        end

        #10;
        if (data_out !== 3'b000) begin
            $display("FAIL: Expected 000, got %b", data_out);
            $finish;
        end

        // Check reload to 111
        #10;
        if (data_out !== 3'b111) begin
            $display("FAIL: Expected 111 after reaching 000, got %b", data_out);
            $finish;
        end

        // Finish simulation
        $display("PASS");
        $finish;
    end

endmodule