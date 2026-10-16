`timescale 1ns/1ps

module tb_sync_counter;

    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the module under test (uut)
    sync_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
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
        reset = 0; // Release reset

        // Check initial value
        if (count !== 4'd3) begin
            $display("FAIL: Initial count is not 3");
            $finish;
        end

        // Increment and check values
        #10; // 1st clock cycle
        if (count !== 4'd4) begin
            $display("FAIL: Count after 1 increment is not 4");
            $finish;
        end
        
        #10; // 2nd clock cycle
        if (count !== 4'd5) begin
            $display("FAIL: Count after 2 increments is not 5");
            $finish;
        end
        
        #10; // 3rd clock cycle
        if (count !== 4'd6) begin
            $display("FAIL: Count after 3 increments is not 6");
            $finish;
        end
        
        #10; // 4th clock cycle
        if (count !== 4'd7) begin
            $display("FAIL: Count after 4 increments is not 7");
            $finish;
        end
        
        #10; // 5th clock cycle
        if (count !== 4'd8) begin
            $display("FAIL: Count after 5 increments is not 8");
            $finish;
        end
        
        #10; // 6th clock cycle
        if (count !== 4'd9) begin
            $display("FAIL: Count after 6 increments is not 9");
            $finish;
        end
        
        #10; // 7th clock cycle
        if (count !== 4'd10) begin
            $display("FAIL: Count after 7 increments is not 10");
            $finish;
        end
        
        #10; // 8th clock cycle
        if (count !== 4'd11) begin
            $display("FAIL: Count after 8 increments is not 11");
            $finish;
        end
        
        #10; // 9th clock cycle
        if (count !== 4'd12) begin
            $display("FAIL: Count after 9 increments is not 12");
            $finish;
        end
        
        #10; // 10th clock cycle
        if (count !== 4'd3) begin
            $display("FAIL: Count after reaching 12 is not reset to 3");
            $finish;
        end

        // Test reset functionality
        reset = 1; // Assert reset
        #10; // Wait for reset to take effect
        reset = 0; // Release reset

        // Check if count is reset to 3
        if (count !== 4'd3) begin
            $display("FAIL: Count after reset is not 3");
            $finish;
        end

        // Final check for normal operation
        #10; // 1st clock cycle after reset
        if (count !== 4'd4) begin
            $display("FAIL: Count after reset increment is not 4");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule