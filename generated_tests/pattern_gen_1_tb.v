`timescale 1ns/1ps

module tb_pattern_gen;

    reg clk;
    reg rst;
    wire [7:0] out;

    // Instantiate the module under test
    pattern_gen uut (
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        rst = 1;
        #10; // Wait for 10ns
        rst = 0;
        
        // Wait for a few clock cycles to observe output
        #10;
        if (out !== 8'b00010000) begin
            $display("FAIL: Initial output after reset is incorrect, got %b", out);
            $finish;
        end
        
        // Wait for more clock cycles and check output
        #10;
        if (out !== 8'b00100000) begin
            $display("FAIL: Output after 2 clock cycles is incorrect, got %b", out);
            $finish;
        end
        
        // Continue to check the output for a few more cycles
        #10;
        if (out !== 8'b01000000) begin
            $display("FAIL: Output after 3 clock cycles is incorrect, got %b", out);
            $finish;
        end
        
        #10;
        if (out !== 8'b10000000) begin
            $display("FAIL: Output after 4 clock cycles is incorrect, got %b", out);
            $finish;
        end
        
        #10;
        if (out !== 8'b00010000) begin
            $display("FAIL: Output after 5 clock cycles is incorrect, got %b", out);
            $finish;
        end
        
        // Test reset functionality
        rst = 1;
        #10;
        rst = 0;
        
        // Check output after reset
        #10;
        if (out !== 8'b00010000) begin
            $display("FAIL: Output after reset is incorrect, got %b", out);
            $finish;
        end
        
        // Final check to ensure the pattern continues correctly
        #10;
        if (out !== 8'b00100000) begin
            $display("FAIL: Output after 2 clock cycles post-reset is incorrect, got %b", out);
            $finish;
        end
        
        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule