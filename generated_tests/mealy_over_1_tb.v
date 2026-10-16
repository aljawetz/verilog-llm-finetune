`timescale 1ns/1ps

module tb_mealy_over;

    reg i_x;
    reg i_clk;
    reg i_rst_b;
    wire o_seq_detected;

    // Instantiate the module under test (uut)
    mealy_over uut (
        .i_x(i_x),
        .i_clk(i_clk),
        .i_rst_b(i_rst_b),
        .o_seq_detected(o_seq_detected)
    );

    // Clock generation
    initial begin
        i_clk = 0;
        forever #5 i_clk = ~i_clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        i_x = 0;
        i_rst_b = 0;

        // Apply reset
        #10;
        i_rst_b = 1; // Release reset

        // Test sequence "1001"
        #10; i_x = 1; // State A to B
        #10; i_x = 0; // State B to C
        #10; i_x = 0; // State C to D
        #10; i_x = 1; // State D to detected
        #10; 

        // Check detection
        if (o_seq_detected !== 1'b1) begin
            $display("FAIL: Sequence '1001' not detected");
            $finish;
        end

        // Reset and check for no detection
        i_rst_b = 0; // Assert reset
        #10; 
        i_rst_b = 1; // Release reset
        #10; 

        // Check no detection after reset
        if (o_seq_detected !== 1'b0) begin
            $display("FAIL: Output should be low after reset");
            $finish;
        end

        // Test sequence "1001" again
        #10; i_x = 1; // State A to B
        #10; i_x = 0; // State B to C
        #10; i_x = 0; // State C to D
        #10; i_x = 1; // State D to detected
        #10; 

        // Check detection again
        if (o_seq_detected !== 1'b1) begin
            $display("FAIL: Sequence '1001' not detected on second attempt");
            $finish;
        end

        // Complete the test
        $display("PASS");
        $finish;
    end

endmodule