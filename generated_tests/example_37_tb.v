`timescale 1ns/1ps

module tb_example;

    reg s;
    reg [31:0] A, B, C, D;
    wire [32:0] Z;

    // Instantiate the module under test
    example uut (
        .s(s),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .Z(Z)
    );

    initial begin
        // Test case 1: s = 1, A = 10, B = 20, C = 30, D = 40
        s = 1; A = 32'd10; B = 32'd20; C = 32'd30; D = 32'd40;
        #10;
        if (Z !== 32'd30) begin
            $display("FAIL: Test case 1 failed, expected Z = 30, got Z = %d", Z);
            $finish;
        end

        // Test case 2: s = 0, A = 10, B = 20, C = 30, D = 40
        s = 0; A = 32'd10; B = 32'd20; C = 32'd30; D = 32'd40;
        #10;
        if (Z !== 32'd70) begin
            $display("FAIL: Test case 2 failed, expected Z = 70, got Z = %d", Z);
            $finish;
        end

        // Test case 3: s = 1, A = 100, B = 200, C = 300, D = 400
        s = 1; A = 32'd100; B = 32'd200; C = 32'd300; D = 32'd400;
        #10;
        if (Z !== 32'd300) begin
            $display("FAIL: Test case 3 failed, expected Z = 300, got Z = %d", Z);
            $finish;
        end

        // Test case 4: s = 0, A = 100, B = 200, C = 300, D = 400
        s = 0; A = 32'd100; B = 32'd200; C = 32'd300; D = 32'd400;
        #10;
        if (Z !== 32'd700) begin
            $display("FAIL: Test case 4 failed, expected Z = 700, got Z = %d", Z);
            $finish;
        end

        // Test case 5: s = 1, A = 0, B = 0, C = 0, D = 0
        s = 1; A = 32'd0; B = 32'd0; C = 32'd0; D = 32'd0;
        #10;
        if (Z !== 32'd0) begin
            $display("FAIL: Test case 5 failed, expected Z = 0, got Z = %d", Z);
            $finish;
        end

        // Test case 6: s = 0, A = 0, B = 0, C = 0, D = 0
        s = 0; A = 32'd0; B = 32'd0; C = 32'd0; D = 32'd0;
        #10;
        if (Z !== 32'd0) begin
            $display("FAIL: Test case 6 failed, expected Z = 0, got Z = %d", Z);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule