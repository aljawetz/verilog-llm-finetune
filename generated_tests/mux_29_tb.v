`timescale 1ns/1ps

module tb_mux;

    reg [1:0] A;
    reg [1:0] B;
    reg S;
    wire [1:0] OUT;

    // Instantiate the module under test (uut)
    mux uut (
        .A(A),
        .B(B),
        .S(S),
        .OUT(OUT)
    );

    initial begin
        // Test case 1: Select A when S = 0
        A = 2'b01; B = 2'b10; S = 1'b0;
        #10;
        if (OUT !== A) begin
            $display("FAIL: Test case 1 failed, expected OUT = %b, got OUT = %b", A, OUT);
            $finish;
        end

        // Test case 2: Select B when S = 1
        A = 2'b01; B = 2'b10; S = 1'b1;
        #10;
        if (OUT !== B) begin
            $display("FAIL: Test case 2 failed, expected OUT = %b, got OUT = %b", B, OUT);
            $finish;
        end

        // Test case 3: Select A when S = 0 with different values
        A = 2'b11; B = 2'b00; S = 1'b0;
        #10;
        if (OUT !== A) begin
            $display("FAIL: Test case 3 failed, expected OUT = %b, got OUT = %b", A, OUT);
            $finish;
        end

        // Test case 4: Select B when S = 1 with different values
        A = 2'b11; B = 2'b00; S = 1'b1;
        #10;
        if (OUT !== B) begin
            $display("FAIL: Test case 4 failed, expected OUT = %b, got OUT = %b", B, OUT);
            $finish;
        end

        // Test case 5: Edge case with both inputs same
        A = 2'b01; B = 2'b01; S = 1'b0;
        #10;
        if (OUT !== A) begin
            $display("FAIL: Test case 5 failed, expected OUT = %b, got OUT = %b", A, OUT);
            $finish;
        end

        S = 1'b1;
        #10;
        if (OUT !== B) begin
            $display("FAIL: Test case 5 failed, expected OUT = %b, got OUT = %b", B, OUT);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule