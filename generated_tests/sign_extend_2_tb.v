`timescale 1ns/1ps

module tb_sign_extend;

    reg [15:0] a;
    wire [31:0] y;

    // Instantiate the module under test (uut)
    sign_extend uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test case 1: Positive number
        a = 16'b0000_0000_0000_0001; // 1 in decimal
        #10;
        if (y !== 32'b0000_0000_0000_0000_0000_0000_0000_0001) begin
            $display("FAIL: Test case 1 failed, expected %b, got %b", 32'b0000_0000_0000_0000_0000_0000_0000_0001, y);
            $finish;
        end

        // Test case 2: Negative number
        a = 16'b1111_1111_1111_1111; // -1 in decimal
        #10;
        if (y !== 32'b1111_1111_1111_1111_1111_1111_1111_1111) begin
            $display("FAIL: Test case 2 failed, expected %b, got %b", 32'b1111_1111_1111_1111_1111_1111_1111_1111, y);
            $finish;
        end

        // Test case 3: Zero
        a = 16'b0000_0000_0000_0000; // 0 in decimal
        #10;
        if (y !== 32'b0000_0000_0000_0000_0000_0000_0000_0000) begin
            $display("FAIL: Test case 3 failed, expected %b, got %b", 32'b0000_0000_0000_0000_0000_0000_0000_0000, y);
            $finish;
        end

        // Test case 4: Positive number with higher bits
        a = 16'b0111_1111_1111_1111; // 32767 in decimal
        #10;
        if (y !== 32'b0000_0000_0000_0000_0000_0111_1111_1111_1111) begin
            $display("FAIL: Test case 4 failed, expected %b, got %b", 32'b0000_0000_0000_0000_0000_0111_1111_1111_1111, y);
            $finish;
        end

        // Test case 5: Negative number with higher bits
        a = 16'b1000_0000_0000_0000; // -32768 in decimal
        #10;
        if (y !== 32'b1111_1111_1111_1111_1111_1111_1000_0000_0000_0000) begin
            $display("FAIL: Test case 5 failed, expected %b, got %b", 32'b1111_1111_1111_1111_1111_1111_1000_0000_0000_0000, y);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule