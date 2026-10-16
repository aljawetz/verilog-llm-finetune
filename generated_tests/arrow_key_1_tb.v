`timescale 1ns/1ps

module tb_arrow_key;

    reg [15:0] scancode;
    wire left, down, right, up;

    // Instantiate the module under test (uut)
    arrow_key uut (
        .scancode(scancode),
        .left(left),
        .down(down),
        .right(right),
        .up(up)
    );

    initial begin
        // Test case 1: Check left arrow key
        scancode = 16'he06b; // Left arrow
        #10;
        if (left !== 1'b1 || down !== 1'b0 || right !== 1'b0 || up !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Check down arrow key
        scancode = 16'he072; // Down arrow
        #10;
        if (left !== 1'b0 || down !== 1'b1 || right !== 1'b0 || up !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Check right arrow key
        scancode = 16'he074; // Right arrow
        #10;
        if (left !== 1'b0 || down !== 1'b0 || right !== 1'b1 || up !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Check up arrow key
        scancode = 16'he075; // Up arrow
        #10;
        if (left !== 1'b0 || down !== 1'b0 || right !== 1'b0 || up !== 1'b1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Check no key pressed
        scancode = 16'h0000; // No key
        #10;
        if (left !== 1'b0 || down !== 1'b0 || right !== 1'b0 || up !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule