`timescale 1ns/1ps

module tb_barrel_shifter;
    reg [7:0] In;
    reg [2:0] n;
    reg Lr;
    wire [7:0] Out;

    // Instantiate the module under test (uut)
    barrel_shifter uut (
        .Out(Out),
        .In(In),
        .Lr(Lr),
        .n(n)
    );

    initial begin
        // Test case 1: Shift left by 1
        In = 8'b00000001; Lr = 1; n = 3'b001; #10;
        if (Out !== 8'b00000010) begin
            $display("FAIL: Test case 1 failed, expected 00000010, got %b", Out);
            $finish;
        end

        // Test case 2: Shift left by 2
        In = 8'b00000001; Lr = 1; n = 3'b010; #10;
        if (Out !== 8'b00000100) begin
            $display("FAIL: Test case 2 failed, expected 00000100, got %b", Out);
            $finish;
        end

        // Test case 3: Shift right by 1
        In = 8'b00000010; Lr = 0; n = 3'b001; #10;
        if (Out !== 8'b00000001) begin
            $display("FAIL: Test case 3 failed, expected 00000001, got %b", Out);
            $finish;
        end

        // Test case 4: Shift right by 2
        In = 8'b00000100; Lr = 0; n = 3'b010; #10;
        if (Out !== 8'b00000001) begin
            $display("FAIL: Test case 4 failed, expected 00000001, got %b", Out);
            $finish;
        end

        // Test case 5: Shift left by 3 (maximum shift)
        In = 8'b00000001; Lr = 1; n = 3'b011; #10;
        if (Out !== 8'b00001000) begin
            $display("FAIL: Test case 5 failed, expected 00001000, got %b", Out);
            $finish;
        end

        // Test case 6: Shift right by 3 (maximum shift)
        In = 8'b00001000; Lr = 0; n = 3'b011; #10;
        if (Out !== 8'b00000001) begin
            $display("FAIL: Test case 6 failed, expected 00000001, got %b", Out);
            $finish;
        end

        // Test case 7: Shift left by 7 (overflow)
        In = 8'b00000001; Lr = 1; n = 3'b111; #10;
        if (Out !== 8'b10000000) begin
            $display("FAIL: Test case 7 failed, expected 10000000, got %b", Out);
            $finish;
        end

        // Test case 8: Shift right by 7 (overflow)
        In = 8'b10000000; Lr = 0; n = 3'b111; #10;
        if (Out !== 8'b00000001) begin
            $display("FAIL: Test case 8 failed, expected 00000001, got %b", Out);
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule