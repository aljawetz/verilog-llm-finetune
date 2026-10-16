`timescale 1ns/1ps

module tb_pr_circuit;
    reg [7:0] i;
    wire [7:0] h;
    wire idle;

    // Instantiate the module under test
    pr_circuit uut (
        .i(i),
        .h(h),
        .idle(idle)
    );

    initial begin
        // Test case 1: All inputs are zero
        i = 8'b00000000;
        #10;
        if (h !== 8'b00000000 || idle !== 1'b1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Only the least significant bit is active
        i = 8'b00000001;
        #10;
        if (h !== 8'b00000001 || idle !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Only the most significant bit is active
        i = 8'b10000000;
        #10;
        if (h !== 8'b10000000 || idle !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Middle bit is active
        i = 8'b00100000;
        #10;
        if (h !== 8'b00100000 || idle !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Multiple bits active, highest order should be selected
        i = 8'b01100000;
        #10;
        if (h !== 8'b01000000 || idle !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: All bits active
        i = 8'b11111111;
        #10;
        if (h !== 8'b10000000 || idle !== 1'b0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: Random bits active
        i = 8'b10101010;
        #10;
        if (h !== 8'b10000000 || idle !== 1'b0) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule