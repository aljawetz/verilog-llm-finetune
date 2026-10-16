`timescale 1ns/1ps

module tb_mul2;
    reg [2:0] a;
    wire [3:0] y;

    // Instantiate the module under test (uut)
    mul2 uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test cases
        a = 3'b000; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case a=0 failed, expected y=0000, got y=%b", y);
            $finish;
        end

        a = 3'b001; #10;
        if (y !== 4'b0010) begin
            $display("FAIL: Test case a=1 failed, expected y=0010, got y=%b", y);
            $finish;
        end

        a = 3'b010; #10;
        if (y !== 4'b0100) begin
            $display("FAIL: Test case a=2 failed, expected y=0100, got y=%b", y);
            $finish;
        end

        a = 3'b011; #10;
        if (y !== 4'b0110) begin
            $display("FAIL: Test case a=3 failed, expected y=0110, got y=%b", y);
            $finish;
        end

        a = 3'b100; #10;
        if (y !== 4'b1000) begin
            $display("FAIL: Test case a=4 failed, expected y=1000, got y=%b", y);
            $finish;
        end

        a = 3'b101; #10;
        if (y !== 4'b1010) begin
            $display("FAIL: Test case a=5 failed, expected y=1010, got y=%b", y);
            $finish;
        end

        a = 3'b110; #10;
        if (y !== 4'b1100) begin
            $display("FAIL: Test case a=6 failed, expected y=1100, got y=%b", y);
            $finish;
        end

        a = 3'b111; #10;
        if (y !== 4'b1110) begin
            $display("FAIL: Test case a=7 failed, expected y=1110, got y=%b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule