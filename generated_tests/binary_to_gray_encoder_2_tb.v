`timescale 1ns/1ps

module tb_binary_to_gray_encoder;

    reg [3:0] binary;
    wire [3:0] gray;

    // Instantiate the module under test (uut)
    binary_to_gray_encoder uut (
        .binary(binary),
        .gray(gray)
    );

    initial begin
        // Test cases
        // Test case 0: binary 0000 -> gray 0000
        binary = 4'b0000; #10;
        if (gray !== 4'b0000) begin
            $display("FAIL: Expected gray 0000 for binary 0000, got %b", gray);
            $finish;
        end

        // Test case 1: binary 0001 -> gray 0001
        binary = 4'b0001; #10;
        if (gray !== 4'b0001) begin
            $display("FAIL: Expected gray 0001 for binary 0001, got %b", gray);
            $finish;
        end

        // Test case 2: binary 0010 -> gray 0011
        binary = 4'b0010; #10;
        if (gray !== 4'b0011) begin
            $display("FAIL: Expected gray 0011 for binary 0010, got %b", gray);
            $finish;
        end

        // Test case 3: binary 0011 -> gray 0010
        binary = 4'b0011; #10;
        if (gray !== 4'b0010) begin
            $display("FAIL: Expected gray 0010 for binary 0011, got %b", gray);
            $finish;
        end

        // Test case 4: binary 0100 -> gray 0110
        binary = 4'b0100; #10;
        if (gray !== 4'b0110) begin
            $display("FAIL: Expected gray 0110 for binary 0100, got %b", gray);
            $finish;
        end

        // Test case 5: binary 0101 -> gray 0111
        binary = 4'b0101; #10;
        if (gray !== 4'b0111) begin
            $display("FAIL: Expected gray 0111 for binary 0101, got %b", gray);
            $finish;
        end

        // Test case 6: binary 0110 -> gray 0101
        binary = 4'b0110; #10;
        if (gray !== 4'b0101) begin
            $display("FAIL: Expected gray 0101 for binary 0110, got %b", gray);
            $finish;
        end

        // Test case 7: binary 0111 -> gray 0100
        binary = 4'b0111; #10;
        if (gray !== 4'b0100) begin
            $display("FAIL: Expected gray 0100 for binary 0111, got %b", gray);
            $finish;
        end

        // Test case 8: binary 1000 -> gray 1100
        binary = 4'b1000; #10;
        if (gray !== 4'b1100) begin
            $display("FAIL: Expected gray 1100 for binary 1000, got %b", gray);
            $finish;
        end

        // Test case 9: binary 1001 -> gray 1101
        binary = 4'b1001; #10;
        if (gray !== 4'b1101) begin
            $display("FAIL: Expected gray 1101 for binary 1001, got %b", gray);
            $finish;
        end

        // Test case 10: binary 1010 -> gray 1111
        binary = 4'b1010; #10;
        if (gray !== 4'b1111) begin
            $display("FAIL: Expected gray 1111 for binary 1010, got %b", gray);
            $finish;
        end

        // Test case 11: binary 1011 -> gray 1110
        binary = 4'b1011; #10;
        if (gray !== 4'b1110) begin
            $display("FAIL: Expected gray 1110 for binary 1011, got %b", gray);
            $finish;
        end

        // Test case 12: binary 1100 -> gray 1010
        binary = 4'b1100; #10;
        if (gray !== 4'b1010) begin
            $display("FAIL: Expected gray 1010 for binary 1100, got %b", gray);
            $finish;
        end

        // Test case 13: binary 1101 -> gray 1011
        binary = 4'b1101; #10;
        if (gray !== 4'b1011) begin
            $display("FAIL: Expected gray 1011 for binary 1101, got %b", gray);
            $finish;
        end

        // Test case 14: binary 1110 -> gray 1001
        binary = 4'b1110; #10;
        if (gray !== 4'b1001) begin
            $display("FAIL: Expected gray 1001 for binary 1110, got %b", gray);
            $finish;
        end

        // Test case 15: binary 1111 -> gray 1000
        binary = 4'b1111; #10;
        if (gray !== 4'b1000) begin
            $display("FAIL: Expected gray 1000 for binary 1111, got %b", gray);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule