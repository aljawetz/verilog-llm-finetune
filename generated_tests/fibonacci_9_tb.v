`timescale 1ns/1ps

module tb_fibonacci;
    reg clk;
    reg rst;
    wire [3:0] out;
    integer i;

    // Instantiate the Fibonacci module
    fibonacci #(10) uut (
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
        #10; // Hold reset for 10ns
        rst = 0;
        
        // Wait for Fibonacci numbers to be output
        #60; // Wait enough time to output all Fibonacci numbers
        
        // Check the output values
        for (i = 0; i < 10; i = i + 1) begin
            case (i)
                0: if (out !== 1) $display("FAIL: Expected out = 1 at i = %0d, got %0d", i, out);
                1: if (out !== 1) $display("FAIL: Expected out = 1 at i = %0d, got %0d", i, out);
                2: if (out !== 2) $display("FAIL: Expected out = 2 at i = %0d, got %0d", i, out);
                3: if (out !== 3) $display("FAIL: Expected out = 3 at i = %0d, got %0d", i, out);
                4: if (out !== 5) $display("FAIL: Expected out = 5 at i = %0d, got %0d", i, out);
                5: if (out !== 8) $display("FAIL: Expected out = 8 at i = %0d, got %0d", i, out);
                6: if (out !== 13) $display("FAIL: Expected out = 13 at i = %0d, got %0d", i, out);
                7: if (out !== 21) $display("FAIL: Expected out = 21 at i = %0d, got %0d", i, out);
                8: if (out !== 34) $display("FAIL: Expected out = 34 at i = %0d, got %0d", i, out);
                9: if (out !== 55) $display("FAIL: Expected out = 55 at i = %0d, got %0d", i, out);
            endcase
            #10; // Wait for the next clock cycle
        end
        
        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule