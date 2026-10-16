`timescale 1ns/1ps

module tb_example_raw;

    reg [15:0] x;
    wire [15:0] y;
    wire [15:0] z;

    // Instantiate the module under test (uut)
    example_raw uut (
        .x(x),
        .y(y),
        .z(z)
    );

    initial begin
        // Test sequence
        // Test case 1: All zeros
        x = 16'b0000000000000000;
        #10;
        if (y !== 16'b0000000000000000 || z !== 16'b0000000000000000) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: All ones
        x = 16'b1111111111111111;
        #10;
        if (y !== 16'b1111111111111111 || z !== 16'b1111111111111111) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Alternating bits
        x = 16'b1010101010101010;
        #10;
        if (y !== 16'b1010101010101010 || z !== 16'b1010101010101010) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Incrementing values
        x = 16'b0000000000000001;
        #10;
        if (y !== 16'b0000000000000001 || z !== 16'b0000000000000001) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end
        
        x = 16'b0000000000000010;
        #10;
        if (y !== 16'b0000000000000010 || z !== 16'b0000000000000010) begin
            $display("FAIL: Test case 4.1 failed");
            $finish;
        end

        // Test case 5: Random value
        x = 16'b1100110011001100;
        #10;
        if (y !== 16'b1100110011001100 || z !== 16'b1100110011001100) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule