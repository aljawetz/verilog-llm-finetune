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

        // Wait for Fibonacci numbers to be generated
        #10;

        // Check the output values
        for (i = 0; i < 10; i = i + 1) begin
            @(posedge clk);
            case (i)
                0: if (out !== 1) $display("FAIL: Expected 1 at index 0, got %d", out);
                1: if (out !== 1) $display("FAIL: Expected 1 at index 1, got %d", out);
                2: if (out !== 2) $display("FAIL: Expected 2 at index 2, got %d", out);
                3: if (out !== 3) $display("FAIL: Expected 3 at index 3, got %d", out);
                4: if (out !== 5) $display("FAIL: Expected 5 at index 4, got %d", out);
                5: if (out !== 8) $display("FAIL: Expected 8 at index 5, got %d", out);
                6: if (out !== 13) $display("FAIL: Expected 13 at index 6, got %d", out);
                7: if (out !== 21) $display("FAIL: Expected 21 at index 7, got %d", out);
                8: if (out !== 34) $display("FAIL: Expected 34 at index 8, got %d", out);
                9: if (out !== 55) $display("FAIL: Expected 55 at index 9, got %d", out);
            endcase
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end
endmodule