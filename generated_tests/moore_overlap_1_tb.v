`timescale 1ns/1ps

module tb_moore_overlap;

    reg i_x;
    reg i_clk;
    reg i_reset;
    wire o_seq_detected;

    // Instantiate the module under test (uut)
    moore_overlap uut (
        .i_x(i_x),
        .i_clk(i_clk),
        .i_reset(i_reset),
        .o_seq_detected(o_seq_detected)
    );

    // Clock generation
    initial begin
        i_clk = 0;
        forever #5 i_clk = ~i_clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        i_reset = 0;
        i_x = 0;
        #10; // Wait for reset to take effect

        // Apply reset
        i_reset = 1;
        #10;

        // Test sequence: 1, 0, 0, 1, 0 (should detect sequence)
        i_x = 1; #10; // State B
        i_x = 0; #10; // State C
        i_x = 0; #10; // State D
        i_x = 1; #10; // State E (o_seq_detected should be high)
        
        if (o_seq_detected !== 1'b1) begin
            $display("FAIL: Sequence not detected when expected.");
            $finish;
        end

        // Reset and check for no detection
        i_reset = 0; #10;
        i_reset = 1; #10;

        // Test sequence: 1, 1, 0, 0 (should not detect)
        i_x = 1; #10; // State B
        i_x = 1; #10; // State B
        i_x = 0; #10; // State C
        i_x = 0; #10; // State D
        
        if (o_seq_detected !== 1'b0) begin
            $display("FAIL: Sequence detected when it should not.");
            $finish;
        end

        // Test sequence: 1, 0, 1, 0 (should detect again)
        i_x = 1; #10; // State B
        i_x = 0; #10; // State C
        i_x = 1; #10; // State B
        i_x = 0; #10; // State C
        
        if (o_seq_detected !== 1'b0) begin
            $display("FAIL: Sequence detected when it should not.");
            $finish;
        end

        // Final sequence to ensure detection
        i_x = 1; #10; // State B
        i_x = 0; #10; // State C
        i_x = 0; #10; // State D
        i_x = 1; #10; // State E (o_seq_detected should be high)
        
        if (o_seq_detected !== 1'b1) begin
            $display("FAIL: Final sequence not detected when expected.");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule