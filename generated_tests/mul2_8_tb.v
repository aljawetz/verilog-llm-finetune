`timescale 1ns/1ps

module tb_mul2;
    reg [2:0] a;
    wire [3:0] y;

    // Instantiate the module under test
    mul2 uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test case 1: a = 0
        a = 3'b000; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected 0000, got %b", y);
            $finish;
        end

        // Test case 2: a = 1
        a = 3'b001; #10;
        if (y !== 4'b0010) begin
            $display("FAIL: Test case 2 failed, expected 0010, got %b", y);
            $finish;
        end

        // Test case 3: a = 2
        a = 3'b010; #10;
        if (y !== 4'b0100) begin
            $display("FAIL: Test case 3 failed, expected 0100, got %b", y);
            $finish;
        end

        // Test case 4: a = 3
        a = 3'b011; #10;
        if (y !== 4'b0110) begin
            $display("FAIL: Test case 4 failed, expected 0110, got %b", y);
            $finish;
        end

        // Test case 5: a = 4
        a = 3'b100; #10;
        if (y !== 4'b1000) begin
            $display("FAIL: Test case 5 failed, expected 1000, got %b", y);
            $finish;
        end

        // Test case 6: a = 5
        a = 3'b101; #10;
        if (y !== 4'b1010) begin
            $display("FAIL: Test case 6 failed, expected 1010, got %b", y);
            $finish;
        end

        // Test case 7: a = 6
        a = 3'b110; #10;
        if (y !== 4'b1100) begin
            $display("FAIL: Test case 7 failed, expected 1100, got %b", y);
            $finish;
        end

        // Test case 8: a = 7
        a = 3'b111; #10;
        if (y !== 4'b1110) begin
            $display("FAIL: Test case 8 failed, expected 1110, got %b", y);
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule