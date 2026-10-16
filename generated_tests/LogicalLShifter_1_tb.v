`timescale 1ns/1ps

module tb_LogicalLShifter;

    reg [15:0] In;
    reg [3:0] Cnt;
    wire [15:0] Out;

    // Instantiate the module under test (uut)
    LogicalLShifter uut (
        .In(In),
        .Cnt(Cnt),
        .Out(Out)
    );

    initial begin
        // Test case 1: Shift by 1
        In = 16'b0000000000000001; Cnt = 4'b0001; #10;
        if (Out !== 16'b0000000000000010) $display("FAIL: Test case 1 failed, expected 0000000000000010, got %b", Out);

        // Test case 2: Shift by 2
        In = 16'b0000000000000001; Cnt = 4'b0010; #10;
        if (Out !== 16'b0000000000000100) $display("FAIL: Test case 2 failed, expected 0000000000000100, got %b", Out);

        // Test case 3: Shift by 4
        In = 16'b0000000000000001; Cnt = 4'b0100; #10;
        if (Out !== 16'b0000000000010000) $display("FAIL: Test case 3 failed, expected 0000000000010000, got %b", Out);

        // Test case 4: Shift by 8
        In = 16'b0000000000000001; Cnt = 4'b1000; #10;
        if (Out !== 16'b0000000100000000) $display("FAIL: Test case 4 failed, expected 0000000100000000, got %b", Out);

        // Test case 5: No shift
        In = 16'b0000000000000001; Cnt = 4'b0000; #10;
        if (Out !== 16'b0000000000000001) $display("FAIL: Test case 5 failed, expected 0000000000000001, got %b", Out);

        // Test case 6: Multiple shifts
        In = 16'b0000000000000001; Cnt = 4'b1111; #10;
        if (Out !== 16'b1000000000000000) $display("FAIL: Test case 6 failed, expected 1000000000000000, got %b", Out);

        // Test case 7: Shift with zero input
        In = 16'b0000000000000000; Cnt = 4'b0011; #10;
        if (Out !== 16'b0000000000000000) $display("FAIL: Test case 7 failed, expected 0000000000000000, got %b", Out);

        // Test case 8: Shift with maximum input
        In = 16'b1111111111111111; Cnt = 4'b0010; #10;
        if (Out !== 16'b1111111111111100) $display("FAIL: Test case 8 failed, expected 1111111111111100, got %b", Out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule