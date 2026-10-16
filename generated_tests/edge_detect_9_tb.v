`timescale 1ns/1ps

module tb_edge_detect;

    // Testbench signals
    reg clk;
    reg rst_n;
    reg a;
    wire rise;
    wire down;

    // Instantiate the edge_detect module
    edge_detect uut (
        .clk(clk),
        .rst_n(rst_n),
        .a(a),
        .rise(rise),
        .down(down)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0; // Assert reset
        a = 0;
        #10; // Wait for 10ns
        
        rst_n = 1; // Deassert reset
        #10; // Wait for 10ns

        // Test rising edge detection
        a = 0; #10; // a stays low
        if (rise !== 1'b0 || down !== 1'b0) begin
            $display("FAIL: Initial state check failed");
            $finish;
        end
        
        a = 1; #10; // a goes high
        if (rise !== 1'b1 || down !== 1'b0) begin
            $display("FAIL: Rising edge detection failed");
            $finish;
        end
        
        // Clear rise signal
        #10; 
        if (rise !== 1'b0) begin
            $display("FAIL: Rise signal not cleared after detection");
            $finish;
        end

        // Test falling edge detection
        a = 1; #10; // a stays high
        if (rise !== 1'b0 || down !== 1'b0) begin
            $display("FAIL: State check failed before falling edge");
            $finish;
        end
        
        a = 0; #10; // a goes low
        if (rise !== 1'b0 || down !== 1'b1) begin
            $display("FAIL: Falling edge detection failed");
            $finish;
        end
        
        // Clear down signal
        #10; 
        if (down !== 1'b0) begin
            $display("FAIL: Down signal not cleared after detection");
            $finish;
        end

        // Test reset functionality
        a = 1; #10; // a goes high
        rst_n = 0; // Assert reset
        #10; // Wait for reset to take effect
        if (rise !== 1'b0 || down !== 1'b0) begin
            $display("FAIL: Reset functionality failed");
            $finish;
        end
        
        rst_n = 1; // Deassert reset
        #10; // Wait for 10ns

        // Final checks
        a = 1; #10; // a stays high
        a = 0; #10; // a goes low
        if (rise !== 1'b0 || down !== 1'b1) begin
            $display("FAIL: Final falling edge detection failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule