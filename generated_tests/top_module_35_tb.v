`timescale 1ns/1ps

module tb_top_module;

    reg [15:0] scancode;
    wire left;
    wire down;
    wire right;
    wire up;

    // Instantiate the module under test (uut)
    top_module uut (
        .scancode(scancode),
        .left(left),
        .down(down),
        .right(right),
        .up(up)
    );

    initial begin
        // Test case 1: Check left activation
        scancode = 16'he06b; // Left scancode
        #10;
        if (left !== 1'b1 || down !== 1'b0 || right !== 1'b0 || up !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Check down activation
        scancode = 16'he072; // Down scancode
        #10;
        if (left !== 1'b0 || down !== 1'b1 || right !== 1'b0 || up !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Check right activation
        scancode = 16'he074; // Right scancode
        #10;
        if (left !== 1'b0 || down !== 1'b0 || right !== 1'b1 || up !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Check up activation
        scancode = 16'he075; // Up scancode
        #10;
        if (left !== 1'b0 || down !== 1'b0 || right !== 1'b0 || up !== 1'b1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Check no activation for an invalid scancode
        scancode = 16'h0000; // Invalid scancode
        #10;
        if (left !== 1'b0 || down !== 1'b0 || right !== 1'b0 || up !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule