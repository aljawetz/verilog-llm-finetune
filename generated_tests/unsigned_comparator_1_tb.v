`timescale 1ns/1ps

module tb_unsigned_comparator;

    reg [7:0] a;
    reg [7:0] b;
    wire lt;
    wire eq;
    wire gt;

    // Instantiate the module under test (uut)
    unsigned_comparator #(8) uut (
        .a(a),
        .b(b),
        .lt(lt),
        .eq(eq),
        .gt(gt)
    );

    initial begin
        // Test case 1: a < b
        a = 8'd5; b = 8'd10;
        #10;
        if (lt !== 1'b1 || eq !== 1'b0 || gt !== 1'b0) begin
            $display("FAIL: Test case 1 failed (a < b)");
            $finish;
        end

        // Test case 2: a > b
        a = 8'd15; b = 8'd10;
        #10;
        if (lt !== 1'b0 || eq !== 1'b0 || gt !== 1'b1) begin
            $display("FAIL: Test case 2 failed (a > b)");
            $finish;
        end

        // Test case 3: a == b
        a = 8'd10; b = 8'd10;
        #10;
        if (lt !== 1'b0 || eq !== 1'b1 || gt !== 1'b0) begin
            $display("FAIL: Test case 3 failed (a == b)");
            $finish;
        end

        // Test case 4: a < b (boundary case)
        a = 8'd0; b = 8'd1;
        #10;
        if (lt !== 1'b1 || eq !== 1'b0 || gt !== 1'b0) begin
            $display("FAIL: Test case 4 failed (a < b boundary case)");
            $finish;
        end

        // Test case 5: a > b (boundary case)
        a = 8'd255; b = 8'd0;
        #10;
        if (lt !== 1'b0 || eq !== 1'b0 || gt !== 1'b1) begin
            $display("FAIL: Test case 5 failed (a > b boundary case)");
            $finish;
        end

        // Test case 6: a == b (boundary case)
        a = 8'd128; b = 8'd128;
        #10;
        if (lt !== 1'b0 || eq !== 1'b1 || gt !== 1'b0) begin
            $display("FAIL: Test case 6 failed (a == b boundary case)");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule