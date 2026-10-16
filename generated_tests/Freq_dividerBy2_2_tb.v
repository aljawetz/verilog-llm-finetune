`timescale 1ns/1ps

module tb_Freq_dividerBy2;

    reg clk;
    wire op;

    // Instantiate the module under test (uut)
    Freq_dividerBy2 uut (
        .clk(clk),
        .op(op)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period for clk
    end

    // Test sequence
    initial begin
        // Wait for a few clock cycles to observe the output
        #10; // Wait for 1 clock period
        if (op !== 1'b1) begin
            $display("FAIL: Initial output is not as expected");
            $finish;
        end
        
        #10; // Wait for 1 more clock period
        if (op !== 1'b0) begin
            $display("FAIL: Output did not toggle as expected");
            $finish;
        end
        
        #10; // Wait for 1 more clock period
        if (op !== 1'b1) begin
            $display("FAIL: Output did not toggle as expected");
            $finish;
        end
        
        #10; // Wait for 1 more clock period
        if (op !== 1'b0) begin
            $display("FAIL: Output did not toggle as expected");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule