`timescale 1ns/1ps

module tb_dff_const1;

    reg clk;
    reg reset;
    wire q;

    // Instantiate the module under test
    dff_const1 uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10; // Wait for 10ns
        
        // Release reset
        reset = 0;
        #10; // Wait for 10ns
        
        // Check output after reset is released
        if (q !== 1'b1) begin
            $display("FAIL: Output q should be 1 after reset is released");
            $finish;
        end
        
        // Apply clock cycles and check output
        #10; // Wait for 10ns
        if (q !== 1'b1) begin
            $display("FAIL: Output q should be 1 after clock edge");
            $finish;
        end
        
        #10; // Wait for next clock edge
        if (q !== 1'b1) begin
            $display("FAIL: Output q should be 1 after clock edge");
            $finish;
        end
        
        // Assert reset again
        reset = 1;
        #10; // Wait for 10ns
        
        // Check output during reset
        if (q !== 1'b0) begin
            $display("FAIL: Output q should be 0 during reset");
            $finish;
        end
        
        // Release reset again
        reset = 0;
        #10; // Wait for 10ns
        
        // Check output after reset is released
        if (q !== 1'b1) begin
            $display("FAIL: Output q should be 1 after reset is released");
            $finish;
        end
        
        // Final clock cycles
        #10; // Wait for next clock edge
        if (q !== 1'b1) begin
            $display("FAIL: Output q should be 1 after clock edge");
            $finish;
        end
        
        #10; // Wait for next clock edge
        if (q !== 1'b1) begin
            $display("FAIL: Output q should be 1 after clock edge");
            $finish;
        end
        
        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule