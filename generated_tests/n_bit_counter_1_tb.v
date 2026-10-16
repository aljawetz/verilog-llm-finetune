`timescale 1ns/1ps

module tb_n_bit_counter;

    reg clk;
    reg clr;
    wire [7:0] count;

    // Instantiate the module under test (uut)
    n_bit_counter uut (
        .count(count),
        .clk(clk),
        .clr(clr)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        clr = 1; // Assert clear
        #10;     // Wait for 10ns
        clr = 0; // Deassert clear

        // Check initial count after clear
        if (count !== 8'b0) begin
            $display("FAIL: Initial count is not zero after clear");
            $finish;
        end

        // Wait for a few clock cycles and check count
        #10; // Wait for 1 clock cycle
        if (count !== 8'b00000001) begin
            $display("FAIL: Count is not 1 after 1 clock cycle");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 8'b00000010) begin
            $display("FAIL: Count is not 2 after 2 clock cycles");
            $finish;
        end

        #10; // Wait for 1 clock cycle
        if (count !== 8'b00000011) begin
            $display("FAIL: Count is not 3 after 3 clock cycles");
            $finish;
        end

        // Assert clear again
        clr = 1; // Assert clear
        #10;     // Wait for 10ns
        clr = 0; // Deassert clear

        // Check count after clear
        if (count !== 8'b0) begin
            $display("FAIL: Count is not zero after clear again");
            $finish;
        end

        // Continue counting
        #10; // Wait for 1 clock cycle
        if (count !== 8'b00000001) begin
            $display("FAIL: Count is not 1 after clear and 1 clock cycle");
            $finish;
        end

        // Finish the simulation
        $display("PASS");
        $finish;
    end

endmodule