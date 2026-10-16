`timescale 1ns/1ps

module tb_fibonacci;
    reg clk;
    reg rst;
    wire [3:0] out;
    integer i;

    // Instantiate the module under test (uut)
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
                0: if (out !== 1) $display("FAIL: Expected out[0] = 1, got %d", out);
                1: if (out !== 1) $display("FAIL: Expected out[1] = 1, got %d", out);
                2: if (out !== 2) $display("FAIL: Expected out[2] = 2, got %d", out);
                3: if (out !== 3) $display("FAIL: Expected out[3] = 3, got %d", out);
                4: if (out !== 5) $display("FAIL: Expected out[4] = 5, got %d", out);
                5: if (out !== 8) $display("FAIL: Expected out[5] = 8, got %d", out);
                6: if (out !== 13) $display("FAIL: Expected out[6] = 13, got %d", out);
                7: if (out !== 21) $display("FAIL: Expected out[7] = 21, got %d", out);
                8: if (out !== 34) $display("FAIL: Expected out[8] = 34, got %d", out);
                9: if (out !== 55) $display("FAIL: Expected out[9] = 55, got %d", out);
            endcase
        end
        
        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule