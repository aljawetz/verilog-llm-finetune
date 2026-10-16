`timescale 1ns/1ps

module tb_bit3C;

    reg [2:0] A;
    reg [2:0] B;
    wire equals;
    wire greater;
    wire lesser;

    // Instantiate the module under test
    bit3C uut (
        .A(A),
        .B(B),
        .equals(equals),
        .greater(greater),
        .lesser(lesser)
    );

    initial begin
        // Test case 1: A = 3'b000, B = 3'b000 (Equal)
        A = 3'b000; B = 3'b000;
        #10;
        if (!(equals && !greater && !lesser)) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: A = 3'b001, B = 3'b000 (A > B)
        A = 3'b001; B = 3'b000;
        #10;
        if (!(!equals && greater && !lesser)) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: A = 3'b000, B = 3'b001 (A < B)
        A = 3'b000; B = 3'b001;
        #10;
        if (!(!equals && !greater && lesser)) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: A = 3'b010, B = 3'b010 (Equal)
        A = 3'b010; B = 3'b010;
        #10;
        if (!(equals && !greater && !lesser)) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: A = 3'b111, B = 3'b100 (A > B)
        A = 3'b111; B = 3'b100;
        #10;
        if (!(!equals && greater && !lesser)) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: A = 3'b100, B = 3'b111 (A < B)
        A = 3'b100; B = 3'b111;
        #10;
        if (!(!equals && !greater && lesser)) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule