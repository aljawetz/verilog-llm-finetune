`timescale 1ns/1ps

module tb_comparator_4bit;

    reg [3:0] a;
    reg [3:0] b;
    wire equal;
    wire grt;
    wire lst;

    // Instantiate the module under test (uut)
    comparator_4bit uut (
        .a(a),
        .b(b),
        .equal(equal),
        .grt(grt),
        .lst(lst)
    );

    initial begin
        // Test case 1: a = 4'b0000, b = 4'b0000 (equal)
        a = 4'b0000; b = 4'b0000;
        #10;
        if (!(equal && !grt && !lst)) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: a = 4'b0001, b = 4'b0000 (greater)
        a = 4'b0001; b = 4'b0000;
        #10;
        if (!(equal == 0 && grt == 1 && lst == 0)) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: a = 4'b0000, b = 4'b0001 (less)
        a = 4'b0000; b = 4'b0001;
        #10;
        if (!(equal == 0 && grt == 0 && lst == 1)) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: a = 4'b1111, b = 4'b1111 (equal)
        a = 4'b1111; b = 4'b1111;
        #10;
        if (!(equal && !grt && !lst)) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: a = 4'b1110, b = 4'b1111 (less)
        a = 4'b1110; b = 4'b1111;
        #10;
        if (!(equal == 0 && grt == 0 && lst == 1)) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: a = 4'b1111, b = 4'b1110 (greater)
        a = 4'b1111; b = 4'b1110;
        #10;
        if (!(equal == 0 && grt == 1 && lst == 0)) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: a = 4'b1010, b = 4'b0101 (greater)
        a = 4'b1010; b = 4'b0101;
        #10;
        if (!(equal == 0 && grt == 1 && lst == 0)) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: a = 4'b0101, b = 4'b1010 (less)
        a = 4'b0101; b = 4'b1010;
        #10;
        if (!(equal == 0 && grt == 0 && lst == 1)) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule