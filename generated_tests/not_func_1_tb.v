`timescale 1ns/1ps

module tb_not_func;

    // Inputs
    reg [7:0] in1;
    reg [7:0] in2;

    // Outputs
    wire [7:0] out;

    // Instantiate the module under test (uut)
    not_func uut (
        .in1(in1),
        .in2(in2),
        .out(out)
    );

    initial begin
        // Test case 1: in1 = 8'b00000000
        in1 = 8'b00000000;
        in2 = 8'b11111111; // Ignored
        #10;
        if (out !== 8'b11111111) begin
            $display("FAIL: Test case 1 failed, expected 8'b11111111 but got %b", out);
            $finish;
        end

        // Test case 2: in1 = 8'b11111111
        in1 = 8'b11111111;
        in2 = 8'b00000000; // Ignored
        #10;
        if (out !== 8'b00000000) begin
            $display("FAIL: Test case 2 failed, expected 8'b00000000 but got %b", out);
            $finish;
        end

        // Test case 3: in1 = 8'b10101010
        in1 = 8'b10101010;
        in2 = 8'b01010101; // Ignored
        #10;
        if (out !== 8'b01010101) begin
            $display("FAIL: Test case 3 failed, expected 8'b01010101 but got %b", out);
            $finish;
        end

        // Test case 4: in1 = 8'b00110011
        in1 = 8'b00110011;
        in2 = 8'b11001100; // Ignored
        #10;
        if (out !== 8'b11001100) begin
            $display("FAIL: Test case 4 failed, expected 8'b11001100 but got %b", out);
            $finish;
        end

        // Test case 5: in1 = 8'b00001111
        in1 = 8'b00001111;
        in2 = 8'b11110000; // Ignored
        #10;
        if (out !== 8'b11110000) begin
            $display("FAIL: Test case 5 failed, expected 8'b11110000 but got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule