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
        // Test case 1: Left shift by 1
        In = 8'b00000001; // Input value
        n = 3'b001;      // Shift amount
        Lr = 1'b1;       // Left shift
        #10;
        if (Out !== 8'b00000010) begin
            $display("FAIL: Test case 1 failed, expected 00000010, got %b", Out);
            $finish;
        end

        // Test case 2: Left shift by 3
        In = 8'b00000001; // Input value
        n = 3'b011;      // Shift amount
        Lr = 1'b1;       // Left shift
        #10;
        if (Out !== 8'b00001000) begin
            $display("FAIL: Test case 2 failed, expected 00001000, got %b", Out);
            $finish;
        end

        // Test case 3: Right shift by 1
        In = 8'b00000010; // Input value
        n = 3'b001;      // Shift amount
        Lr = 1'b0;       // Right shift
        #10;
        if (Out !== 8'b00000001) begin
            $display("FAIL: Test case 3 failed, expected 00000001, got %b", Out);
            $finish;
        end

        // Test case 4: Right shift by 2
        In = 8'b00000100; // Input value
        n = 3'b010;      // Shift amount
        Lr = 1'b0;       // Right shift
        #10;
        if (Out !== 8'b00000001) begin
            $display("FAIL: Test case 4 failed, expected 00000001, got %b", Out);
            $finish;
        end

        // Test case 5: Left shift with overflow
        In = 8'b10000000; // Input value
        n = 3'b001;      // Shift amount
        Lr = 1'b1;       // Left shift
        #10;
        if (Out !== 8'b00000000) begin
            $display("FAIL: Test case 5 failed, expected 00000000, got %b", Out);
            $finish;
        end

        // Test case 6: Right shift with zero fill
        In = 8'b00000001; // Input value
        n = 3'b100;      // Shift amount
        Lr = 1'b0;       // Right shift
        #10;
        if (Out !== 8'b00000000) begin
            $display("FAIL: Test case 6 failed, expected 00000000, got %b", Out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule