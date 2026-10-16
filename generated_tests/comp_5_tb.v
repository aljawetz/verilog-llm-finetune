`timescale 1ns/1ps

module tb_comp;

    reg [3:0] in_1;
    reg [3:0] in_2;
    wire equal;
    wire less;
    wire great;

    // Instantiate the module under test
    comp uut (
        .in_1(in_1),
        .in_2(in_2),
        .equal(equal),
        .less(less),
        .great(great)
    );

    initial begin
        // Test case 1: in_1 == in_2
        in_1 = 4'b1010; // 10
        in_2 = 4'b1010; // 10
        #10;
        if (equal !== 1 || less !== 0 || great !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: in_1 < in_2
        in_1 = 4'b0010; // 2
        in_2 = 4'b0100; // 4
        #10;
        if (equal !== 0 || less !== 1 || great !== 0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: in_1 > in_2
        in_1 = 4'b0110; // 6
        in_2 = 4'b0011; // 3
        #10;
        if (equal !== 0 || less !== 0 || great !== 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: in_1 < in_2 (different values)
        in_1 = 4'b0001; // 1
        in_2 = 4'b0010; // 2
        #10;
        if (equal !== 0 || less !== 1 || great !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: in_1 > in_2 (different values)
        in_1 = 4'b1111; // 15
        in_2 = 4'b0000; // 0
        #10;
        if (equal !== 0 || less !== 0 || great !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule