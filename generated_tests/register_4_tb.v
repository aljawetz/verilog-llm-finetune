`timescale 1ns/1ps

module tb_register;
    reg clk;
    reg in0;
    wire out;

    // Instantiate the module under test
    register uut (
        .clk(clk),
        .in0(in0),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        in0 = 0;

        // Wait for a clock edge
        #10;
        if (out !== 0) begin
            $display("FAIL: Initial output is not 0");
            $finish;
        end

        // Test case 1: Set in0 to 1
        in0 = 1;
        #10; // Wait for falling edge
        if (out !== 1) begin
            $display("FAIL: Output is not updated to 1 after in0 is set to 1");
            $finish;
        end

        // Test case 2: Set in0 to 0
        in0 = 0;
        #10; // Wait for falling edge
        if (out !== 0) begin
            $display("FAIL: Output is not updated to 0 after in0 is set to 0");
            $finish;
        end

        // Test case 3: Change in0 to 1 again
        in0 = 1;
        #10; // Wait for falling edge
        if (out !== 1) begin
            $display("FAIL: Output is not updated to 1 after in0 is set to 1 again");
            $finish;
        end

        // Test case 4: Keep in0 at 1
        in0 = 1;
        #10; // Wait for falling edge
        if (out !== 1) begin
            $display("FAIL: Output should remain 1 when in0 is held at 1");
            $finish;
        end

        // Test case 5: Set in0 to 0 again
        in0 = 0;
        #10; // Wait for falling edge
        if (out !== 0) begin
            $display("FAIL: Output is not updated to 0 after in0 is set to 0 again");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule