`timescale 1ns/1ps

module tb_encoder4x2;

    reg [3:0] I;
    wire [1:0] Y;
    wire V;

    encoder4x2 uut (
        .I(I),
        .Y(Y),
        .V(V)
    );

    initial begin
        // Test case 1: No inputs active
        I = 4'b0000; #10;
        if (Y !== 2'b00 || V !== 1'b0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Only input 0 active
        I = 4'b0001; #10;
        if (Y !== 2'b00 || V !== 1'b1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Only input 1 active
        I = 4'b0010; #10;
        if (Y !== 2'b01 || V !== 1'b1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Only input 2 active
        I = 4'b0100; #10;
        if (Y !== 2'b10 || V !== 1'b1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Only input 3 active
        I = 4'b1000; #10;
        if (Y !== 2'b11 || V !== 1'b1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: Multiple inputs active (input 3 has highest priority)
        I = 4'b1100; #10;
        if (Y !== 2'b11 || V !== 1'b1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: Multiple inputs active (input 2 has highest priority)
        I = 4'b0110; #10;
        if (Y !== 2'b10 || V !== 1'b1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        // Test case 8: Multiple inputs active (input 1 has highest priority)
        I = 4'b0011; #10;
        if (Y !== 2'b01 || V !== 1'b1) begin
            $display("FAIL: Test case 8 failed");
            $finish;
        end

        // Test case 9: All inputs active
        I = 4'b1111; #10;
        if (Y !== 2'b11 || V !== 1'b1) begin
            $display("FAIL: Test case 9 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule