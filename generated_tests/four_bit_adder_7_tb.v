`timescale 1ns/1ps

module tb_four_bit_adder;

    reg clk;
    reg rstn;
    reg [3:0] a;
    reg [3:0] b;
    wire [4:0] c;

    // Instantiate the module under test (uut)
    four_bit_adder uut (
        .clk(clk),
        .rstn(rstn),
        .a(a),
        .b(b),
        .c(c)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rstn = 0; // Assert reset
        a = 4'b0000;
        b = 4'b0000;
        #10; // Wait for a clock cycle
        
        // Release reset
        rstn = 1;
        #10; // Wait for a clock cycle

        // Test case 1: 0 + 0 = 0
        a = 4'b0000; 
        b = 4'b0000;
        #10; // Wait for a clock cycle
        if (c !== 5'b00000) begin
            $display("FAIL: Expected 0, got %b", c);
            $finish;
        end

        // Test case 2: 1 + 1 = 2
        a = 4'b0001; 
        b = 4'b0001;
        #10; // Wait for a clock cycle
        if (c !== 5'b00010) begin
            $display("FAIL: Expected 2, got %b", c);
            $finish;
        end

        // Test case 3: 3 + 2 = 5
        a = 4'b0011; 
        b = 4'b0010;
        #10; // Wait for a clock cycle
        if (c !== 5'b00101) begin
            $display("FAIL: Expected 5, got %b", c);
            $finish;
        end

        // Test case 4: 7 + 8 = 15
        a = 4'b0111; 
        b = 4'b1000;
        #10; // Wait for a clock cycle
        if (c !== 5'b01111) begin
            $display("FAIL: Expected 15, got %b", c);
            $finish;
        end

        // Test case 5: Reset functionality
        rstn = 0; // Assert reset
        #10; // Wait for a clock cycle
        if (c !== 5'b00000) begin
            $display("FAIL: Expected 0 after reset, got %b", c);
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule