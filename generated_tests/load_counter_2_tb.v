`timescale 1ns/1ps

module tb_load_counter;

    reg clk;
    reg arst;
    reg load;
    wire [3:0] count;

    // Instantiate the load_counter module
    load_counter uut (
        .clk(clk),
        .arst(arst),
        .load(load),
        .count(count)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        arst = 1; // Assert reset
        load = 0;
        #10; // Wait for 10ns
        arst = 0; // Deassert reset

        // Test counting
        #10; // Wait for 10ns
        if (count !== 4'b0001) begin
            $display("FAIL: Count should be 1 after 1 clock cycle");
            $finish;
        end

        #10; // Wait for 10ns
        if (count !== 4'b0010) begin
            $display("FAIL: Count should be 2 after 2 clock cycles");
            $finish;
        end

        // Test load functionality
        load = 1; // Activate load
        #10; // Wait for 10ns
        if (count !== 4'b0010) begin
            $display("FAIL: Count should remain 2 when load is active");
            $finish;
        end

        load = 0; // Deactivate load
        #10; // Wait for 10ns
        if (count !== 4'b0011) begin
            $display("FAIL: Count should be 3 after 3 clock cycles");
            $finish;
        end

        // Test asynchronous reset
        arst = 1; // Assert reset
        #10; // Wait for 10ns
        if (count !== 4'b0000) begin
            $display("FAIL: Count should be 0 after reset");
            $finish;
        end

        arst = 0; // Deassert reset
        #10; // Wait for 10ns
        if (count !== 4'b0001) begin
            $display("FAIL: Count should be 1 after reset and 1 clock cycle");
            $finish;
        end

        // Final check
        #10; // Wait for 10ns
        if (count !== 4'b0010) begin
            $display("FAIL: Count should be 2 after 2 clock cycles");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule