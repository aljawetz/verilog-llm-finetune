`timescale 1ns/1ps

module tb_btog;

    reg [3:0] a;
    wire [3:0] y;

    // Instantiate the module under test (uut)
    btog uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test case 1
        a = 4'b0000; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected y = 0000, got y = %b", y);
            $finish;
        end

        // Test case 2
        a = 4'b0001; #10;
        if (y !== 4'b0001) begin
            $display("FAIL: Test case 2 failed, expected y = 0001, got y = %b", y);
            $finish;
        end

        // Test case 3
        a = 4'b0011; #10;
        if (y !== 4'b0010) begin
            $display("FAIL: Test case 3 failed, expected y = 0010, got y = %b", y);
            $finish;
        end

        // Test case 4
        a = 4'b0111; #10;
        if (y !== 4'b0100) begin
            $display("FAIL: Test case 4 failed, expected y = 0100, got y = %b", y);
            $finish;
        end

        // Test case 5
        a = 4'b1111; #10;
        if (y !== 4'b1000) begin
            $display("FAIL: Test case 5 failed, expected y = 1000, got y = %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule