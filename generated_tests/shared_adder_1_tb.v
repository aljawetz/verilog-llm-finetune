`timescale 1ns/1ps

module tb_shared_adder;

    // Inputs
    reg [7:0] a;
    reg [7:0] b;
    reg mode;

    // Outputs
    wire [7:0] result;

    // Instantiate the Unit Under Test (UUT)
    shared_adder uut (
        .a(a),
        .b(b),
        .mode(mode),
        .result(result)
    );

    initial begin
        // Test case 1: Addition
        a = 8'd15; b = 8'd10; mode = 1'b0; // 15 + 10
        #10;
        if (result !== 8'd25) begin
            $display("FAIL: Expected 25, got %d", result);
            $finish;
        end

        // Test case 2: Subtraction
        a = 8'd20; b = 8'd5; mode = 1'b1; // 20 - 5
        #10;
        if (result !== 8'd15) begin
            $display("FAIL: Expected 15, got %d", result);
            $finish;
        end

        // Test case 3: Addition with carry
        a = 8'd200; b = 8'd100; mode = 1'b0; // 200 + 100
        #10;
        if (result !== 8'd44) begin // 200 + 100 = 300, but only 8 bits
            $display("FAIL: Expected 44, got %d", result);
            $finish;
        end

        // Test case 4: Subtraction resulting in negative
        a = 8'd10; b = 8'd20; mode = 1'b1; // 10 - 20
        #10;
        if (result !== 8'd246) begin // 10 - 20 = -10, which is 246 in 8-bit 2's complement
            $display("FAIL: Expected 246, got %d", result);
            $finish;
        end

        // Test case 5: Zero addition
        a = 8'd0; b = 8'd0; mode = 1'b0; // 0 + 0
        #10;
        if (result !== 8'd0) begin
            $display("FAIL: Expected 0, got %d", result);
            $finish;
        end

        // Test case 6: Zero subtraction
        a = 8'd0; b = 8'd0; mode = 1'b1; // 0 - 0
        #10;
        if (result !== 8'd0) begin
            $display("FAIL: Expected 0, got %d", result);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule