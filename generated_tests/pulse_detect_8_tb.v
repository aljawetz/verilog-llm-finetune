`timescale 1ns/1ps

module tb_pulse_detect;

    // Testbench signals
    reg clk;
    reg rst_n;
    reg data_in;
    wire data_out;

    // Instantiate the module under test (uut)
    pulse_detect uut (
        .clk(clk),
        .rst_n(rst_n),
        .data_in(data_in),
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
        rst_n = 0;
        data_in = 0;

        // Apply reset
        #10;
        rst_n = 1;

        // Test case 1: Single pulse detection
        #10; data_in = 1; // Start pulse
        #10; data_in = 0; // End pulse
        #10; // Wait for output pulse
        if (data_out !== 1'b1) begin
            $display("FAIL: Expected data_out to be 1 after pulse detection");
            $finish;
        end

        // Clear output
        #10; 
        if (data_out !== 1'b0) begin
            $display("FAIL: Expected data_out to be 0 after pulse");
            $finish;
        end

        // Test case 2: No pulse
        #10; 
        data_in = 0; // No pulse
        #10; 
        if (data_out !== 1'b0) begin
            $display("FAIL: Expected data_out to remain 0 with no pulse");
            $finish;
        end

        // Test case 3: Continuous pulse
        #10; 
        data_in = 1; // Start pulse
        #10; 
        data_in = 1; // Still high
        #10; 
        data_in = 0; // End pulse
        #10; 
        if (data_out !== 1'b1) begin
            $display("FAIL: Expected data_out to be 1 after continuous pulse");
            $finish;
        end

        // Clear output
        #10; 
        if (data_out !== 1'b0) begin
            $display("FAIL: Expected data_out to be 0 after pulse");
            $finish;
        end

        // Test case 4: Multiple pulses
        #10; 
        data_in = 1; // Start pulse
        #10; 
        data_in = 0; // End pulse
        #10; 
        if (data_out !== 1'b1) begin
            $display("FAIL: Expected data_out to be 1 after first pulse");
            $finish;
        end

        #10; 
        data_in = 1; // Start second pulse
        #10; 
        data_in = 0; // End second pulse
        #10; 
        if (data_out !== 1'b1) begin
            $display("FAIL: Expected data_out to be 1 after second pulse");
            $finish;
        end

        // Final check
        #10; 
        if (data_out !== 1'b0) begin
            $display("FAIL: Expected data_out to be 0 after second pulse");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule