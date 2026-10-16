`timescale 1ns/1ps

module tb_priority_encoder;

    reg [3:0] in;
    wire [1:0] out;
    wire valid;

    // Instantiate the priority encoder
    priority_encoder uut (
        .in(in),
        .out(out),
        .valid(valid)
    );

    initial begin
        // Test case 1: All inputs are 0
        in = 4'b0000; #10;
        if (out !== 2'b00 || valid !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Only LSB is active
        in = 4'b0001; #10;
        if (out !== 2'b00 || valid !== 1'b1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Second LSB is active
        in = 4'b0010; #10;
        if (out !== 2'b01 || valid !== 1'b1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Third LSB is active
        in = 4'b0100; #10;
        if (out !== 2'b10 || valid !== 1'b1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: MSB is active
        in = 4'b1000; #10;
        if (out !== 2'b11 || valid !== 1'b1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Multiple inputs active (MSB should take priority)
        in = 4'b1100; #10;
        if (out !== 2'b11 || valid !== 1'b1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: Multiple inputs active (second MSB should take priority)
        in = 4'b0110; #10;
        if (out !== 2'b10 || valid !== 1'b1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: Multiple inputs active (LSB should take priority)
        in = 4'b0011; #10;
        if (out !== 2'b01 || valid !== 1'b1) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule