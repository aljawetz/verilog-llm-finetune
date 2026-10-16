`timescale 1ns/1ps

module tb_sl2;

    reg [31:0] a;
    wire [31:0] y;

    // Instantiate the module under test (uut)
    sl2 uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test case 1: a = 32'h00000001
        a = 32'h00000001; #10;
        if (y !== 32'h00000004) begin
            $display("FAIL: Test case 1 failed, expected 0x00000004, got 0x%08h", y);
            $finish;
        end

        // Test case 2: a = 32'h00000002
        a = 32'h00000002; #10;
        if (y !== 32'h00000008) begin
            $display("FAIL: Test case 2 failed, expected 0x00000008, got 0x%08h", y);
            $finish;
        end

        // Test case 3: a = 32'hFFFFFFFF
        a = 32'hFFFFFFFF; #10;
        if (y !== 32'hFFFFFFFC) begin
            $display("FAIL: Test case 3 failed, expected 0xFFFFFFFC, got 0x%08h", y);
            $finish;
        end

        // Test case 4: a = 32'h00000000
        a = 32'h00000000; #10;
        if (y !== 32'h00000000) begin
            $display("FAIL: Test case 4 failed, expected 0x00000000, got 0x%08h", y);
            $finish;
        end

        // Test case 5: a = 32'h80000000
        a = 32'h80000000; #10;
        if (y !== 32'h00000000) begin
            $display("FAIL: Test case 5 failed, expected 0x00000000, got 0x%08h", y);
            $finish;
        end

        // Test case 6: a = 32'h7FFFFFFF
        a = 32'h7FFFFFFF; #10;
        if (y !== 32'hFFFFFFFC) begin
            $display("FAIL: Test case 6 failed, expected 0xFFFFFFFC, got 0x%08h", y);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule