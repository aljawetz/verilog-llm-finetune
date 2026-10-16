`timescale 1ns/1ps

module tb_BRegister;

    reg [7:0] BRegister_in;
    reg lb_;
    reg clk;
    reg clr_;
    wire [7:0] BRegister_out;

    // Instantiate the module under test (uut)
    BRegister uut (
        .BRegister_out(BRegister_out),
        .BRegister_in(BRegister_in),
        .lb_(lb_),
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
        BRegister_in = 8'b00000000;
        lb_ = 1;
        clr_ = 1;

        // Test 1: Check reset functionality
        clr_ = 0; // Activate reset
        #10; // Wait for one clock cycle
        if (BRegister_out !== 8'b00000000) begin
            $display("FAIL: Reset did not clear register");
            $finish;
        end

        // Test 2: Load value into register
        clr_ = 1; // Deactivate reset
        BRegister_in = 8'b10101010; // Input value
        lb_ = 0; // Load value
        #10; // Wait for one clock cycle
        if (BRegister_out !== 8'b10101010) begin
            $display("FAIL: Load did not store input value");
            $finish;
        end

        // Test 3: Ensure register holds value when lb_ is high
        lb_ = 1; // Disable loading
        #10; // Wait for one clock cycle
        if (BRegister_out !== 8'b10101010) begin
            $display("FAIL: Register value changed when it should not have");
            $finish;
        end

        // Test 4: Reset again
        clr_ = 0; // Activate reset
        #10; // Wait for one clock cycle
        if (BRegister_out !== 8'b00000000) begin
            $display("FAIL: Reset did not clear register again");
            $finish;
        end

        // Test 5: Load new value after reset
        clr_ = 1; // Deactivate reset
        BRegister_in = 8'b11110000; // New input value
        lb_ = 0; // Load new value
        #10; // Wait for one clock cycle
        if (BRegister_out !== 8'b11110000) begin
            $display("FAIL: Load did not store new input value");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule