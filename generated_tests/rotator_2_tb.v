`timescale 1ns/1ps

module tb_rotator;

    parameter size = 22;
    reg [$clog2(size)-1:0] x;
    reg [$clog2(size)-1:0] y;
    reg [1:0] direction;
    wire [$clog2(size * size) - 1:0] index;

    // Instantiate the module under test
    rotator uut (
        .x(x),
        .y(y),
        .direction(direction),
        .index(index)
    );

    initial begin
        // Test case 1: direction = 0
        x = 5; y = 10; direction = 0;
        #10;
        if (index !== (size - y - 1) * size + (size - x - 1)) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: direction = 1
        x = 5; y = 10; direction = 1;
        #10;
        if (index !== x * size + (size - y - 1)) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: direction = 2
        x = 5; y = 10; direction = 2;
        #10;
        if (index !== y * size + x) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: direction = 3
        x = 5; y = 10; direction = 3;
        #10;
        if (index !== (size - x - 1) * size + y) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Additional edge case tests
        x = 0; y = 0; direction = 0;
        #10;
        if (index !== (size - 0 - 1) * size + (size - 0 - 1)) begin
            $display("FAIL: Edge case 1 failed");
            $finish;
        end

        x = size - 1; y = size - 1; direction = 3;
        #10;
        if (index !== (size - (size - 1) - 1) * size + (size - 1)) begin
            $display("FAIL: Edge case 2 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule