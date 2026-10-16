`timescale 1ns/1ps

module tb_rsreg;

    reg clk;
    reg rset;
    reg x;
    wire [3:0] out;

    // Instantiate the module under test
    rsreg uut (
        .clk(clk),
        .rset(rset),
        .x(x),
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
        rset = 0;
        x = 0;

        // Test 1: Reset the register
        rset = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (out !== 4'b0000) begin
            $display("FAIL: Reset did not set output to 0000");
            $finish;
        end

        // Test 2: Shift with x = 1
        rset = 0; // Deassert reset
        x = 1; // New MSB
        #10; // Wait for one clock cycle
        if (out !== 4'b1000) begin
            $display("FAIL: Output after shifting with x=1 is incorrect");
            $finish;
        end

        // Test 3: Shift with x = 0
        x = 0; // New MSB
        #10; // Wait for one clock cycle
        if (out !== 4'b0100) begin
            $display("FAIL: Output after shifting with x=0 is incorrect");
            $finish;
        end

        // Test 4: Reset again
        rset = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (out !== 4'b0000) begin
            $display("FAIL: Reset did not set output to 0000");
            $finish;
        end

        // Test 5: Shift with x = 1 after reset
        rset = 0; // Deassert reset
        x = 1; // New MSB
        #10; // Wait for one clock cycle
        if (out !== 4'b1000) begin
            $display("FAIL: Output after shifting with x=1 is incorrect");
            $finish;
        end

        // Test 6: Shift with x = 1 again
        #10; // Wait for one clock cycle
        if (out !== 4'b1100) begin
            $display("FAIL: Output after shifting with x=1 is incorrect");
            $finish;
        end

        // Test 7: Shift with x = 0
        x = 0; // New MSB
        #10; // Wait for one clock cycle
        if (out !== 4'b0110) begin
            $display("FAIL: Output after shifting with x=0 is incorrect");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule