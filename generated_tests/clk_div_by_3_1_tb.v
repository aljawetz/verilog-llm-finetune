`timescale 1ns/1ps

module tb_clk_div_by_3;

    reg clk;
    wire clk_out;

    // Instantiate the module under test
    clk_div_by_3 uut (
        .clk(clk),
        .clk_out(clk_out)
    );

    // Generate clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Wait for a few clock cycles
        #10;

        // Check the output for a few cycles
        if (clk_out !== 0) begin
            $display("FAIL: clk_out should be 0 at time %0t", $time);
            $finish;
        end

        #10; // Wait for the next clock cycle

        if (clk_out !== 1) begin
            $display("FAIL: clk_out should be 1 at time %0t", $time);
            $finish;
        end

        #10; // Wait for the next clock cycle

        if (clk_out !== 0) begin
            $display("FAIL: clk_out should be 0 at time %0t", $time);
            $finish;
        end

        #10; // Wait for the next clock cycle

        if (clk_out !== 0) begin
            $display("FAIL: clk_out should be 0 at time %0t", $time);
            $finish;
        end

        #10; // Wait for the next clock cycle

        if (clk_out !== 1) begin
            $display("FAIL: clk_out should be 1 at time %0t", $time);
            $finish;
        end

        #10; // Wait for the next clock cycle

        if (clk_out !== 0) begin
            $display("FAIL: clk_out should be 0 at time %0t", $time);
            $finish;
        end

        // Finish the simulation
        $display("PASS");
        $finish;
    end

endmodule