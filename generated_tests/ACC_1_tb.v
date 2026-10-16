`timescale 1ns/1ps

module tb_ACC;

    // Testbench signals
    reg [7:0] acc_in;
    reg la_;
    reg clk;
    reg clr_;
    wire [7:0] acc_out1;
    wire [7:0] acc_out2;

    // Instantiate the module under test (uut)
    ACC uut (
        .acc_out1(acc_out1),
        .acc_out2(acc_out2),
        .acc_in(acc_in),
        .la_(la_),
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
        // Initialize inputs
        acc_in = 8'b0;
        la_ = 1;
        clr_ = 1;

        // Test 1: Reset functionality
        clr_ = 0; // Assert reset
        #10;
        if (acc_out1 !== 8'b0 || acc_out2 !== 8'b0) begin
            $display("FAIL: Reset did not clear outputs");
            $finish;
        end
        clr_ = 1; // Deassert reset

        // Test 2: Load value into accumulator
        acc_in = 8'b10101010; // Input value
        la_ = 0; // Load active
        #10;
        if (acc_out1 !== 8'b10101010 || acc_out2 !== 8'b10101010) begin
            $display("FAIL: Load did not store input value");
            $finish;
        end
        la_ = 1; // Load inactive

        // Test 3: Ensure value is held
        #10;
        if (acc_out1 !== 8'b10101010 || acc_out2 !== 8'b10101010) begin
            $display("FAIL: Output changed when load is inactive");
            $finish;
        end

        // Test 4: Reset again
        clr_ = 0; // Assert reset
        #10;
        if (acc_out1 !== 8'b0 || acc_out2 !== 8'b0) begin
            $display("FAIL: Reset did not clear outputs");
            $finish;
        end
        clr_ = 1; // Deassert reset

        // Test 5: Load another value
        acc_in = 8'b11110000; // New input value
        la_ = 0; // Load active
        #10;
        if (acc_out1 !== 8'b11110000 || acc_out2 !== 8'b11110000) begin
            $display("FAIL: Load did not store new input value");
            $finish;
        end
        la_ = 1; // Load inactive

        // Test 6: Ensure value is held again
        #10;
        if (acc_out1 !== 8'b11110000 || acc_out2 !== 8'b11110000) begin
            $display("FAIL: Output changed when load is inactive");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule