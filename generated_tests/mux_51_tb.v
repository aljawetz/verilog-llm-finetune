`timescale 1ns/1ps

module tb_mux;

    // Testbench signals
    reg [1:0] A;
    reg [1:0] B;
    reg S;
    wire [1:0] Y;

    // Instantiate the module under test (uut)
    mux uut (
        .A(A),
        .B(B),
        .S(S),
        .Y(Y)
    );

    initial begin
        // Test case 1: S = 0, expect Y = A
        A = 2'b01; B = 2'b10; S = 1'b0;
        #10;
        if (Y !== A) begin
            $display("FAIL: Test case 1 failed, expected Y = %b, got Y = %b", A, Y);
            $finish;
        end

        // Test case 2: S = 1, expect Y = B
        A = 2'b01; B = 2'b10; S = 1'b1;
        #10;
        if (Y !== B) begin
            $display("FAIL: Test case 2 failed, expected Y = %b, got Y = %b", B, Y);
            $finish;
        end

        // Test case 3: S = 0, different values for A
        A = 2'b11; B = 2'b00; S = 1'b0;
        #10;
        if (Y !== A) begin
            $display("FAIL: Test case 3 failed, expected Y = %b, got Y = %b", A, Y);
            $finish;
        end

        // Test case 4: S = 1, different values for B
        A = 2'b11; B = 2'b00; S = 1'b1;
        #10;
        if (Y !== B) begin
            $display("FAIL: Test case 4 failed, expected Y = %b, got Y = %b", B, Y);
            $finish;
        end

        // Test case 5: S = 0, edge case
        A = 2'b00; B = 2'b11; S = 1'b0;
        #10;
        if (Y !== A) begin
            $display("FAIL: Test case 5 failed, expected Y = %b, got Y = %b", A, Y);
            $finish;
        end

        // Test case 6: S = 1, edge case
        A = 2'b00; B = 2'b11; S = 1'b1;
        #10;
        if (Y !== B) begin
            $display("FAIL: Test case 6 failed, expected Y = %b, got Y = %b", B, Y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule