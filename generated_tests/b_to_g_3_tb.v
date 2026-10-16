`timescale 1ns/1ps

module tb_b_to_g;

    reg [3:0] binary;
    wire [3:0] gray;

    // Instantiate the module under test (uut)
    b_to_g uut (
        .binary(binary),
        .gray(gray)
    );

    initial begin
        // Test cases
        // Test case 1: binary = 0000
        binary = 4'b0000; #10;
        if (gray !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected gray = 0000, got gray = %b", gray);
            $finish;
        end

        // Test case 2: binary = 0001
        binary = 4'b0001; #10;
        if (gray !== 4'b0001) begin
            $display("FAIL: Test case 2 failed, expected gray = 0001, got gray = %b", gray);
            $finish;
        end

        // Test case 3: binary = 0010
        binary = 4'b0010; #10;
        if (gray !== 4'b0011) begin
            $display("FAIL: Test case 3 failed, expected gray = 0011, got gray = %b", gray);
            $finish;
        end

        // Test case 4: binary = 0011
        binary = 4'b0011; #10;
        if (gray !== 4'b0010) begin
            $display("FAIL: Test case 4 failed, expected gray = 0010, got gray = %b", gray);
            $finish;
        end

        // Test case 5: binary = 0100
        binary = 4'b0100; #10;
        if (gray !== 4'b0110) begin
            $display("FAIL: Test case 5 failed, expected gray = 0110, got gray = %b", gray);
            $finish;
        end

        // Test case 6: binary = 0101
        binary = 4'b0101; #10;
        if (gray !== 4'b0111) begin
            $display("FAIL: Test case 6 failed, expected gray = 0111, got gray = %b", gray);
            $finish;
        end

        // Test case 7: binary = 0110
        binary = 4'b0110; #10;
        if (gray !== 4'b0101) begin
            $display("FAIL: Test case 7 failed, expected gray = 0101, got gray = %b", gray);
            $finish;
        end

        // Test case 8: binary = 0111
        binary = 4'b0111; #10;
        if (gray !== 4'b0100) begin
            $display("FAIL: Test case 8 failed, expected gray = 0100, got gray = %b", gray);
            $finish;
        end

        // Test case 9: binary = 1000
        binary = 4'b1000; #10;
        if (gray !== 4'b1100) begin
            $display("FAIL: Test case 9 failed, expected gray = 1100, got gray = %b", gray);
            $finish;
        end

        // Test case 10: binary = 1111
        binary = 4'b1111; #10;
        if (gray !== 4'b1000) begin
            $display("FAIL: Test case 10 failed, expected gray = 1000, got gray = %b", gray);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule