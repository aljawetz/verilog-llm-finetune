`timescale 1ns/1ps

module tb_control;

    reg i_clk;
    reg i_rst_n;
    reg i_valid;
    wire o_valid;

    // Instantiate the module under test (uut)
    control uut (
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .i_valid(i_valid),
        .o_valid(o_valid)
    );

    // Clock generation
    initial begin
        i_clk = 0;
        forever #5 i_clk = ~i_clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        i_rst_n = 0;
        i_valid = 0;

        // Apply reset
        #10;
        i_rst_n = 1; // Release reset

        // Test case 1: Valid inputs within bounds
        #10;
        i_valid = 1; // Start valid input
        repeat (100) @(posedge i_clk); // Allow some clock cycles

        // Check output for the first 28x28 area
        if (uut.row > 27 || uut.column > 27) begin
            $display("FAIL: Output o_valid should be 1 for row=%d, column=%d", uut.row, uut.column);
            $finish;
        end

        // Test case 2: Valid inputs exceeding bounds
        repeat (100) @(posedge i_clk); // Continue for more cycles

        // Check output after exceeding bounds
        if (uut.row == 28 && uut.column == 28) begin
            if (o_valid != 0) begin
                $display("FAIL: Output o_valid should be 0 for row=%d, column=%d", uut.row, uut.column);
                $finish;
            end
        end

        // Test case 3: Reset functionality
        #10;
        i_rst_n = 0; // Assert reset
        #10;
        i_rst_n = 1; // Release reset

        // Check if row and column are reset
        if (uut.row != 0 || uut.column != 0) begin
            $display("FAIL: After reset, row and column should be 0 but got row=%d, column=%d", uut.row, uut.column);
            $finish;
        end

        // Final check for valid output after reset
        #10;
        i_valid = 1; // Start valid input again
        repeat (100) @(posedge i_clk); // Allow some clock cycles

        // Final output check
        if (uut.row > 27 || uut.column > 27) begin
            $display("FAIL: Output o_valid should be 1 for row=%d, column=%d", uut.row, uut.column);
            $finish;
        end

        // If all checks passed
        $display("PASS");
        $finish;
    end

endmodule