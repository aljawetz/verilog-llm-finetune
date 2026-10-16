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
        a = 8'd10; b = 8'd20; #10;
        if (sum !== 9'd30) begin
            $display("FAIL: Test case 1 failed, expected sum = 30, got sum = %d", sum);
            $finish;
        end

        // Test case 2: Addition with carry
        a = 8'd200; b = 8'd100; #10;
        if (sum !== 9'd300) begin
            $display("FAIL: Test case 2 failed, expected sum = 300, got sum = %d", sum);
            $finish;
        end

        // Test case 3: Maximum values without overflow
        a = 8'd255; b = 8'd0; #10;
        if (sum !== 9'd255) begin
            $display("FAIL: Test case 3 failed, expected sum = 255, got sum = %d", sum);
            $finish;
        end

        // Test case 4: Maximum values with overflow
        a = 8'd255; b = 8'd1; #10;
        if (sum !== 9'd256) begin
            $display("FAIL: Test case 4 failed, expected sum = 256, got sum = %d", sum);
            $finish;
        end

        // Test case 5: Adding two maximum values
        a = 8'd255; b = 8'd255; #10;
        if (sum !== 9'd510) begin
            $display("FAIL: Test case 5 failed, expected sum = 510, got sum = %d", sum);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule