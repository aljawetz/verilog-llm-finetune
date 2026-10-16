`timescale 1ns/1ps

module tb_MAR;

    reg [3:0] mar_in;
    reg lm_;
    reg clk;
    reg clr_;
    wire [3:0] mar_out;

    // Instantiate the module under test (uut)
    MAR uut (
        .mar_out(mar_out),
        .mar_in(mar_in),
        .lm_(lm_),
        .clk(clk),
        .clr_(clr_)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        mar_in = 4'b0000;
        lm_ = 1;
        clr_ = 1;

        // Test 1: Check reset functionality
        clr_ = 0; // Activate clear
        #10; // Wait for one clock cycle
        if (mar_out !== 4'b0000) begin
            $display("FAIL: Reset did not clear output");
            $finish;
        end

        // Test 2: Load functionality
        clr_ = 1; // Deactivate clear
        mar_in = 4'b1010; // Input to load
        lm_ = 0; // Activate load
        #10; // Wait for one clock cycle
        if (mar_out !== 4'b1010) begin
            $display("FAIL: Load did not set output correctly");
            $finish;
        end

        // Test 3: Ensure output remains unchanged when load is inactive
        lm_ = 1; // Deactivate load
        #10; // Wait for one clock cycle
        if (mar_out !== 4'b1010) begin
            $display("FAIL: Output changed when load was inactive");
            $finish;
        end

        // Test 4: Check reset functionality again
        clr_ = 0; // Activate clear
        #10; // Wait for one clock cycle
        if (mar_out !== 4'b0000) begin
            $display("FAIL: Reset did not clear output on second check");
            $finish;
        end

        // Test 5: Load another value
        clr_ = 1; // Deactivate clear
        mar_in = 4'b1111; // New input to load
        lm_ = 0; // Activate load
        #10; // Wait for one clock cycle
        if (mar_out !== 4'b1111) begin
            $display("FAIL: Load did not set output correctly for new value");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule