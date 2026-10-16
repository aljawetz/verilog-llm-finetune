`timescale 1ns/1ps

module testbench;
    reg [1:0] a;
    reg [1:0] b;
    wire equal;
    wire gt;
    wire lt;

    // Instantiate the module under test (uut)
    Coparator_2bit uut (
        .a(a),
        .b(b),
        .equal(equal),
        .gt(gt),
        .lt(lt)
    );

    initial begin
        // Test case 1: a = 00, b = 00
        a = 2'b00; b = 2'b00;
        #10;
        if (equal !== 1'b1 || gt !== 1'b0 || lt !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: a = 01, b = 01
        a = 2'b01; b = 2'b01;
        #10;
        if (equal !== 1'b1 || gt !== 1'b0 || lt !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: a = 10, b = 10
        a = 2'b10; b = 2'b10;
        #10;
        if (equal !== 1'b1 || gt !== 1'b0 || lt !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: a = 01, b = 00
        a = 2'b01; b = 2'b00;
        #10;
        if (equal !== 1'b0 || gt !== 1'b1 || lt !== 1'b0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: a = 10, b = 01
        a = 2'b10; b = 2'b01;
        #10;
        if (equal !== 1'b0 || gt !== 1'b1 || lt !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: a = 00, b = 01
        a = 2'b00; b = 2'b01;
        #10;
        if (equal !== 1'b0 || gt !== 1'b0 || lt !== 1'b1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: a = 01, b = 10
        a = 2'b01; b = 2'b10;
        #10;
        if (equal !== 1'b0 || gt !== 1'b0 || lt !== 1'b1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: a = 11, b = 10
        a = 2'b11; b = 2'b10;
        #10;
        if (equal !== 1'b0 || gt !== 1'b1 || lt !== 1'b0) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // Test case 9: a = 10, b = 11
        a = 2'b10; b = 2'b11;
        #10;
        if (equal !== 1'b0 || gt !== 1'b0 || lt !== 1'b1) begin
            $display("FAIL: Test case 9 failed");
            $finish;
        end

        // Test case 10: a = 11, b = 11
        a = 2'b11; b = 2'b11;
        #10;
        if (equal !== 1'b1 || gt !== 1'b0 || lt !== 1'b0) begin
            $display("FAIL: Test case 10 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule