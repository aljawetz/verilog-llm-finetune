`timescale 1ns/1ps

module tb_example;

    // Inputs
    reg [7:0] a;
    reg [7:0] b;

    // Outputs
    wire [8:0] sum;

    // Instantiate the Unit Under Test (UUT)
    example uut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        // Test case 1: Simple addition without carry
        a = 8'd10; 
        b = 8'd15; 
        #10;
        if (sum !== 9'd25) begin
            $display("FAIL: Test case 1 failed, expected sum 25 but got %d", sum);
            $finish;
        end

        // Test case 2: Addition with carry
        a = 8'd200; 
        b = 8'd100; 
        #10;
        if (sum !== 9'd300) begin
            $display("FAIL: Test case 2 failed, expected sum 300 but got %d", sum);
            $finish;
        end

        // Test case 3: Maximum values
        a = 8'd255; 
        b = 8'd1; 
        #10;
        if (sum !== 9'd256) begin
            $display("FAIL: Test case 3 failed, expected sum 256 but got %d", sum);
            $finish;
        end

        // Test case 4: Zero addition
        a = 8'd0; 
        b = 8'd0; 
        #10;
        if (sum !== 9'd0) begin
            $display("FAIL: Test case 4 failed, expected sum 0 but got %d", sum);
            $finish;
        end

        // Test case 5: Random values
        a = 8'd123; 
        b = 8'd132; 
        #10;
        if (sum !== 9'd255) begin
            $display("FAIL: Test case 5 failed, expected sum 255 but got %d", sum);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule