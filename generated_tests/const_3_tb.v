`timescale 1ns/1ps

module tb_const;

    reg clk;
    reg [5:0] addr;
    wire [197:0] out;
    wire effective;

    // Instantiate the module under test (uut)
    const uut (
        .clk(clk),
        .addr(addr),
        .out(out),
        .effective(effective)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        addr = 6'd0;
        #10; // wait for a clock cycle

        // Test case 1: Check output for addr = 1
        addr = 6'd1;
        #10; // wait for a clock cycle
        if (out !== 198'd0 || effective !== 1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Check output for addr = 2
        addr = 6'd2;
        #10; // wait for a clock cycle
        if (out !== 198'd1 || effective !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Check output for addr = 4
        addr = 6'd4;
        #10; // wait for a clock cycle
        if (out !== {6'b000101, 192'd0} || effective !== 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Check output for addr = 8
        addr = 6'd8;
        #10; // wait for a clock cycle
        if (out !== {6'b001001, 192'd0} || effective !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Check output for addr = 16
        addr = 6'd16;
        #10; // wait for a clock cycle
        if (out !== {6'b010101, 192'd0} || effective !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Check output for an invalid address
        addr = 6'd3; // Invalid address
        #10; // wait for a clock cycle
        if (out !== 198'd0 || effective !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: Check output for another invalid address
        addr = 6'd63; // Invalid address
        #10; // wait for a clock cycle
        if (out !== 198'd0 || effective !== 0) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule