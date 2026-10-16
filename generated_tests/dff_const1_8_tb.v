`timescale 1ns/1ps

module tb_dff_const1;

    reg clk;
    reg reset;
    wire q;

    // Instantiate the module under test (uut)
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
        if (q !== 1'b0) begin
            $display("FAIL: Output q should be 0 when reset is high");
            $finish;
        end

        // Release reset
        reset = 0;
        #10; // Wait for 10ns

        // Check output after first clock edge
        if (q !== 1'b1) begin
            $display("FAIL: Output q should be 1 after first clock edge when reset is low");
            $finish;
        end

        // Check output after second clock edge
        #10; // Wait for next clock edge
        if (q !== 1'b1) begin
            $display("FAIL: Output q should remain 1 after second clock edge");
            $finish;
        end

        // Check output after third clock edge
        #10; // Wait for next clock edge
        if (q !== 1'b1) begin
            $display("FAIL: Output q should remain 1 after third clock edge");
            $finish;
        end

        // Assert reset again
        reset = 1;
        #10; // Wait for 10ns
        if (q !== 1'b0) begin
            $display("FAIL: Output q should be 0 when reset is high again");
            $finish;
        end

        // Release reset again
        reset = 0;
        #10; // Wait for 10ns
        if (q !== 1'b1) begin
            $display("FAIL: Output q should be 1 after releasing reset again");
            $finish;
        end

        // Final check after several clock cycles
        #20; // Wait for two more clock edges
        if (q !== 1'b1) begin
            $display("FAIL: Output q should remain 1 after multiple clock edges");
            $finish;
        end

        // If all checks pass
        $display("PASS");
        $finish;
    end

endmodule