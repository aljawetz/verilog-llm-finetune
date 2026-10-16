`timescale 1ns/1ps

module tb_comparator;

    // Inputs
    reg [3:0] a;
    reg [3:0] b;

    // Outputs
    wire gt;
    wire lt;
    wire eq;

    // Instantiate the Unit Under Test (UUT)
    comparator uut (
        .a(a),
        .b(b),
        .gt(gt),
        .lt(lt),
        .eq(eq)
    );

    initial begin
        // Test case 1: a = 4'b0000, b = 4'b0000 (Equal)
        a = 4'b0000; b = 4'b0000;
        #10;
        if (gt !== 1'b0 || lt !== 1'b0 || eq !== 1'b1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: a = 4'b0001, b = 4'b0000 (Greater)
        a = 4'b0001; b = 4'b0000;
        #10;
        if (gt !== 1'b1 || lt !== 1'b0 || eq !== 1'b0) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: a = 4'b0000, b = 4'b0001 (Less)
        a = 4'b0000; b = 4'b0001;
        #10;
        if (gt !== 1'b0 || lt !== 1'b1 || eq !== 1'b0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: a = 4'b1111, b = 4'b1111 (Equal)
        a = 4'b1111; b = 4'b1111;
        #10;
        if (gt !== 1'b0 || lt !== 1'b0 || eq !== 1'b1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: a = 4'b1010, b = 4'b0101 (Greater)
        a = 4'b1010; b = 4'b0101;
        #10;
        if (gt !== 1'b1 || lt !== 1'b0 || eq !== 1'b0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: a = 4'b0101, b = 4'b1010 (Less)
        a = 4'b0101; b = 4'b1010;
        #10;
        if (gt !== 1'b0 || lt !== 1'b1 || eq !== 1'b0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule